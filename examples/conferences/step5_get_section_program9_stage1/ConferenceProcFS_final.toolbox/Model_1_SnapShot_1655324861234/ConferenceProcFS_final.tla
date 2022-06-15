----------------------- MODULE ConferenceProcFS_final -----------------------
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
(* inputs = {p_sp_p1, p_a_p1, f_gsp_p1,...}                                *)
(*                                                                         *)
(* outpus = {f_gsp_r, o_a_o1...}                                           *)
(*                                                                         *)
(* vars = {papers_t, allocations_t, submissions_t, conferences_t, e_a_e1,  *)
(* sections_t, p_a_v1, f_gs_v1,...}                                        *)
(***************************************************************************)

EXTENDS RuntimeFS

\*RECURSIVE dispatch(_,_) 
       
(***************************************************************************)
(* p_submit_paper definition                                               *)
(***************************************************************************)

p_submit_paper_load (id) ==
    
 IF XLocks = Undef 
    THEN
    /\ XLocks' = id
    
    \* присваиваем формальным параметрам метки фактических входных значений 
    \* поскольку это первый вызов процедуры в сеанссе, fp = 1
    
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                     Sessions[id]["SessionM"] \o <<min, min, min, min, min>>]
    /\ New2Old'   = <<
                    <<p_sp_p_s_id(id).policy, p_sp_p_p_id(id).policy, 
                      p_sp_p_c_id(id).policy, p_sp_p_sub_date(id).policy,
                      p_sp_p_stat(id).policy>>,
                    <<min, min, min, min,min>> 
                    \* {<<u1,<<[t_expire |-> {"NONE"}], [reviewer |-> {u1}, 
                    \*           manager |-> {"NONE"}, organizer |-> {"NONE"}, 
                    \*           guest |-> {"NONE"}]>>>>}>>
                    >> 
                    
    \* Флаг Ignore используется для отключения проверки инварианта 
    \* безопасности на текущем шаге.
    \* В случае выявления ложного срабатывания данное выражение заменяется
    \* IF false_cond THEN Ignore' = 1 ELSE Ignore' = 0
    
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    
    \* на каждом шаге обновляем переменную StateE' множеством открытых
    \* блокировок текущего сеанса для проверки инварианта безопасности
    
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
    ELSE UNCHANGED vars
    
    
p_submit_paper4(id) ==
    /\  insert (id, <<"col_submissions_submission_id",
                      "col_submissions_paper_id",
                      "col_submissions_conference_id",
                      "col_submissions_submission_date",
                      "col_submissions_status">>,
                    <<load(id, p_sp_p_s_id(id)), 
                      load(id, p_sp_p_p_id(id)),
                      load(id, p_sp_p_c_id(id)),
                      load(id, p_sp_p_sub_date(id)),
                      load(id, p_sp_p_stat(id))>>,
                    <<"p_submit_paper","exit">>)
    /\ Trace'  = Append(Trace, <<id, "p_submit_paper4", 
                 "insert into SUBMISSIONS (SUBMISSION_ID, PAPER_ID, " \o 
                 "CONFERENCE_ID, SUBMISSION_DATE, STATUS) values " \o
                 "(s_id, p_id, c_id, sub_date, stat)",
                 [from |-> <<<<[policy |-> load(id, p_sp_p_s_id(id)), 
                                name |-> p_sp_p_s_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>, 
                             <<[policy |-> load(id, p_sp_p_p_id(id)),
                                name |-> p_sp_p_p_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>,
                             <<[policy |-> load(id, p_sp_p_c_id(id)),
                                name |-> p_sp_p_c_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>, 
                             <<[policy |-> load(id, p_sp_p_sub_date(id)),
                                name |-> p_sp_p_sub_date(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>,
                             <<[policy |-> load(id, p_sp_p_stat(id)),
                                name |-> p_sp_p_stat(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>>>,
                  to |-> <<VPol.col_submissions_submission_id,
                           VPol.col_submissions_paper_id,
                           VPol.col_submissions_conference_id,
                           VPol.col_submissions_submission_date,
                           VPol.col_submissions_status>>]>>)
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ XLocks' = XLocks
          
(***************************************************************************)
(* On a procedure (function) exit we need to release all exclusive locks   *)
(* on tables and save the return value if any.                             *)
(***************************************************************************)
         
p_submit_paper_exit(id) ==                                     
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            \* удаляем frame  процедуры из стека
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-5)] 
    /\ Trace' = Append(Trace, <<id, "p_submit_paper_exit", 
                                    "submit_paper_exit",
                       [from |-> << >>, to |-> << >>]>>)
    /\ Ignore'= 0
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>

p_submit_paper(id,st)  == 
    CASE Head(st).pc[2] = "lbl_4"   -> p_submit_paper4(id)
    [] Head(st).pc[2]   = "exit"    -> p_submit_paper_exit(id)
    [] OTHER -> UNCHANGED vars

(***************************************************************************)
(* p_add_paper definition                                                  *)
(***************************************************************************)

p_add_paper_load (id) == 
 IF XLocks = Undef 
    THEN
    /\ XLocks' = id 
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                     Sessions[id]["SessionM"] \o <<min, min, min, min, 
                             {<<u1,<<[t_expire |-> {}], [guest |-> {NONE},
                                     reviewer |-> {NONE}, manager |-> {NONE}, 
                                     organizer |-> {NONE}]>> >>}>>]
    /\ New2Old'   = <<
                    <<p_ap_p_p_id(id).policy, p_ap_p_papers_tit(id).policy, 
                      p_ap_p_papers_abst(id).policy, p_ap_p_t(id).policy,
                      p_ap_p_auth(id).policy>>,
                    <<min, min, min, min,
                             {<<u1,<<[t_expire |-> {}], [guest |-> {NONE},
                                     reviewer |-> {NONE}, manager |-> {NONE}, 
                                     organizer |-> {NONE}]>> >>}>> 
                    >>    
    \* step1 invariant violation fix 
    /\ Ignore' = 1
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
  ELSE UNCHANGED vars
    
p_add_paper4(id) ==
    /\  insert (id, <<"col_papers_paper_id",
                      "col_papers_title",
                      "col_papers_abstract",
                      "col_papers_text",
                      "col_papers_authors">>,
                    <<load(id, p_ap_p_p_id(id)), 
                      load(id, p_ap_p_papers_tit(id)),
                      load(id, p_ap_p_papers_abst(id)),
                      load(id, p_ap_p_t(id)),
                      load(id, p_ap_p_auth(id))>>,
                    <<"p_add_paper","exit">>)
   /\ Trace' = Append(Trace, <<id, "p_add_paper4", 
                             "INSERT INTO PAPERS " \o
                             "(PAPER_ID, TITLE, ABSTRACT, TEXT, AUTHORS )"\o
                             "VALUES (p_id, tit, absr, t, auth)",
                             [from |-> 
                            <<<<[policy |-> load(id, p_ap_p_p_id(id)),
                                   name |-> p_ap_p_p_id(id).name],
                                [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                   name |-> id]>>, 
                              <<[policy |-> load(id, p_ap_p_papers_tit(id)),
                                   name |-> p_ap_p_papers_tit(id).name],
                                [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                   name |-> id]>>,
                              <<[policy |-> load(id, p_ap_p_papers_abst(id)),
                                   name |-> p_ap_p_papers_abst(id).name],
                                [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                   name |-> id]>>, 
                              <<[policy |-> load(id, p_ap_p_t(id)),
                                   name |-> p_ap_p_t(id).name],
                                [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                   name |-> id]>>,
                              <<[policy |-> load(id, p_ap_p_auth(id)),
                                   name |-> p_ap_p_auth(id).name],
                                [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                   name |-> id]>>>>,
                              to |-> <<VPol.col_papers_paper_id,
                              VPol.col_papers_title,
                              VPol.col_papers_abstract,
                              VPol.col_papers_text,
                              VPol.col_papers_authors>>]>>)
   /\ Ignore' = 0
   /\ SLocks' = SLocks
   /\ StateE' = SLocks'[id]  
   /\ XLocks' = XLocks    
      
p_add_paper_exit(id) ==                                     
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            \* удаляем frame  процедуры из стека
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-5)] 
    /\ Trace' = Append(Trace, <<id, "p_add_paper_exit","add_paper_exit",
                                    [from |-> << >>, to |-> << >>]>>)
    /\ Ignore'= 1
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>


p_add_paper(id,st)  == 
    CASE Head(st).pc[2] = "lbl_4"   -> p_add_paper4(id)
    [] Head(st).pc[2]   = "exit"    -> p_add_paper_exit(id)
    [] OTHER -> UNCHANGED vars

(***************************************************************************)
(* p_change_status procedure definition.                                   *)
(***************************************************************************)

p_change_status_load(id) == 
 IF XLocks = Undef 
    THEN
    /\ XLocks' = id  
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                     Sessions[id]["SessionM"] \o <<min, 
                     {<<u1,<<[t_expire |-> {NONE}], [guest |-> {NONE}, 
                               reviewer |-> {NONE}, manager |-> {u1}, 
                               organizer |-> {NONE}]>> >>,
                      <<u1,<<[t_expire |-> {}], [guest |-> {NONE}, 
                               reviewer |-> {NONE}, manager |-> {NONE}, 
                               organizer |-> {NONE}]>> >>}>>]
    /\ New2Old'   = <<
                    <<p_cs_p_s_id(id).policy, p_cs_p_stat(id).policy>>,
                    <<min, 
                      {<<u1,<<[t_expire |-> {NONE}], [guest |-> {NONE}, 
                               reviewer |-> {NONE}, manager |-> {u1}, 
                               organizer |-> {NONE}]>> >>,
                       <<u1,<<[t_expire |-> {}], [guest |-> {NONE}, 
                               reviewer |-> {NONE}, manager |-> {NONE}, 
                               organizer |-> {NONE}]>> >>}>> 
                    >> 
 \* Step_0 invariant violation fix.
    /\ Ignore' = 1
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
  ELSE UNCHANGED vars

p_change_status4(id) ==    
    /\  update (id, <<"col_submissions_status">>,
                    <<load(id, p_cs_p_stat(id))>>,
                LUB (VPol["col_submissions_submission_id"].policy, 
                      load(id, p_cs_p_s_id(id))),
                    <<"p_change_status","exit">>)
    /\ Trace'  = Append(Trace, <<id, "p_change_status4", 
                                     "update SUBMISSIONS " \o
                                     "set STATUS = stat " \o
                                     "where SUBMISSION_ID = s_id",
                               [from |-> 
                               <<<<[policy |-> load(id, p_cs_p_stat(id)),
                                    name |-> p_cs_p_stat(id).name],
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, p_cs_p_s_id(id)),
                                    name |-> p_cs_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>>>,
                                to |-> <<VPol.col_submissions_status>>]>>) 
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ XLocks' = XLocks

p_change_status_exit(id) ==                                     
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-2)] 
    /\ Trace' = Append(Trace, <<id, "p_change_status_exit", 
                                    "change_status_exit",
                                    [from |-> << >>, to |-> << >>]>>)
    /\ Ignore'= 1
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>

p_change_status(id,st)  ==
    CASE Head(st).pc[2] = "lbl_4" -> p_change_status4(id)
    [] Head(st).pc[2]   = "exit"  -> p_change_status_exit(id)      
    [] OTHER -> UNCHANGED vars     
    
(***************************************************************************)
(* f_is_accepted function definition.                                      *)
(***************************************************************************)

\* для возвращаемого параметра на начальном шаге нет фактической метки!

f_is_accepted_load(id) ==
 IF XLocks = Undef 
    THEN
    /\ XLocks' = id   
    /\ Sessions' = 
               [Sessions EXCEPT ![id]["SessionM"] = 
                Sessions[id]["SessionM"] \o <<min,f_ia_v_v_status(id).policy, 
                                                         f_ia_r(id).policy>>]
    
    /\ New2Old'  = <<
                   <<f_ia_p_s_id(id).policy, f_ia_v_v_status(id).policy, 
                     f_ia_r(id).policy>>,
                   <<min, f_ia_v_v_status(id).policy, f_ia_r(id).policy>> 
                   >> 
    /\ Ignore'   = 0
    /\ SLocks'   = SLocks
    /\ StateE'   = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
 ELSE UNCHANGED vars

f_is_accepted5(id) ==  
    /\  select (id, <<f_ia_v_v_status(id)>>,
                    <<VPol["col_submissions_status"].policy>>,
                    LUB (VPol["col_submissions_submission_id"].policy, 
                    load(id, f_ia_p_s_id(id))), 
                    <<"f_is_accepted","lbl_8">>)
    /\ Trace'     = Append(Trace, <<id, "f_is_accepted5",
                    "SELECT STATUS into v_status, " \o
                    "FROM SUBMISSIONS " \o
                    "WHERE SUBMISSION_ID = s_id",
                           [from |-> <<<<VPol.col_submissions_status, 
                                         VPol.col_submissions_submission_id, 
                                         [policy |-> load(id, f_ia_p_s_id(id)),
                                          name |-> f_ia_p_s_id(id).name],
                                         [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                          name |-> id]>>>>, 
                            to |-> <<[policy |-> load(id, f_ia_v_v_status(id)),
                                      name |-> f_ia_v_v_status(id).name,
                                      offs |-> f_ia_v_v_status(id).offs]>>]>>) 
    /\ Ignore'    = 0
    /\ SLocks'    = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<XLocks, VPol>>
    
f_is_accepted8(id) ==   
    /\ if(id, load(id, f_ia_v_v_status(id)), <<"f_is_accepted", "lbl_9_10">>)
    /\ Trace' = Append(Trace, <<id,"f_is_accepted8","if v_status = 1",
                       [from |-> <<<<[policy |-> load(id, f_ia_v_v_status(id)), 
                                      name |-> f_ia_v_v_status(id).name],
                                     [policy |-> min, name |-> "l1"],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>, 
                        to   |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>]>>)    
    /\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>> 
         
f_is_accepted9_10(id) ==
    \/ /\ return(id, <<f_ia_r(id)>>, <<min>>, <<"f_is_accepted","lbl_11">>)
       /\ Trace'    = Append(Trace, <<id, "f_is_accepted9","then return TRUE",
                             [from |-> <<<<[policy |-> min, name |-> "l2"],
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>>>, 
                              to   |-> <<[policy |-> load(id, f_ia_r(id)),
                                          name |-> f_ia_r(id).name,
                                          offs |-> f_ia_r(id).offs]>>]>>) 
       /\ Ignore'   = 0
       /\ SLocks'   = SLocks
       /\ StateE'   = SLocks'[id]  
       /\ XLocks'   = XLocks
       /\ VPol'     = VPol 
    \/ /\ return(id, <<f_ia_r(id)>>, <<min>>, <<"f_is_accepted","lbl_11">>)
       /\ Trace'    = Append(Trace, <<id, "f_is_accepted10",
                                          "else return FALSE",
                             [from |-> <<<<[policy |-> min, name |-> "l3"],
                                           [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                            name |-> id]>>>>, 
                              to   |-> <<[policy |-> load(id, f_ia_r(id)),
                                          name |-> f_ia_r(id).name,
                                          offs |-> f_ia_r(id).offs ]>>]>>) 
       /\ Ignore'   = 0
       /\ SLocks'   = SLocks
       /\ StateE'   = SLocks'[id]  
       /\ XLocks'   = XLocks
       /\ VPol'     = VPol 
    
f_is_accepted11(id) ==
    /\ ifend(id, <<"f_is_accepted","exit">>)
    /\ Trace' = Append(Trace, <<id,"f_is_accepted11","endif",
                       [from |-> <<<<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>, 
                        to   |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>]>>) 
    /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

f_is_accepted_exit(id) ==
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            ![id]["Ret"] = 
                <<Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                 + f_ia_r(id).offs]>>,
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-3)] 
    /\ Trace'  = Append(Trace, <<id, "f_is_accepted_exit","is_accepted_exit",
                                     [from |-> << >>, to |-> << >>]>>)
    /\ Ignore' = 1
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id] 
    /\ UNCHANGED <<New2Old, VPol>>
    
f_is_accepted(id,st)  ==
    CASE Head(st).pc[2] = "lbl_5" -> f_is_accepted5(id)
    [] Head(st).pc[2]   = "lbl_8" -> f_is_accepted8(id)
    [] Head(st).pc[2]   = "lbl_9_10" -> f_is_accepted9_10(id)
    [] Head(st).pc[2]   = "lbl_11" -> f_is_accepted11(id)
    [] Head(st).pc[2]   = "exit"  -> f_is_accepted_exit(id)      
    [] OTHER -> UNCHANGED vars      
  
(***************************************************************************)
(* p_allocate procedure definition.                                        *)
(* p_allocate12 is required to restore a pclabel after returning from IF   *)
(* construct                                                               *)
(***************************************************************************)

p_allocate_load(id) ==
 IF XLocks = Undef 
    THEN
    /\ XLocks' = id   
    /\ Sessions'  = [Sessions EXCEPT ![id]["SessionM"] = 
                     Sessions[id]["SessionM"] \o <<min, min, min, min, 
                                        p_al_v_p_id(id).policy, 
                                        p_al_e_PAPER_NOT_ACCEPTED(id).policy,
                                        p_al_v_is_acc(id).policy>>]
    /\ New2Old'   = <<
                    <<p_al_p_a_id(id).policy, p_al_p_s_id(id).policy,
                      p_al_p_sec_id(id).policy, p_al_p_alloc_date(id).policy,
                      p_al_v_p_id(id).policy, 
                      p_al_e_PAPER_NOT_ACCEPTED(id).policy,
                      p_al_v_is_acc(id).policy>>,
                    <<min, min, min, min, p_al_v_p_id(id).policy, 
                                        p_al_e_PAPER_NOT_ACCEPTED(id).policy,
                                        p_al_v_is_acc(id).policy>> 
                    >> 
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
  ELSE UNCHANGED vars

p_allocate7(id) ==   
    /\ call(id, <<"f_is_accepted", "lbl_5">>, "lbl_7r", 
                     <<LUB4Seq(Sessions[id]["PCLabel"] \o <<load(id, p_al_p_s_id(id))>>), 
                       LUB4Seq(Sessions[id]["PCLabel"] \o <<f_ia_v_v_status(id).policy>>),
                       LUB4Seq(Sessions[id]["PCLabel"]\o <<f_ia_r(id).policy>>)>>)
    /\ Trace'    = Append(Trace, <<id, "f_is_accepted_call", 
                                       "is_accepted_call",
                         [from |-> <<<<[policy |-> load(id, p_al_p_s_id(id)),
                                        name |-> p_al_p_s_id(id).name],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>, 
                                     <<[policy |-> load(id, f_ia_v_v_status(id)),
                                        name |-> f_ia_v_v_status(id).name],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>,
                                     <<[policy |-> load(id, f_ia_r(id)),
                                        name |-> f_ia_r(id).name],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>>>, 
                          to   |-> <<[policy |-> load(id, f_ia_p_s_id(id)),
                                      name |-> f_ia_p_s_id(id).name,
                                      offs |-> f_ia_p_s_id(id).offs], 
                                     [policy |-> load(id, f_ia_v_v_status(id)),
                                      name |-> f_ia_v_v_status(id).name,
                                      offs |-> f_ia_v_v_status(id).offs],
                                     [policy |-> load(id, f_ia_r(id)),
                                      name |-> f_ia_r(id).name,
                                      offs |-> f_ia_r(id).offs]>>]>>)                           
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<XLocks, VPol, New2Old>>

p_allocate7r(id) ==   
    /\ exit_call(id, <<p_al_v_is_acc(id)>>, <<"p_allocate", "lbl_8">>) 
    /\ Trace'    = Append(Trace, <<id, "p_allocate7r", "is_accepted_exit",
                          [from |-> <<<<[policy |-> Sessions[id]["Ret"][1], 
                                         name   |-> f_ia_r(id).name],
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>>>, 
                           to   |-> <<[policy |-> load(id, p_al_v_is_acc(id)),
                                       name |-> p_al_v_is_acc(id).name,
                                       offs |-> p_al_v_is_acc(id).offs]>>]>>) 
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]             
    /\ UNCHANGED  <<XLocks, VPol>>

p_allocate8(id) == 
    /\ if(id, load(id, p_al_v_is_acc(id)), <<"p_allocate", "lbl_10_15">>)
    /\ Trace' = Append(Trace, <<id,"p_allocate_8", "if v_is_acc",
                       [from |-> <<<<[policy |-> load(id, p_al_v_is_acc(id)),
                                      name |-> p_al_v_is_acc(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>, 
                        to   |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>]>>)    
    /\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>> 
    
p_allocate10_15(id) ==     
    \/ /\  select (id, <<p_al_v_p_id(id)>>,
                            <<VPol["col_submissions_paper_id"].policy>>,
                        LUB (VPol["col_submissions_submission_id"].policy, 
                        load(id, p_al_p_s_id(id))), 
                            <<"p_allocate","lbl_13">>)
       /\ Trace'     = Append(Trace, <<id, "p_allocate_10",
                              "THEN SELECT paper_id into v_p_id " \o
                              "FROM SUBMISSIONS WHERE submission_id = s_id",
                             [from |-> <<<<VPol.col_submissions_submission_id,
                                           VPol.col_submissions_paper_id,
                                           [policy |-> load(id, p_al_p_s_id(id)),
                                            name |-> p_al_p_s_id(id).name],
                                           [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                            name |-> id]>>>>, 
                              to   |-> <<[policy |-> load(id, p_al_v_p_id(id)),
                                          name |-> p_al_v_p_id(id).name,
                                          offs |-> p_al_v_p_id(id).offs]>>]>>) 
       /\ Ignore'    = 0
       /\ SLocks'    = SLocks
       /\ StateE'    = SLocks'[id]  
       /\ UNCHANGED <<XLocks, VPol>>
    \/ /\ skip(id, <<"p_allocate","lbl_17">>)
       /\ Trace'    = Append(Trace, <<id, "p_allocate_15", 
                                          "ELSE RAISE PAPER_NOT_ACCEPTED",
                            [from |-> << >>, to |-> << >>]>>) 
       /\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>> 

p_allocate13(id) ==
    /\  insert (id, <<"col_allocations_allocation_id",
                      "col_allocations_submission_id",
                      "col_allocations_section_id",
                      "col_allocations_allocation_date">>,
                    <<load(id, p_al_p_a_id(id)), 
                           load(id, p_al_p_s_id(id)),
                           load(id, p_al_p_sec_id(id)),
                           load(id, p_al_p_alloc_date(id))>>,
                    <<"p_allocate","lbl_16">>)
    /\ Trace'  = Append(Trace, <<id, "p_allocate_13", 
                 "INSERT INTO ALLOCATIONS " \o
                 "(ALLOCATION_ID, SUBMISSION_ID, "\o
                 "SECTION_ID, ALLOCATION_DATE)" \o
                 "VALUES (id, s_id, sec_id, alloc_date)",
                 [from |-> <<<<[policy |-> load(id, p_al_p_a_id(id)),
                                name |-> p_al_p_a_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>, 
                             <<[policy |-> load(id, p_al_p_s_id(id)),
                                name |-> p_al_p_s_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>,
                             <<[policy |-> load(id, p_al_p_sec_id(id)),
                                name |-> p_al_p_sec_id(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>,
                             <<[policy |-> load(id, p_al_p_alloc_date(id)),
                                name |-> p_al_p_alloc_date(id).name],
                               [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                name |-> id]>>>>,
                  to   |-> <<VPol.col_allocations_allocation_id,
                             VPol.col_allocations_submission_id,
                             VPol.col_allocations_section_id,
                             VPol.col_allocations_allocation_date>>]>>)
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ XLocks' = XLocks 

p_allocate16(id) ==
    /\ ifend(id, <<"p_allocate","exit">>)
    /\ Trace' = Append(Trace, <<id,"p_allocate16","endif",
                       [from |-> <<<<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>, 
                        to   |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>]>>) 
    /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>
   
p_allocate17(id) ==
    /\ whenexc(id, load(id, p_al_e_PAPER_NOT_ACCEPTED(id)), 
                                           <<"p_allocate", "lbl_18">>)
    /\ Trace' = Append(Trace, <<id,"p_allocate_17", "WHEN PAPER_NOT_ACCEPTED",
                      [from |-> <<<<[policy |-> load(id, p_al_e_PAPER_NOT_ACCEPTED(id)),
                                     name |-> p_al_e_PAPER_NOT_ACCEPTED(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>>>, 
                       to   |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>]>>)    
    /\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>> 

p_allocate18(id) ==
    /\ insert (id, <<"col_logs_event_id",
                     "col_logs_err_info">>,
                   <<min, load(id, p_al_e_PAPER_NOT_ACCEPTED(id))>>,
                   <<"p_allocate","exit">>)
    /\ Trace'  = Append(Trace, <<id, "p_allocate_18",
                 "INSERT INTO LOGS " \o
                 "VALUES (1, 'an attempt was made to allocate unaccepted submission ' " \o
                 "|| s_id || ', ' || sysdate || '.')",
                       [from |-> <<<<[policy |-> min, name |-> "l4"],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>, 
                                   <<[policy |-> min, name |-> "l5"],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>,
                        to   |-> <<VPol.col_logs_event_id,
                                   VPol.col_logs_err_info>>]>>)
    /\ Ignore' = 0
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ XLocks' = XLocks

p_allocate_exit(id) ==                                     
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-7)]        
    /\ Trace' = Append(Trace, <<id, "p_allocate_exit", "allocate_exit",
                       [from |-> << >>, to |-> << >>]>>)
    /\ Ignore'= 1
    /\ SLocks' = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>

p_allocate(id,st)  ==
    CASE Head(st).pc[2] = "lbl_7"  -> p_allocate7(id)
    [] Head(st).pc[2]   = "lbl_7r" -> p_allocate7r(id)
    [] Head(st).pc[2]   = "lbl_8" -> p_allocate8(id)
    [] Head(st).pc[2]   = "lbl_10_15" -> p_allocate10_15(id)
    [] Head(st).pc[2]   = "lbl_13" -> p_allocate13(id)
    [] Head(st).pc[2]   = "lbl_16" -> p_allocate16(id)
    [] Head(st).pc[2]   = "lbl_17" -> p_allocate17(id)
    [] Head(st).pc[2]   = "lbl_18" -> p_allocate18(id)
    [] Head(st).pc[2]   = "exit" -> p_allocate_exit(id)   
    [] OTHER -> UNCHANGED vars      

(***************************************************************************)
(* f_get_section_program function definition.                              *)
(***************************************************************************)

f_get_section_program_load(id) == 
 IF XLocks = Undef 
    THEN
    \* step4 invariant violation fix
    /\  openLock (id, {[t_expire |-> ALL]}) 
    \*   \/ openLock (id, {[manager |-> id]}) 
    /\ XLocks' = id  
    /\ Sessions' = 
               [Sessions EXCEPT ![id]["SessionM"] = 
                Sessions[id]["SessionM"] \o <<min,
                                              f_gsp_r_arr_e1_c1(id).policy, 
                                              f_gsp_r_arr_e1_c2(id).policy,  
                                              f_gsp_r_arr_e1_c3(id).policy,
                                              f_gsp_r_arr_e1_c4(id).policy,
                                              f_gsp_r_arr_e1_c5(id).policy,
                                              f_gsp_r_arr_e2_c1(id).policy,
                                              f_gsp_r_arr_e2_c2(id).policy,
                                              f_gsp_r_arr_e2_c3(id).policy,  
                                              f_gsp_r_arr_e2_c4(id).policy,
                                              f_gsp_r_arr_e2_c5(id).policy,
                                      f_gsp_v_program_arr_e1_c1(id).policy, 
                                      f_gsp_v_program_arr_e1_c2(id).policy,  
                                      f_gsp_v_program_arr_e1_c3(id).policy,
                                      f_gsp_v_program_arr_e1_c4(id).policy,
                                      f_gsp_v_program_arr_e1_c5(id).policy,
                                      f_gsp_v_program_arr_e2_c1(id).policy,
                                      f_gsp_v_program_arr_e2_c2(id).policy,
                                      f_gsp_v_program_arr_e2_c3(id).policy,  
                                      f_gsp_v_program_arr_e2_c4(id).policy,
                                      f_gsp_v_program_arr_e2_c5(id).policy>>]
    
    /\ New2Old'  = <<
                   <<f_gsp_p_s_id (id).policy,  
                     f_gsp_r_arr_e1_c1(id).policy, 
                     f_gsp_r_arr_e1_c2(id).policy,  
                     f_gsp_r_arr_e1_c3(id).policy, 
                     f_gsp_r_arr_e1_c4(id).policy,
                     f_gsp_r_arr_e1_c5(id).policy, 
                     f_gsp_r_arr_e2_c1(id).policy,
                     f_gsp_r_arr_e2_c2(id).policy, 
                     f_gsp_r_arr_e2_c3(id).policy,  
                     f_gsp_r_arr_e2_c4(id).policy, 
                     f_gsp_r_arr_e2_c5(id).policy,
                     f_gsp_v_program_arr_e1_c1(id).policy, 
                     f_gsp_v_program_arr_e1_c2(id).policy,  
                     f_gsp_v_program_arr_e1_c3(id).policy,
                     f_gsp_v_program_arr_e1_c4(id).policy,
                     f_gsp_v_program_arr_e1_c5(id).policy,
                     f_gsp_v_program_arr_e2_c1(id).policy,
                     f_gsp_v_program_arr_e2_c2(id).policy,
                     f_gsp_v_program_arr_e2_c3(id).policy,  
                     f_gsp_v_program_arr_e2_c4(id).policy,
                     f_gsp_v_program_arr_e2_c5(id).policy>>,
                   <<min,
                     f_gsp_r_arr_e1_c1(id).policy, 
                     f_gsp_r_arr_e1_c2(id).policy,  
                     f_gsp_r_arr_e1_c3(id).policy, 
                     f_gsp_r_arr_e1_c4(id).policy,
                     f_gsp_r_arr_e1_c5(id).policy, 
                     f_gsp_r_arr_e2_c1(id).policy,
                     f_gsp_r_arr_e2_c2(id).policy, 
                     f_gsp_r_arr_e2_c3(id).policy,  
                     f_gsp_r_arr_e2_c4(id).policy, 
                     f_gsp_r_arr_e2_c5(id).policy,
                     f_gsp_v_program_arr_e1_c1(id).policy, 
                     f_gsp_v_program_arr_e1_c2(id).policy,  
                     f_gsp_v_program_arr_e1_c3(id).policy,
                     f_gsp_v_program_arr_e1_c4(id).policy,
                     f_gsp_v_program_arr_e1_c5(id).policy,
                     f_gsp_v_program_arr_e2_c1(id).policy,
                     f_gsp_v_program_arr_e2_c2(id).policy,
                     f_gsp_v_program_arr_e2_c3(id).policy,  
                     f_gsp_v_program_arr_e2_c4(id).policy,
                     f_gsp_v_program_arr_e2_c5(id).policy>>
                   >>  
    /\ Ignore'   = 0
    /\ SLocks'   = SLocks
    /\ StateE'   = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
  ELSE UNCHANGED vars

f_get_section_program5(id) ==
    /\  select (id, <<f_gsp_v_program_arr_e1_c1(id), 
                      f_gsp_v_program_arr_e1_c2(id),  
                      f_gsp_v_program_arr_e1_c3(id),                
                      f_gsp_v_program_arr_e1_c4(id),
                      f_gsp_v_program_arr_e1_c5(id), 
                      f_gsp_v_program_arr_e2_c1(id),
                      f_gsp_v_program_arr_e2_c2(id),
                      f_gsp_v_program_arr_e2_c3(id),  
                      f_gsp_v_program_arr_e2_c4(id), 
                      f_gsp_v_program_arr_e2_c5(id)>>,
                    <<VPol["col_papers_paper_id"].policy,
                      VPol["col_papers_title"].policy,
                      VPol["col_papers_abstract"].policy,
                      VPol["col_papers_text"].policy,
                      min, 
                      VPol["col_papers_paper_id"].policy,
                      VPol["col_papers_title"].policy,
                      VPol["col_papers_abstract"].policy,
                      VPol["col_papers_text"].policy,
                      min>>,
                      LUB4Seq (<<VPol["col_papers_paper_id"].policy, 
                                 VPol["col_allocations_submission_id"].policy,
                                 VPol["col_allocations_section_id"].policy,
                                 VPol["col_submissions_paper_id"].policy,
                                 VPol["col_submissions_submission_id"].policy,
                                 load(id, f_gsp_p_s_id (id))>>), 
                               <<"f_get_section_program","lbl_9">>)
    /\ Trace'     = Append(Trace, <<id, "f_get_section_program_5",
                    "SELECT paper_typ(PAPER_ID, TITLE, ABSTRACT,  " \o
                    "TEXT, 'UNKNOWN_AUTH' BULK COLLECT " \o 
                    "INTO v_program FROM PAPERS " \o
                    "FROM PAPERS WHERE PAPER_ID IN (SELECT PAPER_ID " \o
                    "FROM ALLOCATIONS a JOIN SUBMISSIONS s " \o
                    "ON a.submission_id = s.submission_id " \o
                    "WHERE a.SECTION_ID = s_id)",
                     [from |-> <<<<VPol.col_papers_paper_id, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_title, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_abstract, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_text, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<[policy |-> min, name |-> "l6"], 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_paper_id, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_title, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_abstract, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<VPol.col_papers_text, 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>,
                                 <<[policy |-> min, name |-> "l7"], 
                                   VPol.col_papers_paper_id,
                                   VPol.col_allocations_submission_id,
                                   VPol.col_allocations_section_id,
                                   VPol.col_submissions_paper_id,
                                   VPol.col_submissions_submission_id,
                                   [policy |-> load(id, f_gsp_p_s_id(id)),
                                    name |-> f_gsp_p_s_id(id).name],
                                   [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                    name |-> id]>>>>, 
                      to   |-> <<[policy |-> load(id, f_gsp_v_program_arr_e1_c1(id)),
                                  name |-> f_gsp_v_program_arr_e1_c1(id).name,
                                  offs |-> f_gsp_v_program_arr_e1_c1(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e1_c2(id)),
                                  name |-> f_gsp_v_program_arr_e1_c2(id).name,
                                  offs |-> f_gsp_v_program_arr_e1_c2(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e1_c3(id)),
                                  name |-> f_gsp_v_program_arr_e1_c3(id).name,
                                  offs |-> f_gsp_v_program_arr_e1_c3(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e1_c4(id)),
                                  name |-> f_gsp_v_program_arr_e1_c4(id).name,
                                  offs |-> f_gsp_v_program_arr_e1_c4(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e1_c5(id)),
                                  name |-> f_gsp_v_program_arr_e1_c5(id).name,
                                  offs |-> f_gsp_v_program_arr_e1_c5(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e2_c1(id)),
                                  name |-> f_gsp_v_program_arr_e2_c1(id).name,
                                  offs |-> f_gsp_v_program_arr_e2_c1(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e2_c2(id)),
                                  name |-> f_gsp_v_program_arr_e2_c2(id).name,
                                  offs |-> f_gsp_v_program_arr_e2_c2(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e2_c3(id)),
                                  name |-> f_gsp_v_program_arr_e2_c3(id).name,
                                  offs |-> f_gsp_v_program_arr_e2_c3(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e2_c4(id)),
                                  name |-> f_gsp_v_program_arr_e2_c4(id).name,
                                  offs |-> f_gsp_v_program_arr_e2_c4(id).offs],
                                 [policy |-> load(id, f_gsp_v_program_arr_e2_c5(id)),
                                  name |-> f_gsp_v_program_arr_e2_c5(id).name,
                                  offs |-> f_gsp_v_program_arr_e2_c5(id).offs]>>]>>) 
    /\ Ignore'    = 0
    \* step4 invariant violation fix
    \*/\ SLocks'    = SLocks
    /\ StateE'    = SLocks'[id]  
    /\ UNCHANGED <<XLocks, VPol>>
        
f_get_section_program9(id) == 
    /\ return(id, <<f_gsp_r_arr_e1_c1(id), 
                    f_gsp_r_arr_e1_c2(id),  
                    f_gsp_r_arr_e1_c3(id), 
                    f_gsp_r_arr_e1_c4(id),
                    f_gsp_r_arr_e1_c5(id), 
                    f_gsp_r_arr_e2_c1(id),
                    f_gsp_r_arr_e2_c2(id), 
                    f_gsp_r_arr_e2_c3(id),  
                    f_gsp_r_arr_e2_c4(id), 
                    f_gsp_r_arr_e2_c5(id)>>, 
                    <<load(id, f_gsp_v_program_arr_e1_c1(id)),
                      load(id, f_gsp_v_program_arr_e1_c2(id)),
                      load(id, f_gsp_v_program_arr_e1_c3(id)),
                      load(id, f_gsp_v_program_arr_e1_c4(id)),
                      load(id, f_gsp_v_program_arr_e1_c5(id)),
                      load(id, f_gsp_v_program_arr_e2_c1(id)),
                      load(id, f_gsp_v_program_arr_e2_c2(id)),
                      load(id, f_gsp_v_program_arr_e2_c3(id)),
                      load(id, f_gsp_v_program_arr_e2_c4(id)),
                      load(id, f_gsp_v_program_arr_e2_c5(id))>>, 
                    <<"f_get_section_program","exit">>)
    /\ Trace'    = Append(Trace, <<id, "f_get_section_program_9", 
                                       "return v_submissions",
                         [from |-> <<
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e1_c1(id)),
                                     name |-> f_gsp_v_program_arr_e1_c1(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e1_c2(id)),
                                     name |-> f_gsp_v_program_arr_e1_c2(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e1_c3(id)),
                                     name |-> f_gsp_v_program_arr_e1_c3(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e1_c4(id)),
                                     name |-> f_gsp_v_program_arr_e1_c4(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e1_c5(id)),
                                     name |-> f_gsp_v_program_arr_e1_c5(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e2_c1(id)),
                                     name |-> f_gsp_v_program_arr_e2_c1(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e2_c2(id)),
                                     name |-> f_gsp_v_program_arr_e2_c2(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e2_c3(id)),
                                     name |-> f_gsp_v_program_arr_e2_c3(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e2_c4(id)),
                                     name |-> f_gsp_v_program_arr_e2_c4(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<[policy |-> load(id, f_gsp_v_program_arr_e2_c5(id)),
                                     name |-> f_gsp_v_program_arr_e2_c5(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>>>,
                          to   |-> <<[policy |-> load(id, f_gsp_r_arr_e1_c1(id)),
                                      name |-> f_gsp_r_arr_e1_c1(id).name,
                                      offs |-> f_gsp_r_arr_e1_c1(id).offs], 
                                     [policy |-> load(id, f_gsp_r_arr_e1_c2(id)),
                                      name |-> f_gsp_r_arr_e1_c2(id).name,
                                      offs |-> f_gsp_r_arr_e1_c2(id).offs],  
                                     [policy |-> load(id, f_gsp_r_arr_e1_c3(id)),
                                      name |-> f_gsp_r_arr_e1_c3(id).name,
                                      offs |-> f_gsp_r_arr_e1_c3(id).offs], 
                                     [policy |-> load(id, f_gsp_r_arr_e1_c4(id)),
                                      name |-> f_gsp_r_arr_e1_c4(id).name,
                                      offs |-> f_gsp_r_arr_e1_c4(id).offs],
                                     [policy |-> load(id, f_gsp_r_arr_e1_c5(id)),
                                      name |-> f_gsp_r_arr_e1_c5(id).name,
                                      offs |-> f_gsp_r_arr_e1_c5(id).offs], 
                                     [policy |-> load(id, f_gsp_r_arr_e2_c1(id)),
                                      name |-> f_gsp_r_arr_e2_c1(id).name,
                                      offs |-> f_gsp_r_arr_e2_c1(id).offs],
                                     [policy |-> load(id, f_gsp_r_arr_e2_c2(id)),
                                      name |-> f_gsp_r_arr_e2_c2(id).name,
                                      offs |-> f_gsp_r_arr_e2_c2(id).offs], 
                                     [policy |-> load(id, f_gsp_r_arr_e2_c3(id)),
                                      name |-> f_gsp_r_arr_e2_c3(id).name,
                                      offs |-> f_gsp_r_arr_e2_c3(id).offs],  
                                     [policy |-> load(id, f_gsp_r_arr_e2_c4(id)),
                                      name |-> f_gsp_r_arr_e2_c4(id).name,
                                      offs |-> f_gsp_r_arr_e2_c4(id).offs], 
                                     [policy |-> load(id, f_gsp_r_arr_e2_c5(id)),
                                      name |-> f_gsp_r_arr_e2_c5(id).name,
                                      offs |-> f_gsp_r_arr_e2_c5(id).offs]>>]>>) 
    /\ Ignore'   = 0
    /\ SLocks'   = SLocks
    /\ StateE'   = SLocks'[id]  
    /\ XLocks' = XLocks
    /\ VPol'     = VPol

f_get_section_program_exit(id) ==
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            ![id]["Ret"] = 
             <<Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e1_c1(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e1_c2(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e1_c3(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e1_c4(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e1_c5(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e2_c1(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e2_c2(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e2_c3(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e2_c4(id).offs],
               Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp 
                                             + f_gsp_r_arr_e2_c5(id).offs]>>,
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-21)] 
    /\ Trace'  = Append(Trace, <<id, "f_get_section_program_exit",
                                     "get_section_program_exit",
                       [from |-> << >>, to |-> << >>]>>)
    /\ Ignore' = 1
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>

f_get_section_program(id,st)  ==
    CASE Head(st).pc[2] = "lbl_5" -> f_get_section_program5(id)
    [] Head(st).pc[2]   = "lbl_9" -> f_get_section_program9(id)
    [] Head(st).pc[2]   = "exit"  -> f_get_section_program_exit(id)      
    [] OTHER -> UNCHANGED vars      
    
(***************************************************************************)
(* f_get_paper function definition.                                        *)
(***************************************************************************)

f_get_paper_load(id) == 
 IF XLocks = Undef 
    THEN
    \* step2 invariant violation fix
    /\ openLock (id, {[t_expire |-> ALL]}) 
    /\ XLocks' = id  
    /\ Sessions' = 
               [Sessions EXCEPT ![id]["SessionM"] = 
                Sessions[id]["SessionM"] \o <<min,
                                               f_gp_r_rec_c1(id).policy, 
                                               f_gp_r_rec_c2(id).policy,  
                                               f_gp_r_rec_c3(id).policy,
                                               f_gp_r_rec_c4(id).policy,
                                               f_gp_r_rec_c5(id).policy,
                                         f_gp_v_paper_rec_c1(id).policy, 
                                         f_gp_v_paper_rec_c2(id).policy,  
                                         f_gp_v_paper_rec_c3(id).policy,
                                         f_gp_v_paper_rec_c4(id).policy,
                                         f_gp_v_paper_rec_c5(id).policy>>]
    
    /\ New2Old'  = <<
                   <<f_gp_p_p_id (id).policy, 
                     f_gp_r_rec_c1(id).policy, 
                     f_gp_r_rec_c2(id).policy,  
                     f_gp_r_rec_c3(id).policy,
                     f_gp_r_rec_c4(id).policy,
                     f_gp_r_rec_c5(id).policy,
                     f_gp_v_paper_rec_c1(id).policy, 
                     f_gp_v_paper_rec_c2(id).policy,  
                     f_gp_v_paper_rec_c3(id).policy,
                     f_gp_v_paper_rec_c4(id).policy,
                     f_gp_v_paper_rec_c5(id).policy>>,
                   <<min, 
                     f_gp_r_rec_c1(id).policy, 
                     f_gp_r_rec_c2(id).policy,  
                     f_gp_r_rec_c3(id).policy,
                     f_gp_r_rec_c4(id).policy,
                     f_gp_r_rec_c5(id).policy,
                     f_gp_v_paper_rec_c1(id).policy, 
                     f_gp_v_paper_rec_c2(id).policy,  
                     f_gp_v_paper_rec_c3(id).policy,
                     f_gp_v_paper_rec_c4(id).policy,
                     f_gp_v_paper_rec_c5(id).policy>>
                   >>  
    /\ Ignore'   = 0
    \* step2 invariant violation fix
    \*/\ SLocks'   = SLocks
    /\ StateE'   = SLocks'[id]             
    /\ UNCHANGED  <<VPol>>
  ELSE UNCHANGED vars

f_get_paper5(id) ==
    /\  select (id, <<f_gp_v_paper_rec_c1(id), 
                      f_gp_v_paper_rec_c2(id),  
                      f_gp_v_paper_rec_c3(id),
                      f_gp_v_paper_rec_c4(id),
                      f_gp_v_paper_rec_c5(id)>>,
                    <<VPol["col_papers_paper_id"].policy,
                      VPol["col_papers_title"].policy,
                      VPol["col_papers_abstract"].policy,
                      VPol["col_papers_text"].policy,
                      VPol["col_papers_authors"].policy
                     >>,
                      LUB4Seq (<<VPol["col_papers_paper_id"].policy, 
                                 load(id, f_gp_p_p_id(id))>>), 
                               <<"f_get_paper","lbl_8">>)
            /\ Trace' = Append(Trace, <<id, "f_get_paper_5",
                        "select PAPER_ID, TITLE, ABSTRACT, TEXT, AUTHORS " \o
                        "into v_paper from PAPERS where PAPER_ID = p_id",
                               [from |-> <<
                                  <<VPol.col_papers_paper_id,
                                    VPol.col_papers_paper_id,
                                    [policy |-> load(id, f_gp_p_p_id(id)),
                                     name |-> f_gp_p_p_id(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<VPol.col_papers_title,
                                    VPol.col_papers_paper_id,
                                    [policy |-> load(id, f_gp_p_p_id(id)),
                                     name |-> f_gp_p_p_id(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>,
                                  <<VPol.col_papers_abstract,
                                    VPol.col_papers_paper_id,
                                    [policy |-> load(id, f_gp_p_p_id(id)),
                                     name |-> f_gp_p_p_id(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<VPol.col_papers_text,
                                    VPol.col_papers_paper_id,
                                    [policy |-> load(id, f_gp_p_p_id(id)),
                                     name |-> f_gp_p_p_id(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>,
                                  <<VPol.col_papers_authors,
                                    VPol.col_papers_paper_id,
                                    [policy |-> load(id, f_gp_p_p_id(id)),
                                     name |-> f_gp_p_p_id(id).name],
                                    [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                     name |-> id]>>>>,
                          to   |-> <<[policy |-> load(id, f_gp_v_paper_rec_c1(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name,
                                      offs |-> f_gp_v_paper_rec_c1(id).offs], 
                                     [policy |-> load(id, f_gp_v_paper_rec_c2(id)),
                                      name |-> f_gp_v_paper_rec_c2(id).name,
                                      offs |-> f_gp_v_paper_rec_c2(id).offs],
                                     [policy |-> load(id, f_gp_v_paper_rec_c3(id)),
                                      name |-> f_gp_v_paper_rec_c3(id).name,
                                      offs |-> f_gp_v_paper_rec_c3(id).offs],
                                     [policy |-> load(id, f_gp_v_paper_rec_c4(id)),
                                      name |-> f_gp_v_paper_rec_c4(id).name,
                                      offs |-> f_gp_v_paper_rec_c4(id).offs],
                                     [policy |-> load(id, f_gp_v_paper_rec_c5(id)),
                                      name |-> f_gp_v_paper_rec_c5(id).name,
                                      offs |-> f_gp_v_paper_rec_c5(id).offs]>>]>>)  
            /\ Ignore'    = 0
            /\ SLocks'    = SLocks
            /\ StateE'    = SLocks'[id]  
            /\ UNCHANGED <<XLocks, VPol>>
        
f_get_paper8(id) == 
    /\ return(id, <<f_gp_r_rec_c1(id), 
                    f_gp_r_rec_c2(id),  
                    f_gp_r_rec_c3(id),
                    f_gp_r_rec_c4(id),
                    f_gp_r_rec_c5(id)>>, 
                  <<load(id, f_gp_v_paper_rec_c1(id)),
                    load(id, f_gp_v_paper_rec_c2(id)),
                    load(id, f_gp_v_paper_rec_c3(id)),
                    load(id, f_gp_v_paper_rec_c4(id)),
                    load(id, f_gp_v_paper_rec_c5(id))
                  >>, 
                  <<"f_get_paper","exit">>)
    /\ Trace'    = Append(Trace, <<id, "f_get_paper_8",
                                       "return v_paper",
                         [from |-> <<
                                   <<[policy |-> load(id, f_gp_v_paper_rec_c1(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>, 
                                   <<[policy |-> load(id, f_gp_v_paper_rec_c2(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>,
                                   <<[policy |-> load(id, f_gp_v_paper_rec_c3(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>,
                                   <<[policy |-> load(id, f_gp_v_paper_rec_c4(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>,
                                   <<[policy |-> load(id, f_gp_v_paper_rec_c5(id)),
                                      name |-> f_gp_v_paper_rec_c1(id).name],
                                     [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>
                                  >>,
                          to   |-> <<[policy |-> load(id, f_gp_r_rec_c1(id)),
                                      name |-> f_gp_r_rec_c1(id).name,
                                      offs |-> f_gp_r_rec_c1(id).offs], 
                                     [policy |-> load(id, f_gp_r_rec_c2(id)),
                                      name |-> f_gp_r_rec_c2(id).name,
                                      offs |-> f_gp_r_rec_c2(id).offs],
                                     [policy |-> load(id, f_gp_r_rec_c3(id)),
                                      name |-> f_gp_r_rec_c3(id).name,
                                      offs |-> f_gp_r_rec_c3(id).offs],
                                     [policy |-> load(id, f_gp_r_rec_c4(id)),
                                      name |-> f_gp_r_rec_c4(id).name,
                                      offs |-> f_gp_r_rec_c4(id).offs],
                                     [policy |-> load(id, f_gp_r_rec_c5(id)),
                                      name |-> f_gp_r_rec_c5(id).name,
                                      offs |-> f_gp_r_rec_c5(id).offs]>>]>>) 
    /\ Ignore'   = 0
    /\ SLocks'   = SLocks
    /\ StateE'   = SLocks'[id]  
    /\ XLocks'   = XLocks
    /\ VPol'     = VPol

f_get_paper_exit(id) ==
    /\ IF Len(Sessions[id]["StateRegs"])=1
        THEN  XLocks' = Undef
        ELSE  XLocks' = XLocks
    /\ Sessions'  = 
       [Sessions EXCEPT 
            ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
            ![id]["Ret"] = 
                <<Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                                                    + f_gp_r_rec_c1(id).offs],
                  Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                                                    + f_gp_r_rec_c2(id).offs],
                  Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                                                    + f_gp_r_rec_c3(id).offs],
                  Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                                                    + f_gp_r_rec_c4(id).offs],
                  Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp
                                                    + f_gp_r_rec_c5(id).offs]>>,
            ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, 
                                       Len(Sessions[id]["SessionM"])-12)] 
    /\ Trace'  = Append(Trace, <<id, "f_get_section_program_exit",
                                     "get_section_program_exit",
                       [from |-> << >>, to |-> << >>]>>)
    /\ Ignore' = 1
    /\ SLocks' = SLocks
    /\ StateE' = SLocks'[id]  
    /\ UNCHANGED <<New2Old, VPol>>

f_get_paper(id,st)  ==
    CASE Head(st).pc[2] = "lbl_5" -> f_get_paper5(id)
    [] Head(st).pc[2]   = "lbl_8" -> f_get_paper8(id)
    [] Head(st).pc[2]   = "exit"  -> f_get_paper_exit(id)      
    [] OTHER -> UNCHANGED vars      

dispatch(id,st) ==
    CASE /\ Head(st).pc[1] = "p_submit_paper" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_submit_paper_load (id)
            /\ Trace' = Append(Trace,<<id,"p_submit_paper_load", 
                                          "submit_paper_load",
                         [from |-> <<<<[policy |-> min, name |-> "c1"],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>, 
                                     <<[policy |-> min, name |-> "c2"],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>, 
                                     <<[policy |-> min, name |-> "c3"],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>, 
                                     <<[policy |-> min, name |-> "c4"],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>, 
                                     <<[policy |-> min, name |-> "c5"],
                                       [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                        name |-> id]>>>>, 
                         to   |-> <<p_sp_p_s_id(id), p_sp_p_p_id(id), 
                                    p_sp_p_c_id(id), p_sp_p_sub_date(id),
                                    p_sp_p_stat(id)>>]>>)
      [] /\ Head(st).pc[1] = "p_submit_paper" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_submit_paper(id,st)
      
      [] /\ Head(st).pc[1] = "p_change_status" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_change_status_load(id)
            /\ Trace' = Append(Trace, <<id, "p_change_status_load",
                                            "change_status_load",
                               [from |-> <<<<[policy |-> min, name |-> "c11"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<[policy |-> 
                                             {<<u1,<<[t_expire |-> {NONE}], [guest |-> {NONE}, 
                                                reviewer |-> {NONE}, manager |-> {u1}, 
                                                organizer |-> {NONE}]>> >>,
                                              <<u1,<<[t_expire |-> {}], [guest |-> {NONE}, 
                                                reviewer |-> {NONE}, manager |-> {NONE}, 
                                                organizer |-> {NONE}]>> >>}, name |-> "c12"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                      name |-> id]>>>>, 
                                to   |-> <<p_cs_p_s_id(id), 
                                           p_cs_p_stat(id)>>]>>) 
      [] /\ Head(st).pc[1] = "p_change_status" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_change_status(id,st)
      
      [] /\ Head(st).pc[1] = "f_is_accepted" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ f_is_accepted_load(id)
            /\ Trace' = Append(Trace, <<id, "f_is_accepted_load",
                                            "is_accepted_load",
                        [from |-> <<<<[policy |-> min, name |-> "c13"],
                                      [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                       name |-> id]>>, 
                                    <<f_ia_v_v_status(id),
                                      [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                       name |-> id]>>,
                                    <<f_ia_r(id),
                                      [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                       name |-> id]>>>>, 
                         to   |-> <<f_ia_p_s_id(id), f_ia_v_v_status(id),
                                    f_ia_r(id)>>]>>)
      [] /\ Head(st).pc[1] = "f_is_accepted" 
         /\ Sessions[id]["SessionM"] # <<>> -> f_is_accepted(id,st)
      [] /\ Head(st).pc[1] = "p_allocate" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_allocate_load(id)
            /\ Trace' = Append(Trace, <<id, "p_allocate_load",
                                            "allocate_load", 
               [from |-> <<<<[policy |-> min, name |-> "c14"],
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>, 
                           <<[policy |-> min, name |-> "c15"],
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>,
                           <<[policy |-> min, name |-> "c16"],
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>, 
                           <<[policy |-> min, name |-> "c17"],
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>,
                           <<p_al_v_p_id(id),
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>,
                           <<p_al_e_PAPER_NOT_ACCEPTED(id),
                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                              name |-> id]>>>>, 
                to   |-> <<p_al_p_a_id(id), p_al_p_s_id(id),
                           p_al_p_sec_id(id), p_al_p_alloc_date(id),
                           p_al_v_p_id(id), p_al_e_PAPER_NOT_ACCEPTED(id)>>]>>)
      [] /\ Head(st).pc[1] = "p_allocate" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_allocate(id,st)
      [] /\ Head(st).pc[1] = "f_get_section_program" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ f_get_section_program_load(id)
            /\ Trace' = Append(Trace, <<id, "f_get_section_program_load",
                                            "get_section_program_load",
                    [from |-> <<<<[policy |-> min, name |-> "c18"]>>,
                                         <<f_gsp_r_arr_e1_c1(id),
                                           [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                            name |-> id]>>, 
                                          <<f_gsp_r_arr_e1_c2(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,  
                                          <<f_gsp_r_arr_e1_c3(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e1_c4(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e1_c5(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e2_c1(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e2_c2(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e2_c3(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,  
                                          <<f_gsp_r_arr_e2_c4(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                          <<f_gsp_r_arr_e2_c5(id),
                                            [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                             name |-> id]>>,
                                      <<f_gsp_v_program_arr_e1_c1(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>, 
                                      <<f_gsp_v_program_arr_e1_c2(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,  
                                      <<f_gsp_v_program_arr_e1_c3(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e1_c4(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e1_c5(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e2_c1(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e2_c2(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e2_c3(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,  
                                      <<f_gsp_v_program_arr_e2_c4(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>,
                                      <<f_gsp_v_program_arr_e2_c5(id),
                                        [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                         name |-> id]>>>>, 
                     to   |-> <<f_gsp_p_s_id (id), f_gsp_r_arr_e1_c1(id), 
                                f_gsp_r_arr_e1_c2(id), f_gsp_r_arr_e1_c3(id),
                                f_gsp_r_arr_e1_c4(id), f_gsp_r_arr_e1_c5(id),
                                f_gsp_r_arr_e2_c1(id), f_gsp_r_arr_e2_c2(id),
                                f_gsp_r_arr_e2_c3(id), f_gsp_r_arr_e2_c4(id),
                                f_gsp_r_arr_e2_c5(id), 
                                f_gsp_v_program_arr_e1_c1(id), 
                                f_gsp_v_program_arr_e1_c2(id),  
                                f_gsp_v_program_arr_e1_c3(id),
                                f_gsp_v_program_arr_e1_c4(id),
                                f_gsp_v_program_arr_e1_c5(id),
                                f_gsp_v_program_arr_e2_c1(id),
                                f_gsp_v_program_arr_e2_c2(id),
                                f_gsp_v_program_arr_e2_c3(id),  
                                f_gsp_v_program_arr_e2_c4(id),
                                f_gsp_v_program_arr_e2_c5(id)>>]>>)
      [] /\ Head(st).pc[1] = "f_get_section_program" 
         /\ Sessions[id]["SessionM"] # <<>> -> f_get_section_program(id,st)
      [] /\ Head(st).pc[1] = "f_get_paper" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ f_get_paper_load(id)
            /\ Trace' = Append(Trace, <<id, "f_get_paper_load",
                                            "get_paper_load",
                               [from |-> <<<<[policy |-> min, name |-> "c6"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<f_gp_v_paper_rec_c1(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<f_gp_v_paper_rec_c2(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<f_gp_v_paper_rec_c3(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<f_gp_v_paper_rec_c4(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_v_paper_rec_c5(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_r_rec_c1(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_r_rec_c2(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_r_rec_c3(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_r_rec_c4(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>,
                                           <<f_gp_r_rec_c5(id),
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>
                                           >>, 
                                to   |-> <<f_gp_p_p_id(id), f_gp_v_paper_rec_c1(id), 
                                           f_gp_v_paper_rec_c2(id), 
                                           f_gp_v_paper_rec_c3(id),
                                           f_gp_v_paper_rec_c4(id),
                                           f_gp_v_paper_rec_c5(id),
                                           f_gp_r_rec_c1(id),
                                           f_gp_r_rec_c2(id),
                                           f_gp_r_rec_c3(id),
                                           f_gp_r_rec_c4(id),
                                           f_gp_r_rec_c5(id)>>]>>)
      [] /\ Head(st).pc[1] = "f_get_paper" 
         /\ Sessions[id]["SessionM"] # <<>> -> f_get_paper(id,st)
      [] /\ Head(st).pc[1] = "p_add_paper" 
         /\ Sessions[id]["SessionM"] = <<>> -> 
            /\ p_add_paper_load (id)
            /\ Trace' = Append(Trace,<<id,"p_add_paper_load",
                                          "add_paper_load",
                               [from |-> <<<<[policy |-> min, name |-> "c6"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<[policy |-> min, name |-> "c7"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<[policy |-> min, name |-> "c8"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<[policy |-> min, name |-> "c9"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>, 
                                           <<[policy |-> 
                                             {<<u1,<<[t_expire |-> {}], [guest |-> {NONE},
                                                      reviewer |-> {NONE}, manager |-> {NONE}, 
                                                      organizer |-> {NONE}]>> >>}, name |-> "c10"],
                                             [policy |-> LUB4Seq(Sessions[id]["PCLabel"]),
                                              name |-> id]>>>>, 
                                to   |-> <<p_ap_p_p_id(id), p_ap_p_papers_tit(id), 
                                           p_ap_p_papers_abst(id), 
                                           p_ap_p_t(id), p_ap_p_auth(id)>>]>>)                                          
                                          
      [] /\ Head(st).pc[1] = "p_add_paper" 
         /\ Sessions[id]["SessionM"] # <<>> -> p_add_paper(id,st)
    
(***************************************************************************)
(* The initial state.                                                      *)
(***************************************************************************)
      
Init == 

        \* множество возможных начальных состояний pc 
        \* в пользовательских сеансах
        
        LET pc == 
                [{"pc"} -> 
                        {<<"p_add_paper", "lbl_4">>,
                         <<"p_submit_paper", "lbl_4">>,
                         <<"p_change_status", "lbl_4">>,
                         <<"f_is_accepted", "lbl_5">>,
                         <<"p_allocate","lbl_7">>,
                         <<"f_get_paper","lbl_5">>,
                         <<"f_get_section_program","lbl_5">>}]
        IN
        
        \* обобщенное представление трассы - для удобства анализа
        
        /\ Trace     = <<>>
        /\ StateE    =  [e1 \in E0 |-> {}] @@ [e2 \in E1 |-> {}]                                                                            
        /\ Sessions  \in 
            [S -> 
                FoldSet(LAMBDA x, y: x \cup 
                    {y @@ [SessionM |-> <<>>]
                       @@ [PCLabel  |-> <<min>>]
                       @@ [Ret      |-> <<>>]},                                                                 
                       {}, 
                       
                       \* множество начальных состояний StateRegs для 
                       \* заданных пользовательских сеансов
                       
                       [{"StateRegs"} -> 
                            FoldSet (LAMBDA x, y: 
                                x \cup ({<<y @@ [fp |->1]>>}), {}, pc) ])]
        /\ SLocks   = 
            [s \in S |-> [e1 \in E0 |-> {}] 
             @@ [e2 \in E1 |-> 
                \* step3 invariant violation fix 
                CASE 
                    \* если первый блок сеанса f_is_accepted, то
                    \*  открываем блокировку manager
                     
                   /\ Sessions[s]["StateRegs"][1]["pc"][1] = "f_is_accepted"
                   /\ e2 = "manager"  ->  {s}
                [] /\ Sessions[s]["StateRegs"][1]["pc"][1] = "p_allocate"
                   /\ e2 = "manager"  ->  {s}
                [] OTHER -> {}]]                         
        /\ New2Old  = <<<<max>>, <<min>>>>
        /\ Ignore   = 0
        /\ XLocks   = Undef
        /\ VPol     = 
           [
            col_submissions_submission_id   |-> [ext|->0, policy |-> min,
                                       name |-> "col_submissions_submission_id"],
            col_submissions_paper_id        |-> [ext|->0, policy |-> min,
                                       name |-> "col_submissions_paper_id"],
            col_submissions_conference_id   |-> [ext|->0, policy |-> min,
                                       name |-> "col_submissions_conference_id"],
            col_submissions_submission_date |-> [ext|->0, policy |-> min,
                                       name |-> "col_submissions_submission_date"],
            col_submissions_status          |-> [ext|->0, policy |-> min,
                                       name |-> "col_submissions_status"],
           
            col_logs_event_id               |-> [ext|->0, policy |-> min,
                                       name |-> "col_logs_event_id"],
            col_logs_err_info               |-> [ext|->0, policy |-> min,
                                       name |-> "col_logs_err_info"],

            col_papers_paper_id             |-> [ext|->0, policy |-> min,
                                       name |-> "col_papers_paper_id"],
            col_papers_title                |-> [ext|->0, policy |-> min,
                                       name |-> "col_papers_title"],
            col_papers_abstract             |-> [ext|->0, policy |-> min,
                                       name |-> "col_papers_abstract"], 
            col_papers_text                 |-> [ext|->0, policy |-> min,
                                       name |-> "col_papers_text"], 
            col_papers_authors              |-> [ext|->0, policy |-> min,
                                       name |-> "col_papers_authors"], 

            col_conferences_conference_id   |-> [ext|->0, policy |-> min,
                                       name |-> "col_conferences_conference_id"],
            col_conferences_name            |-> [ext|->0, policy |-> min,
                                       name |-> "col_conferences_name"],
            col_conferences_start_date      |-> [ext|->0, policy |-> min,
                                       name |-> "col_conferences_start_date"],
            col_conferences_end_date        |-> [ext|->0, policy |-> min,
                                       name |-> "col_conferences_end_date"], 
            col_conferences_description     |-> [ext|->0, policy |-> min,
                                       name |-> "col_conferences_description"], 

            col_sections_paper_id           |-> [ext|->0, policy |-> min,
                                       name |-> "col_sections_paper_id"],
            col_sections_title              |-> [ext|->0, policy |-> min,
                                       name |-> "col_sections_title"],
            col_sections_start_date         |-> [ext|->0, policy |-> min,
                                       name |-> "col_sections_start_date"],
            col_sections_end_date           |-> [ext|->0, policy |-> min,
                                       name |-> "col_sections_end_date"], 
            col_sections_description        |-> [ext|->0, policy |-> min,
                                       name |-> "col_sections_description"], 

            col_allocations_allocation_id   |-> [ext|->0, policy |-> min,
                                       name |-> "col_allocations_allocation_id"],
            col_allocations_submission_id   |-> [ext|->0, policy |-> min,
                                       name |-> "col_allocations_submission_id"],
            col_allocations_section_id      |-> [ext|->0, policy |-> min,
                                       name |-> "col_allocations_section_id"],
            col_allocations_allocation_date |-> [ext|->0, policy |-> min,
                                       name |-> "col_allocations_allocation_date"]
           ] 
(*                       
Next == 
        \/ \E  s \in S :
            /\ Sessions[s]["StateRegs"] # <<>>
            /\ dispatch(s,Sessions[s]["StateRegs"])
        \/ \A  s \in S : 
            /\ Sessions[s]["StateRegs"] = <<>>
            /\ UNCHANGED vars
*)           
Next == 
        \/  /\ XLocks = Undef
            /\ \E  s \in S : 
               /\ Sessions[s]["StateRegs"] # <<>>
               /\ dispatch(s,Sessions[s]["StateRegs"])
        \/  \E  s \in S : 
            /\ XLocks = s
            /\ dispatch(s,Sessions[s]["StateRegs"])
        \/  /\ XLocks = Undef
            /\ \A s \in S : Sessions[s]["StateRegs"] = <<>>
            /\ UNCHANGED vars
      
Next_test == UNCHANGED vars

SpecFS == Init /\ [] [Next]_vars 

\*SpecFS == Init /\ [] [Next_test]_vars
               
                  
=============================================================================
\* Modification History
\* Last modified Wed Jun 15 23:27:26 MSK 2022 by user-sc
\* Created Wed Oct 21 12:17:41 MSK 2020 by user-sc
