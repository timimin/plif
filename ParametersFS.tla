--------------------------- MODULE ParametersFS------------------------------
(***************************************************************************)
(* procedure create_employee (lname varchar2(50),fname varchar2(50), sal   *)
(* number) is                                                              *)
(*     insert into employees (employee_id, last_name, first_name, salary)  *)
(*     values (200, lname, fname, sal);                                    *)
(* end;                                                                    *)
(***************************************************************************)


EXTENDS Naturals, Sequences

CONSTANT  U,         (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          UU,        (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          NONE,      (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          E0,        (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          E1,        (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************) 
          Undef,     (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          GPol       (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)

VARIABLES StateP,    (******************************************************)
                     (* the persistence memory state                       *)
                     (******************************************************)
          S,         (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          StateE,    (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          Sessions,  (******************************************************)
                     (* Sessions environment.  Maps user sessions to       *)
                     (* respective buffers.                                *)
                     (******************************************************)
          New2Old,   (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          TabLocks,  (******************************************************)
                     (* Represents tables exclusive locks, a record l \in  *)
                     (* [Tables -> ({NONE} \cup S)], where Tables is a set *)
                     (* of tables                                          *)
                     (******************************************************)
          VPol,      (******************************************************)
                     (* Global variables security policies which due to    *)
                     (* flow sensitivity can be changed over program       *)
                     (* execution in contrast to inputs and outputs        *)
                     (******************************************************)          
          UsedNats,  (******************************************************)
                     (* Natural numbers represent values flowing in the    *)
                     (* system                                             *)
                     (******************************************************)
         Trace,      (******************************************************)
                     (* Represents a program trace                         *)
                     (******************************************************)
         SLocks,     (******************************************************)
                     (* Session locks is a convenient mechanism for        *)
                     (* representing short-time IF locks which must be     *)
                     (* closed immediately after we leave the session      *)
                     (******************************************************)
         Ignore      (******************************************************)
                     (* The flag which is used to ignore an ifc policy     *)
                     (* violation warning (false alarm)                    *)
                     (******************************************************)
         (*
          New2Old,   (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          TabLocks,  (******************************************************)
                     (* Represents tables exclusive locks, a record l \in  *)
                     (* [Tables -> ({NONE} \cup S)], where Tables is a set *)
          StateM,    (******************************************************)
                     (* the user sessions memory state                     *)
                     (******************************************************)    
          StateRegs, (******************************************************)
                     (* user sessions program counters and stack frame     *)
                     (* pointers                                           *)
                     (******************************************************)
          Ret,       (******************************************************)
                     (* user sessions return values                        *)
                     (******************************************************)
         
          PCLabel,   (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          Trace      (******************************************************)
                     (* described in Paralocks module                      *)
                     (******************************************************)
          *)

vars == <<StateP, StateE, Sessions, 
            UsedNats, New2Old, S, TabLocks, VPol,Trace,SLocks,Ignore>>

(***************************************************************************)
(* The most liberal policy                                                 *)
(***************************************************************************)

min == {<<CHOOSE x \in UU: TRUE,<<[e1 \in E0 |-> {NONE}], 
                                  [e2 \in E1 |-> {NONE}]>>>>}
                                  
(***************************************************************************)
(* The most restrictive policy                                             *)
(***************************************************************************)

max == {}
                                                                             

(***************************************************************************)
(* The overall policy for Papers table is the lowest policy $\perp$.       *)
(***************************************************************************)

papers_t == [loc|->"persistence", offs|-> 0, size|->10, policy |-> min]                      
                                           
(***************************************************************************)
(* The overall policy is defined by the policy of Status field, which is   *)
(* available to all users if t_expire lock is open and to managers who may *)
(* allocate a paper into a session once the paper has been approved        *)
(***************************************************************************)

submissions_t == [loc|->"persistence", offs|-> 10, size|->10, policy |-> min]
                      (*              
                        {<<"x",<<[t_expire |-> {}], 
                        [guest |-> {NONE}, reviewer |-> {NONE}, 
                         manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                        <<"x",<<[t_expire |-> {NONE}], 
                        [guest |-> {NONE}, reviewer |-> {NONE}, 
                         manager |-> {"x"}, organizer |-> {NONE}]>>>>}]
                       *)
(***************************************************************************)
(* The overall policy for Logs, Conferences, Sections and Allocations      *)
(* tables is the lowest policy $\perp$.                                    *)
(***************************************************************************)

conferences_t == [loc|->"persistence", offs|-> 20, size|->10, policy |-> min]
                          
sections_t    == [loc|->"persistence", offs|-> 30, size|->10, policy |-> min]              
                        
allocations_t == [loc|->"persistence", offs|-> 40, size|->10, policy |-> min]  

logs_t        == [loc|->"persistence", offs|-> 50, size|->10, policy |->                                       
                        {<<"x",<<[t_expire |-> {}], 
                        [guest |-> {NONE}, reviewer |-> {NONE}, 
                         manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                        <<"x",<<[t_expire |-> {NONE}], 
                        [guest |-> {NONE}, reviewer |-> {NONE}, 
                         manager |-> {"x"}, organizer |-> {NONE}]>>>>}
                        ]
                     
Calls         == {"p_submit_paper", "p_add_paper", "p_allocate", 
                  "p_change_status", "f_getsubmissions", "f_getaccepted", 
                  "f_getpaper", "f_getsection_program"}   

(***************************************************************************)
(* PROCEDURE p_submit_paper parmeters.                                     *)
(* The input param (submitted paper) has the lowest policy.                *)
(***************************************************************************)                       

p_sp_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]                
                         
(***************************************************************************)
(* PROCEDURE p_add_paper parameters.                                       *)
(* The input param (added paper) has the lowest policy.                    *)
(***************************************************************************)                       

p_ap_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]                                        
                                                   
(***************************************************************************)
(* PROCEDURE p_allocate parameters.                                        *)
(* The input param (allocation info) has the lowest policy.  The local     *)
(* variable v_status and the single row cursor (SELECT) are available to   *)
(* managers only until t_expire becomes open.                              *)
(***************************************************************************)                       

p_a_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]

p_a_v1       == [loc|->"mem", offs|-> 1, size|->1, policy |-> min]
                          (*              
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]
                          *)
                          
p_a_c1       == [loc|->"mem", offs|-> 2, size|->1, policy |-> min]               
                         (*
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]
                          *)
p_a_e1       == [loc|->"mem", offs|-> 3, size|->1, policy |-> min]

(***************************************************************************)
(* PROCEDURE p_chahge_status parameters.                                   *)
(* The first input param (submission_id) has the lowest policy.  The       *)
(* second input param (stat) is available to managers only until t_expire  *)
(* becomes open.                                                           *)
(***************************************************************************)                       

p_cs_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]

p_cs_p2       == [loc|->"mem", offs|-> 1, size|->1, policy |->               
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]

(***************************************************************************)
(* FUNCTION f_getsubmissions parameters.                                   *)
(* The input param (c_id), the local variable (v_submissions), the cursor  *)
(* and the return value have the lowest policy                             *)
(***************************************************************************)

f_gs_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]              
                         
f_gs_v1       == [loc|->"mem", offs|-> 1, size|->1, policy |-> min]             
    
f_gs_c1       == [loc|->"mem", offs|-> 2, size|->1, policy |-> min]               
                                                 
f_gs_r        == [loc|->"mem", offs|-> 3, size|->1, policy |-> min]                          
                          
(***************************************************************************)
(* FUNCTION f_getaccepted parameters.                                      *)
(* The input param (c_id) has the lowest policy, the local variable        *)
(* (v_accepted), the cursor and the return value are available to managers *)
(* only until t_expire becomes open.                                       *)
(***************************************************************************)

f_ga_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]

f_ga_v1       == [loc|->"mem", offs|-> 1, size|->1, policy |->                
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]

f_ga_c1       == [loc|->"mem", offs|-> 2, size|->1, policy |->                
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]
                          
f_ga_r        == [loc|->"mem", offs|-> 3, size|->1, policy |->                
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]                          

(***************************************************************************)
(* FUNCTION f_getpaper parameters.                                         *)
(* The input param (p_id) and the ret value have the lowest policy, the    *)
(* local variable (v_paper) and the single row cursor are available to     *)
(* managers only until t_expire becomes open.                              *)
(***************************************************************************)

f_gp_p1       == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]

f_gp_v1       == [loc|->"mem", offs|-> 1, size|->1, policy |->                
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]

f_gp_c1       == [loc|->"mem", offs|-> 2, size|->1, policy |->                
                         {<<"x",<<[t_expire |-> {}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {NONE}, organizer |-> {NONE}]>>>>,
                         <<"x",<<[t_expire |-> {NONE}], 
                         [guest |-> {NONE}, reviewer |-> {NONE}, 
                          manager |-> {"x"}, organizer |-> {NONE}]>>>>}]
                          
f_gp_r        == [loc|->"mem", offs|-> 3, size|->1, policy |-> min]                           

(***************************************************************************)
(* FUNCTION f_getsection_program parameters.                               *)
(* The input param (p_id), the local variable (v_program), the cursor and  *)
(* the return value have the lowest policy                                 *)
(***************************************************************************)

f_gsp_p1     == [loc|->"mem", offs|-> 0, size|->1, policy |-> min]              
                         
f_gsp_v1     == [loc|->"mem", offs|-> 1, size|->1, policy |-> min]

f_gsp_c1     == [loc|->"mem", offs|-> 2, size|->1, policy |-> min]              
                         
f_gsp_r(u)   == [loc|->"mem", offs|-> 3, size|->1, policy |-> \*min]   
                          {<<u,<<[e1 \in E0 |-> {NONE}], 
                          [e2 \in E1 |-> {NONE}]>>>>}]          
                         
StateX == {papers_t, submissions_t, conferences_t, sections_t, allocations_t, 
           logs_t, p_sp_p1, p_ap_p1,p_a_p1, p_a_v1, p_a_c1, p_a_e1, p_cs_p1, 
           p_cs_p2, f_gs_p1, f_gs_v1, f_gs_c1, f_gs_r, f_ga_p1, f_ga_v1, 
           f_ga_c1, f_ga_r, f_gp_p1, f_gp_v1, f_gp_c1, f_gp_r, f_gsp_p1, 
           f_gsp_v1, f_gsp_c1, f_gsp_r(CHOOSE u \in U: TRUE)}

         
INSTANCE Paralocks WITH StateX <- StateX, 
         U <- U, UU <- UU, S <- S, NONE <- NONE, E0 <- E0, E1 <- E1, 
         Undef <- Undef, GPol <- GPol, New2Old <- New2Old,
         StateE <- StateE
         (*
         PCLabel <- PCLabel,
         New2Old <- New2Old, Trace <- Trace*)

(***************************************************************************)
(* The type invariant                                                      *)
(***************************************************************************)

(*
TypeOK == 
    /\ StateM \in [S -> Tup([val : Data], StackLength)]
    /\ StateP \in Tup([val : Data \cup {Undef}], PMemoryLength)
    /\ StateRegs \in 
        [S -> Seq([pc : {<<x, <<"l","b","l","_">> \o y>> : x \in Calls,
            y \in SeqOf({"0","1","2","3","4","5","6","7","8","9"}, 3)},
                fp : 0..StackLength])]
    /\ Ret \in [S -> [val:Data \cup {Undef}]]
*)


    
\*Addr_point1 == [loc|->"mem",offs|-> 4]
\*Addr_ptr == [loc|->"mem",offs|-> 6]
\*Addr_max_param_u == [loc|->"stack_data",offs|->0]
\*Addr_max_param_v == [loc|->"stack_data",offs|->1]
\*Addr_max___retres == [loc|->"stack_data",offs|->2]
\*Addr_inc_param_c == [loc|->"stack_data",offs|->0]
\*Addr_inc_m == [loc|->"stack_data",offs|->1]
\*Addr_dec_param_d == [loc|->"stack_data",offs|->0]
\*Addr_dec_i == [loc|->"stack_data",offs|->1]

--------------------------------------------------------------------------------
(* Generating macros of offsets and sizes *)
\*Size_of_int == 1
\*Offset_point_x == 0
\*Offset_point_y == 1
\*Size_of_point == 2
===========================================================================
----------------------------- MODULE Parameters -----------------------------


=============================================================================
\* Modification History
\* Last modified Wed Feb 03 12:45:51 MSK 2021 by user-sc
\* Last modified Tue Oct 13 11:26:10 MSK 2020 by user-sc
\* Last modified Wed Aug 19 14:25:25 MSK 2020 by User
\* Created Tue Aug 04 12:15:07 MSK 2020 by User
