 --------------------------- MODULE ConferenceProcFS--------------------------
(***************************************************************************)
(* The specification describes intercation of the conference system's      *)
(* users with a database via a set of PL/SQL stored procedures and         *)
(* functions.  The set of program units can be presented as follows:       *)
(*                                                                         *)
(* f_getsubmissions (c_id number) return varray of PAPERS%rowtype          *)
(* f_getaccepted (c_id number) return varray of PAPERS%                    *)
(* f_getsection_program (s_id number) return varray of PAPERS%rowtype      *)
(* f_getpaper (p_id number) return PAPERS%rowtype                          *)
(*                                                                         *)
(* p_submit_paper (s_id number, p_id number, c_id number, sub_date date,   *)
(* stat number) p_allocate (id number, p_id number, s_id number,           *)
(* alloc_date date) p_chahge_status (s_id number, stat number) p_add_paper *)
(* (p_id number, tit varchar, abstr varchar, auth varchar, t clob).        *)
(*                                                                         *)
(* Outputs, inputs and vars are defined as follows:                        *)
(*                                                                         *)
(* inputs = {p_sp_p1, p_a_p1, f_gsp_p1,...}                                 *)
(*                                                                         *)
(* outpus = {f_gsp_r, o_a_o1...}                                            *)
(*                                                                         *)
(* vars = {papers_t, allocations_t, submissions_t, conferences_t, e_a_e1,  *)
(* sections_t, p_a_v1, f_gs_v1,...}                                        *)
(***************************************************************************)

EXTENDS RuntimeFS

RECURSIVE dispatch(_,_)
       
(***************************************************************************)
(* p_submit_paper definition                                               *)
(***************************************************************************)

p_submit_paper_load(id) ==
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                                          <<[val |-> UsedNats + 1]>>]                
    /\ UsedNats'  = UsedNats + 1
    /\ Ignore'    = 0
    /\ UNCHANGED  <<StateP, StateE, New2Old, S, TabLocks, VPol, SLocks>>
    
p_submit_paper4(id) ==
    IF  TabLocks["submissions_t"] = NONE
        THEN
             /\  TabLocks' = [TabLocks EXCEPT !["submissions_t"] = id]
             /\  store(id, [loc |-> submissions_t.loc, offs |-> 
                      FindFirstInSeq(LAMBDA v: v.val = Undef, 
                            SubSeq(StateP, submissions_t.offs + 1, 
                                  submissions_t.offs + submissions_t.size)) 
                                + submissions_t.offs + 1],
                load(id,[loc |-> p_sp_p1.loc, offs |-> p_sp_p1.offs]), 
                <<max,p_sp_p1.policy>>,<<[pc |-> <<"p_submit_paper","exit">>,
                                                fp |-> 1]>>, "submissions_t")
             /\ Trace' = Append(Trace, <<id, "p_submit_paper4">>) \* \o " -> p_submit_paper4")
             /\ UNCHANGED  <<StateE, UsedNats, S, SLocks, Ignore>>
         ELSE UNCHANGED vars 
         
(***************************************************************************)
(* On a procedure (function) exit we must remove all temporary locks (IF   *)
(* locks) accumulated during program module execution, also we need to     *)
(* release all exclusive locks on tables and save the return value if any. *)
(* Ignore flag might be substantial due to possible ifc policy violation   *)
(* which may occure as a result of state locks release.                    *)
(***************************************************************************)
         
p_submit_paper_exit(id) == 
    /\ StateE' = [x \in {x1 \in DOMAIN StateE : x1 \in E1} |-> 
                    (StateE[x] \ SLocks[id][x])] @@
                 [x \in {x1 \in DOMAIN StateE : x1 \in E0} |-> 
                            IF SLocks[id][x] = {} 
                                THEN {NONE} 
                                ELSE StateE[x]]                                                
    /\ Sessions'  = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
                 Tail(Sessions[id]["StateRegs"]) \o <<>>]
    /\ TabLocks' = [TabLocks EXCEPT !["submissions_t"] = NONE]
    /\ Trace' = Append(Trace, <<id, "p_submit_paper_exit">>) \* \o " -> p_submit_paper_exit")
    /\ Ignore'= 1
    /\ UNCHANGED <<StateP, UsedNats, New2Old, S, VPol, SLocks>>

p_submit_paper(id,st)  ==
    CASE Head(st).pc[2] = "lbl_4"   -> p_submit_paper4(id)
    [] Head(st).pc[2]   = "exit"    -> p_submit_paper_exit(id)
    [] OTHER -> UNCHANGED vars
    

(***************************************************************************)
(* p_allocate procedure definition.                                        *)
(* p_allocate12 is required to restore a pclabel after returning from IF   *)
(* construct                                                               *)
(***************************************************************************)

p_allocate_load(id) ==
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                          <<[val |-> UsedNats + 1], [val |-> Undef], 
                            [val |-> UsedNats + 2], [val |-> Undef]>>]
    /\ UsedNats'  = UsedNats + 2
    /\ Ignore'    = 1
    /\ UNCHANGED  <<StateP, StateE, New2Old, S, TabLocks, VPol, SLocks>>
            
p_allocate6(id) ==
  IF /\TabLocks["submissions_t"] = NONE
     /\IsNotSeqEmpty(SubSeq(StateP, submissions_t.offs + 1, 
                                submissions_t.offs + submissions_t.size))
        THEN
            /\ store(id, [loc |-> p_a_v1.loc, offs |-> p_a_v1.offs],
                 load(id,[loc |-> p_a_c1.loc, offs |-> p_a_c1.offs]), 
                 <<max, LUB(VPol.submissions_t, p_a_c1.policy)>>,
                 <<[pc |-> <<"p_allocate", "lbl_9">>, fp |-> 1]>>,
                 "p_a_v1")
            /\ Trace' = Append(Trace, <<id,"p_allocate6">>) \* \o " -> p_allocate6")
            /\ UNCHANGED  <<StateP, StateE, 
                    UsedNats, S, TabLocks, SLocks, Ignore>>
        ELSE UNCHANGED vars
    
p_allocate9(id) == 
    /\ if(id, Sessions[id]["VPol"]["p_a_v1"], 
                  <<[pc |-> <<"p_allocate", "lbl_10_12">>, fp |-> 1]>>)
    /\ Trace' = Append(Trace, <<id,"p_allocate9">>) \*  \o " -> p_allocate9")          
\*  /\ openLock ([t_expire |-> {}])
    /\ UNCHANGED  <<StateP, StateE, 
            UsedNats, New2Old, S, TabLocks, VPol, SLocks, Ignore>>

p_allocate10_12(id) == 
    IF TabLocks["allocations_t"] = NONE
       THEN 
         /\ TabLocks' = [TabLocks EXCEPT !["allocations_t"] = id]
         /\ IsNotSeqEmpty (SubSeq(StateP, submissions_t.offs + 1, 
                                submissions_t.offs + submissions_t.size))
         /\ \/ /\ store(id, [loc |-> allocations_t.loc, offs |-> 
                      FindFirstInSeq(LAMBDA v: v.val = Undef, 
                        SubSeq(StateP, allocations_t.offs + 1, 
                            allocations_t.offs + allocations_t.size)) 
                            + allocations_t.offs + 1],
                 load(id,[loc |-> p_a_p1.loc, offs |-> p_a_p1.offs]), 
                 <<max, p_a_p1.policy>>, 
                 <<[pc |-> <<"p_allocate", "lbl_12">>, fp |-> 1]>>, 
                 "allocations_t")
               /\ Trace' = Append(Trace, <<id, "p_allocate10_12_if">>) \* \o " -> p_allocate10_12_if")
               /\ UNCHANGED  <<StateE, UsedNats, S, SLocks, Ignore>>
            \/ 
               /\ store(id, [loc |-> p_a_e1.loc, offs |-> p_a_e1.offs],
                  [val |-> UsedNats + 1], <<max, min>>,
                  <<[pc |-> <<"p_allocate", "lbl_15">>, fp |-> 1]>>,
                 "p_a_e1")
             \*/\ skip(id,<<[pc |-> <<"p_allocate", "lbl_12">>,fp |-> 1]>>)
               /\ Trace' = Append(Trace, <<id,"p_allocate10_12_else">>) \* \o " -> p_allocate10_12_else")
               /\ UsedNats' = UsedNats + 1
               /\ UNCHANGED  <<StateP, StateE, S, SLocks, Ignore>>       
       ELSE UNCHANGED vars
            
p_allocate12(id) == 
    /\ ifend(id, <<[pc |-> <<"p_allocate", "exit">>,fp |-> 1]>>)
    /\ Trace' = Append(Trace, <<id, "p_allocate12">>) \* \o " -> p_allocate12")
    /\ UNCHANGED  <<StateP, StateE, 
            UsedNats, New2Old, S, VPol, TabLocks, SLocks, Ignore>>
            
p_allocate15(id) ==
    IF  TabLocks["logs_t"] = NONE
        THEN
             /\  TabLocks' = [TabLocks EXCEPT !["logs_t"] = id]
             /\  store(id, [loc |-> logs_t.loc, offs |-> 
                      FindFirstInSeq(LAMBDA v: v.val = Undef, 
                            SubSeq(StateP, logs_t.offs + 1, 
                                  logs_t.offs + logs_t.size)) 
                                + logs_t.offs + 1],
                load(id,[loc |-> p_a_e1.loc, offs |-> p_a_e1.offs]), 
                    <<logs_t.policy, Sessions[id]["VPol"]["p_a_e1"]>>, 
                        <<[pc |-> <<"p_allocate","exit">>, 
                            fp |-> 1]>>, "logs_t")
             /\ Trace' = Append(Trace, <<id, "p_allocate15">>) \* \o " -> p_allocate15")
             /\ UNCHANGED  <<StateE, UsedNats, S, SLocks, Ignore>>
         ELSE UNCHANGED vars 

p_allocate_exit(id) == 
    /\ StateE' = [x \in {x1 \in DOMAIN StateE : x1 \in E1} |-> 
                    (StateE[x] \ SLocks[id][x])] @@
                 [x \in {x1 \in DOMAIN StateE : x1 \in E0} |-> 
                            IF SLocks[id][x] = {} 
                                THEN {NONE} 
                                ELSE StateE[x]]                                               
    /\ Sessions'  = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
                 Tail(Sessions[id]["StateRegs"]) \o <<>>]
    /\ TabLocks' = [TabLocks EXCEPT !["allocations_t"] = NONE]
    /\ Trace' = Append(Trace, <<id, "p_allocate_exit">>) \* \o " -> p_allocate_exit")
    /\ Ignore'= 1
    /\ UNCHANGED <<StateP, UsedNats, New2Old, S, VPol, SLocks>>
   
p_allocate(id,st)  ==
    CASE /\ Head(st).pc[2] = "lbl_6"     -> p_allocate6(id)
    [] Head(st).pc[2]      = "lbl_9"     -> p_allocate9(id)  
    [] Head(st).pc[2]      = "lbl_10_12" -> p_allocate10_12(id)
    [] Head(st).pc[2]      = "lbl_12"    -> p_allocate12(id)
    [] Head(st).pc[2]      = "lbl_15"    -> p_allocate15(id)
    [] Head(st).pc[2]      = "exit"      -> p_allocate_exit(id)     
    [] OTHER -> UNCHANGED vars   
 
(***************************************************************************)
(* p_change_status procedure definition.                                   *)
(***************************************************************************)

p_change_status_load(id) ==    
    /\ Sessions' = [Sessions EXCEPT ![id]["SessionM"] = 
                       <<[val |-> UsedNats + 1],[val |-> UsedNats + 2]>>]
    /\ Ignore'   = 0
    /\ UsedNats' = UsedNats + 2
    /\ UNCHANGED <<StateP, StateE, New2Old, S, TabLocks, VPol, SLocks>>

p_change_status4(id) ==
    IF /\ TabLocks["submissions_t"] = NONE
       /\ IsNotSeqEmpty (SubSeq(StateP, submissions_t.offs + 1, 
                                submissions_t.offs + submissions_t.size))
        THEN 
             /\ TabLocks' = [TabLocks EXCEPT !["submissions_t"] = id]
             /\ store(id, [loc |-> submissions_t.loc, offs |-> 
                      FindFirstInSeq(LAMBDA v: v.val # Undef, 
                            SubSeq(StateP, submissions_t.offs + 1, 
                                  submissions_t.offs + submissions_t.size)) 
                                + submissions_t.offs + 1],
                load(id,[loc |-> p_cs_p2.loc, offs |-> p_cs_p2.offs]), 
                      <<max, LUB(p_cs_p2.policy,p_cs_p1.policy)>>, 
                      <<[pc |-> <<"p_change_status", "exit">>,fp |-> 1]>>, 
                                                          "submissions_t")
             /\ Trace' = Append(Trace, <<id, "p_change_status4">>) \* \o " -> p_change_status4")
             /\ UNCHANGED  <<StateE, UsedNats, S, SLocks, Ignore>>
         ELSE UNCHANGED vars

p_change_status_exit(id) == 
    /\ StateE' = [x \in {x1 \in DOMAIN StateE : x1 \in E1} |-> 
                    (StateE[x] \ SLocks[id][x])] @@
                 [x \in {x1 \in DOMAIN StateE : x1 \in E0} |-> 
                            IF SLocks[id][x] = {} 
                                THEN {NONE} 
                                ELSE StateE[x]]                
    /\ Sessions'  = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
                 Tail(Sessions[id]["StateRegs"]) \o <<>>]
    /\ TabLocks' = [TabLocks EXCEPT !["submissions_t"] = NONE]
    /\ Trace' = Append(Trace, <<id, "p_change_status_exit">>) \* \o " -> p_change_status_exit")
    /\ Ignore'   = 1
    /\ UNCHANGED <<StateP, UsedNats, New2Old, S, VPol, SLocks>>

p_change_status(id,st)  ==
    CASE Head(st).pc[2] = "lbl_4" -> p_change_status4(id)
    [] Head(st).pc[2]   = "exit"  -> p_change_status_exit(id)      
    [] OTHER -> UNCHANGED vars   

(***************************************************************************)
(* f_getsection_program function definition.                               *)
(***************************************************************************)

f_getsection_program_load(id) ==
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                          <<[val |-> UsedNats + 1], [val |-> Undef], 
                            [val |-> UsedNats + 2], [val |-> Undef]>>]       
    /\ UsedNats'  = UsedNats + 4
    /\ Ignore'   = 0
    /\ UNCHANGED <<StateP, New2Old, S, TabLocks, VPol, StateE, SLocks>>

f_getsection_program5(id) ==
    IF /\ TabLocks["allocations_t"] = NONE
       /\ TabLocks["papers_t"] = NONE
       /\ IsNotSeqEmpty (SubSeq(StateP, allocations_t.offs + 1, 
                                allocations_t.offs + allocations_t.size))
\*       /\ IsNotSeqEmpty (SubSeq(StateP, papers_t.offs + 1, 
\*                                papers_t.offs + papers_t.size))
        THEN             
            /\ store(id, [loc |-> f_gsp_v1.loc,offs |-> f_gsp_v1.offs],
                 load(id,[loc |-> f_gsp_c1.loc, offs |-> f_gsp_c1.offs]), 
                <<max, LUB(f_gsp_c1.policy, 
                    LUB(VPol.papers_t, VPol.allocations_t))>>, 
                        <<[pc |-> 
                            <<"f_getsection_program", "lbl_9">>,
                                fp |-> 1]>>, "f_gsp_v1")
            /\ Trace' = Append(Trace, <<id, "f_getsection_program5">>) \* \o " -> f_getsection_program5")
            /\ UNCHANGED  <<StateP, UsedNats, 
                    S, Ignore, TabLocks, StateE, SLocks>>
        ELSE UNCHANGED vars
        
f_getsection_program9(id) == 
                    
            \/ /\ openLock ({[t_expire |-> {}]})
                  /\ SLocks' = [SLocks EXCEPT ![id] =  
                        openSLock ({[t_expire |-> {}]},id)]
               \/ /\ openLock ({[manager |-> id]})
                  /\ SLocks'  = [SLocks EXCEPT ![id] = 
                        openSLock ({[manager |-> id]}, id)]
                        
        /\ store(id, [loc |-> f_gsp_r(id).loc,offs |-> f_gsp_r(id).offs],
             load(id,[loc |-> f_gsp_v1.loc, offs |-> f_gsp_v1.offs]), 
             <<f_gsp_r(id).policy, Sessions[id]["VPol"]["f_gsp_v1"]>>, 
             <<[pc |-> <<"f_getsection_program", "exit">>,fp |-> 1]>>,"")
        /\ Trace' = Append(Trace, <<id, "f_getsection_program9">>) \* \o " -> f_getsection_program9")
        /\ UNCHANGED  <<StateP, 
            UsedNats, S, Ignore, TabLocks>> \*, SLocks, StateE>>
   
f_getsection_program_exit(id) == 
    /\ StateE' = [x \in {x1 \in DOMAIN StateE : x1 \in E1} |-> 
                    (StateE[x] \ SLocks[id][x])] @@
                 [x \in {x1 \in DOMAIN StateE : x1 \in E0} |-> 
                            IF SLocks[id][x] = {} 
                                THEN {NONE} 
                                ELSE StateE[x]]                
    /\ Sessions'  = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
                 Tail(Sessions[id]["StateRegs"]) \o <<>>]
    /\ Trace' = Append(Trace, <<id, "f_getsection_program_exit">>) \* \o " -> f_getsection_program_exit")
    /\ Ignore'   = 1
    /\ UNCHANGED <<StateP,UsedNats,New2Old,S,VPol, TabLocks, SLocks>> 

f_getsection_program(id,st)  ==
    CASE Head(st).pc[2] = "lbl_5" -> f_getsection_program5(id)
    [] Head(st).pc[2] = "lbl_9" -> f_getsection_program9(id)
    [] Head(st).pc[2]   = "exit"  -> f_getsection_program_exit(id)
    [] OTHER -> UNCHANGED vars   
    
dispatch(id,st) ==
    CASE /\ Head(st).pc[1] = "p_submit_paper" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_submit_paper_load (id)
            /\ Trace' = Append(Trace,<<id,"p_submit_paper_load">> )\*id \o " -> p_submit_paper_load")
      [] /\ Head(st).pc[1] = "p_submit_paper" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_submit_paper(id,st)
      [] /\ Head(st).pc[1] = "p_allocate" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_allocate_load(id)
            /\ Trace' = Append(Trace, <<id, "p_allocate_load">>) \*\o " -> p_allocate_load")
      [] /\ Head(st).pc[1] = "p_allocate" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_allocate(id,st)
      [] /\ Head(st).pc[1] = "p_change_status" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_change_status_load(id)
            /\ Trace' = Append(Trace, <<id, "p_change_status_load">>) \* \o " -> p_change_status_load")
      [] /\ Head(st).pc[1] = "p_change_status" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_change_status(id,st)
      [] /\ Head(st).pc[1] = "f_getsection_program" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ f_getsection_program_load(id)
            /\ Trace' = Append(Trace, <<id, "f_getsection_program_load">>) \* \o " -> f_getsection_program_load")
      [] /\ Head(st).pc[1] = "f_getsection_program" 
         /\ Sessions[id]["SessionM"] # <<>> -> f_getsection_program(id,st)
      [] OTHER -> UNCHANGED vars
    
(***************************************************************************)
(* The initial state.                                                      *)
(* All locks are closed.  The initial state of the persistent storage -    *)
(* half-filled tables.                                                     *)
(***************************************************************************)
      
Init == 
        LET pc == 
                [{"pc"} -> 
                        {<<"p_submit_paper","lbl_4">>,
                         <<"p_add_paper","lbl_3">>,
                         <<"p_allocate","lbl_6">>,
                         <<"p_change_status","lbl_4">>,
                         <<"f_getsubmissions","lbl_3">>,
                         <<"f_getaccepted","lbl_3">>,
                         <<"f_getpaper","lbl_3">>,
                         <<"f_getsection_program","lbl_5">>}]
        IN
        /\ Trace     = <<>>
        /\ S \in SUBSET(U) /\ Cardinality(S) = 4
        /\ StateE    =  [e1 \in E0 |-> {NONE}] @@ [e2 \in E1 |-> {}]
        /\ StateP    =  
           ReduceSet(LAMBDA x, y: x \o 
               ReduceSet(LAMBDA x1, y1: 
                   IF y1 < (y["offs"] + y["size"] \div 2) + 1  
                       THEN Append(x1,[val |-> Undef])\*y1]) 
                       ELSE Append(x1,[val |-> Undef]), 
                           <<>>, y["offs"] + 1 .. y["offs"] + y["size"]),
                               <<>>, {z \in StateX : z.loc = "persistence"})                                                                                
        /\ Sessions  \in 
            [S -> 
                ReduceSet(LAMBDA x, y: x \cup 
                    {y @@ [SessionM |-> <<>>]
                       @@ [PCLabel  |-> <<{<<CHOOSE u \in UU : TRUE, 
                       <<[e1 \in E0 |-> {NONE}],
                         [e2 \in E1 |-> {NONE}]>>>>}>>] 
                       @@ [VPol |-> [p_sp_p1 |-> min, p_ap_p1 |-> min, 
                                     p_a_p1  |-> min, p_a_v1  |-> min, 
                                     p_a_c1  |-> min, p_a_e1  |-> min,
                                     p_cs_p1 |-> min, p_cs_p2 |-> min, 
                                     f_gs_p1 |-> min, f_gs_v1 |-> min, 
                                     f_gs_c1 |-> min, f_gs_r  |-> min, 
                                     f_ga_p1 |-> min, f_ga_v1 |-> min, 
                                     f_ga_c1 |-> min, f_ga_r  |-> min, 
                                     f_gp_p1 |-> min, f_gp_v1 |-> min, 
                                     f_gp_c1 |-> min, f_gp_r  |-> min, 
                                     f_gsp_p1|-> min, f_gsp_v1|-> min, 
                                     f_gsp_c1|-> min, f_gsp_r |-> min]]},                                                                         
                       {}, [{"StateRegs"} -> 
                            ReduceSet (LAMBDA x, y: 
                                x \cup ({<<y @@ [fp |->1]>>}), {}, pc) ])]
        /\ SLocks   = [s \in S |-> [e1 \in E0 |-> {NONE}] 
                            @@ [e2 \in E1 |-> {}]]
        /\ New2Old  = <<>>
        /\ Ignore   = 0
        /\ TabLocks = [papers_t |-> NONE, submissions_t |-> NONE, 
                       conferences_t |-> NONE, sections_t |-> NONE, 
                       allocations_t |-> NONE, logs_t |-> NONE]
        /\ UsedNats = PMemoryLength
        /\ VPol     = [submissions_t |-> min, conferences_t |-> min, 
                       sections_t    |-> min, allocations_t |-> min, 
                       papers_t      |-> min, logs_t |-> min]
                       
Next(K(_,_)) == 
        \/ \E  s \in S :
            /\ Sessions[s]["StateRegs"] # <<>>
            /\ K(s,Sessions[s]["StateRegs"])
        \/ \A  s \in S : 
            /\ Sessions[s]["StateRegs"] = <<>>
            /\ UNCHANGED vars
         
Next_test == UNCHANGED vars

SpecFS == Init /\ [] [Next(dispatch)]_vars 
               
        
        

=============================================================================
\* Modification History
\* Last modified Wed Feb 24 22:46:59 MSK 2021 by user-sc
\* Created Wed Oct 21 12:17:41 MSK 2020 by user-sc
