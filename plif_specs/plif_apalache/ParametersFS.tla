--------------------------- MODULE ParametersFS------------------------------
(***************************************************************************)
(* procedure create_employee (lname vartateXchar2(50),fname varchar2(50),  *)
(* sal number) is                                                          *)
(*     insert into employees (employee_id, last_name, first_name, salary)  *)
(*     values (200, lname, fname, sal);                                    *)
(* end;                                                                    *)
(***************************************************************************)

EXTENDS Paralocks

 \* @type: Int;
 Session_number 
				== 1 (******************************************************)
                     (* the number of user sessions                        *)
                     (******************************************************)
         
VARIABLES 
\* @typeAlias: SESM  = Seq(POLICY); 
\* @typeAlias: PCLAB = Seq(POLICY); 
\* @typeAlias: RET   = Seq(POLICY); 
\* @typeAlias: SREGS = Seq([pc: <<Str, Str>>, fp: Int]); 
(* @typeAlias: SESSIONS = U -> [SessionM: SESM, PCLabel: PCLAB, 
                                Ret: RET, StateRegs: SREGS];
*)
\* @type: SESSIONS;
		  Sessions,  (******************************************************)
                     (* Sessions environment.  Maps user sessions to       *)
                     (* respective buffers.                                *)
                     (******************************************************)
          \* @type: U;
		  XLocks,    (******************************************************)
                     (* Represents exclusive locks for immitating the      *)
                     (* system where procedures can be executed one at a   *)
                     (* time                                               *)
                     (******************************************************)
          \* @type: Str -> [ext: Int, policy: POLICY, name: Str];
		  VPol,      (******************************************************)
                     (* Global variables security policies which due to    *)
                     (* flow sensitivity can be changed over program       *)
                     (* execution in contrast to inputs and outputs        *)
                     (******************************************************)          
          \* @type: Seq(<<U,Str>>);
		  Trace,     (******************************************************)
                     (* Represents a program trace                         *)
                     (******************************************************)
          \* @type: U -> LOCKS;
		  SLocks,    (******************************************************)
                     (* Session locks is a convenient mechanism for        *)
                     (* representing short-time IF locks which must be     *)
                     (* closed immediately after we leave the session      *)
                     (******************************************************)
          \* @type: Int;
		  Ignore,    (******************************************************)
                     (* The flag which is used to ignore an ifc policy     *)
                     (* violation warning (false alarm)                    *)
                     (******************************************************)
          \* @type: LOCKS;
		  StateE,    (******************************************************)
                     (* the set of open locks (for concrete actors)        *)
                     (******************************************************)
          \* @type: <<Seq(POLICY), Seq(POLICY)>>; 
		  New2Old    (******************************************************)
                     (* this is the tuple of the form <<old, new>>, where  *)
                     (* old - the policy of the changed variable, new -    *)
                     (* the policy of the expression assigned specified to *)
                     (* the current lock state                             *)
                     (******************************************************)

\* @typeAlias: CLAUSE = <<U,<<E0 -> Set(U), E1 -> Set(U)>>>>;				   
\* @typeAlias: POLICY = Set(CLAUSE); 

                     
vars == <<Sessions, SLocks, StateE,
          New2Old, XLocks, VPol, Trace, Ignore>>

varsNoTrace == <<Sessions, SLocks, StateE,
                 New2Old, XLocks, VPol, Ignore>>
                                                                                   

(***************************************************************************)
(* The most liberal policy                                                 *)
(***************************************************************************)

\* @type: POLICY;
(*
min == {<<CHOOSE x \in UU: TRUE,<<[e1 \in E0 |-> {NONE}], 
                                  [e2 \in E1 |-> {NONE}]>> >>}
*)

min == {<<"x",<<[e1 \in E0 |-> {NONE}], 
                                  [e2 \in E1 |-> {NONE}]>> >>}

\* @type: U => POLICY;
any_caller(x) == {<<x, <<[e1 \in E0 |-> {NONE}], 
                                  [e2 \in E1 |-> {NONE}]>> >>}
                                  
(***************************************************************************)
(* The most restrictive policy                                             *)
(***************************************************************************)

\* @type: POLICY;
max == {}

u1 == CHOOSE i \in UU: TRUE 
u2 == CHOOSE j \in UU: j#u1
                                                                                                                        
(***************************************************************************)
(* Initial policy for all columns of Submissions table is min.  Though at  *)
(* runtime the status policy will be changed accordinally to the global    *)
(* policy: submission status is available to all users if t_expire lock is *)
(* open and to managers who may allocate a paper into a session once the   *)
(* paper has been approved                                                 *)
(***************************************************************************)

col_submissions_submission_id   == [loc|->"persistence", policy |-> min]
col_submissions_paper_id        == [loc|->"persistence", policy |-> min]
col_submissions_conference_id   == [loc|->"persistence", policy |-> min]
col_submissions_submission_date == [loc|->"persistence", policy |-> min]
col_submissions_status          == [loc|->"persistence", policy |-> min]

(***************************************************************************)
(* The status would be policy: {<<"x",<<[t_expire |-> {}], [guest |->      *)
(* {NONE}, reviewer |-> {NONE}, manager |-> {NONE}, organizer |->          *)
(* {NONE}]>>>>, <<"x",<<[t_expire |-> {NONE}], [guest |-> {NONE}, reviewer *)
(* |-> {NONE}, manager |-> {"x"}, organizer |-> {NONE}]>>>>}               *)
(***************************************************************************)              
                       
(***************************************************************************)
(* Initial policy for Logs, Conferences, Sections and Allocations columns  *)
(* is the lowest policy $\perp$.                                           *)
(***************************************************************************)

col_logs_event_id               == [loc|->"persistence", policy |-> min]
col_logs_err_info               == [loc|->"persistence", policy |-> min]

col_papers_paper_id             == [loc|->"persistence", policy |-> min]
col_papers_title                == [loc|->"persistence", policy |-> min]
col_papers_abstract             == [loc|->"persistence", policy |-> min] 
col_papers_authors              == [loc|->"persistence", policy |-> min] 
col_papers_text                 == [loc|->"persistence", policy |-> min] 

col_conferences_conference_id   == [loc|->"persistence", policy |-> min]
col_conferences_name            == [loc|->"persistence", policy |-> min]
col_conferences_start_date      == [loc|->"persistence", policy |-> min]
col_conferences_end_date        == [loc|->"persistence", policy |-> min] 
col_conferences_description     == [loc|->"persistence", policy |-> min] 

col_sections_paper_id           == [loc|->"persistence", policy |-> min]
col_sections_title              == [loc|->"persistence", policy |-> min]
col_sections_start_date         == [loc|->"persistence", policy |-> min]
col_sections_end_date           == [loc|->"persistence", policy |-> min] 
col_sections_description        == [loc|->"persistence", policy |-> min] 

col_allocations_allocation_id   == [loc|->"persistence", policy |-> min]
col_allocations_submission_id   == [loc|->"persistence", policy |-> min]
col_allocations_section_id      == [loc|->"persistence", policy |-> min]
col_allocations_allocation_date == [loc|->"persistence", policy |-> min] 
                   
Calls         == {"p_submit_paper", "p_add_paper", "p_allocate", 
                  "p_change_status", "f_getsection_program", "f_is_accepted"}   

(***************************************************************************)
(* PROCEDURE p_submit_paper markup.  All input parameters including Status *)
(* have any_caller policy.                                                 *)
(***************************************************************************)                       

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_sp_p_s_id(x)          == [loc|->"mem", offs |->0, policy |-> any_caller(x), 
                                                      name |-> "p_sp_p_s_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_sp_p_p_id(x)          == [loc|->"mem", offs |->1, policy |-> any_caller(x), 
                                                      name |-> "p_sp_p_p_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_sp_p_c_id(x)          == [loc|->"mem", offs |->2, policy |-> any_caller(x), 
                                                      name |-> "p_sp_p_c_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_sp_p_sub_date(x)      == [loc|->"mem", offs |->3, policy |-> any_caller(x), 
                                                  name |-> "p_sp_p_sub_date"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_sp_p_stat(x)          == [loc|->"mem", offs |->4, policy |-> any_caller(x), 
                                                      name |-> "p_sp_p_stat"]               
                         
(***************************************************************************)
(* PROCEDURE p_add_paper markup.  All input parameters have any_caller     *)
(* policy.  The OTHER exception policy is min.                             *)
(***************************************************************************)                       

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_ap_p_p_id(x)          == [loc|->"mem", offs |->0, policy |-> any_caller(x),
                                                      name |-> "p_ap_p_p_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_ap_p_papers_tit(x)    == [loc|->"mem", offs |->1, policy |-> any_caller(x),
                                                name |-> "p_ap_p_papers_tit"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_ap_p_papers_abst(x)   == [loc|->"mem", offs |->2, policy |-> any_caller(x),
                                               name |-> "p_ap_p_papers_abst"] 

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_ap_p_t(x)             == [loc|->"mem", offs |->3, policy |-> any_caller(x),
                                                      name |-> "p_ap_p_t"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_ap_p_auth(x)          == [loc|->"mem", offs |->4, policy |-> any_caller(x),
                                                      name |-> "p_ap_p_auth"] 

(***************************************************************************)
(* FUNCTION f_is_accepted markup.  All input parameters and return value   *)
(* have any_caller policy.  This global policy assertion is wrong and will *)
(* be corrected during analisys.                                           *)
(***************************************************************************)                       

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_ia_p_s_id(x)          == [loc|->"mem", offs |->0, policy |-> any_caller(x),
                                                      name |-> "f_ia_p_s_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_ia_v_v_status(x)      == [loc|->"mem", offs |->1, policy |-> min,
                                                  name |-> "f_ia_v_v_status"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_ia_r(x)            == [loc|->"mem", offs |->2, policy |-> 
                        {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {NONE}
								              []   e2 = "manager" -> {x}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "f_ia_r"]
                                       
(***************************************************************************)
(* PROCEDURE p_allocate markup.  Global policy states: grant execute on    *)
(* p_allocate to managers.  So input parameters are available to managers. *)
(* Local variable v_status and the exception PAPER_NOT_ACCEPTED have min   *)
(* policy.                                                                 *)
(***************************************************************************)                       

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_p_a_id(x) == 
               [loc |-> "mem", offs |-> 0, policy |-> 
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {NONE}
								              []   e2 = "manager" -> {x}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_al_p_a_id"]                                     

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_p_s_id(x) == 
               [loc    |->"mem", offs |-> 1, policy |->
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {NONE}
								              []   e2 = "manager" -> {x}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_al_p_s_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_p_sec_id(x) == 
               [loc    |->"mem", offs |-> 2, policy |->
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {NONE}
								              []   e2 = "manager" -> {x}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_al_p_sec_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_p_alloc_date(x) == 
               [loc    |->"mem", offs |-> 3, policy |->
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {NONE}
								              []   e2 = "manager" -> {x}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_al_p_alloc_date"]
                                     
\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_v_p_id(x)               == [loc|->"mem", offs |-> 4, policy |-> min,
                                              name |-> "p_al_v_p_id"]                        

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_e_PAPER_NOT_ACCEPTED(x) == [loc|->"mem", offs |-> 5, policy |-> min,
                                 name |-> "p_al_e_PAPER_NOT_ACCEPTED"]


\* для каждого вызова функции в выражении создаем отдельную переменную

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_al_v_is_acc(x) == [loc|->"mem", offs |-> 6, policy |-> min,
                     name |-> "p_al_v_is_acc"]

(***************************************************************************)
(* PROCEDURE p_chahge_status markup.  Global policy states: grant execute  *)
(* on p_change_status to reviewer.  So input params (s_id, stat) are       *)
(* available to reviewers.                                                 *)
(***************************************************************************)                       

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_cs_p_s_id(x) == 
               [loc    |->"mem", offs |->0, policy |->
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {x}
								              []   e2 = "manager" -> {NONE}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_cs_p_s_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
p_cs_p_stat(x) == 
               [loc    |->"mem", offs |->1, policy |->
                {<<x,<<[e1 \in E0 |-> CASE e1 = "t_expire" -> {NONE}], 
						       [e2 \in E1 |-> CASE e2 = "guest" -> {NONE}
                				              []   e2 = "reviewer" -> {x}
								              []   e2 = "manager" -> {NONE}
											  []   e2 = "organizer" -> {NONE}]				                   
                            >>>>}, name |-> "p_cs_p_stat"]

(***************************************************************************)
(* FUNCTION f_getsection_program markup.  A section program is available   *)
(* to all users.  So input param (s_id) has any_caller policy.  The local  *)
(* variable (v_program) any_caller policy.  The return value of the        *)
(* function has has also any_caller policy and represents a collection of  *)
(* %PAPER type.  We restrict the collection to 2 rows, each row consists   *)
(* of 5 columns                                                            *)
(***************************************************************************)

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_p_s_id (x)       == [loc|->"mem", offs |-> 0, policy |-> any_caller(x),
                                                      name |-> "f_gsp_p_s_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e1_c1(x)   == [loc|->"mem", offs |-> 1, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e1_c1"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e1_c2(x)   == [loc|->"mem", offs |-> 2, policy |-> any_caller(x),
                                                    name |-> "f_gsp_r_arr_e1_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e1_c3(x)   == [loc|->"mem", offs |-> 3, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e1_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e1_c4(x)   == [loc|->"mem", offs |-> 4, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e1_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e1_c5(x)   == [loc|->"mem", offs |-> 5, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e1_c5"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e2_c1(x)   == [loc|->"mem", offs |-> 6, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e2_c1"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e2_c2(x)   == [loc|->"mem", offs |-> 7, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e2_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e2_c3(x)   == [loc|->"mem", offs |-> 8, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e2_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e2_c4(x)  == [loc|->"mem", offs |-> 9,  policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e2_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_r_arr_e2_c5(x)  == [loc|->"mem", offs |-> 10, policy |-> any_caller(x),
                                                      name |-> "f_gsp_r_arr_e2_c5"]


\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e1_c1(x)    == [loc|->"mem", offs |-> 11, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e1_c1"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e1_c2(x)    == [loc|->"mem", offs |-> 12, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e1_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e1_c3(x)    == [loc|->"mem", offs |-> 13, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e1_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e1_c4(x)    == [loc|->"mem", offs |-> 14, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e1_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e1_c5(x)    == [loc|->"mem", offs |-> 15, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e1_c5"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e2_c1(x)    == [loc|->"mem", offs |-> 16, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e2_c1"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e2_c2(x)    == [loc|->"mem", offs |-> 17, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e2_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e2_c3(x)    == [loc|->"mem", offs |-> 18, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e2_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e2_c4(x)    == [loc|->"mem", offs |-> 19, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e2_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gsp_v_program_arr_e2_c5(x)    == [loc|->"mem", offs |-> 20, policy |-> min,
                                                 name |-> "f_gsp_v_program_arr_e2_c5"]                     
                         
(***************************************************************************)
(* FUNCTION f_get_paper markup.  A paper is available to all users.  So    *)
(* input param (p_id) and return value have any_caller policy.  The local  *)
(* variable (v_paper) has min policy.                                      *)
(***************************************************************************)

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_p_p_id (x)        == [loc|->"mem", offs |-> 0, policy |-> any_caller(x),
                                                    name |-> "f_gp_p_p_id"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_r_rec_c1(x)       == [loc|->"mem", offs |-> 1, policy |-> any_caller(x),
                                                    name |-> "f_gp_r_rec_c1"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_r_rec_c2(x)       == [loc|->"mem", offs |-> 2, policy |-> any_caller(x),
                                                    name |-> "f_gp_r_rec_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_r_rec_c3(x)       == [loc|->"mem", offs |-> 3, policy |-> any_caller(x),
                                                    name |-> "f_gp_r_rec_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_r_rec_c4(x)       == [loc|->"mem", offs |-> 4, policy |-> any_caller(x),
                                                    name |-> "f_gp_r_rec_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_r_rec_c5(x)       == [loc|->"mem", offs |-> 5, policy |-> any_caller(x),
                                                    name |-> "f_gp_r_rec_c5"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_v_paper_rec_c1(x)           == [loc|->"mem", offs |-> 6, policy |-> min,
                                                  name |-> "f_gp_v_paper_rec_c1"]

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_v_paper_rec_c2(x)           == [loc|->"mem", offs |-> 7, policy |-> min,
                                                  name |-> "f_gp_v_paper_rec_c2"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_v_paper_rec_c3(x)           == [loc|->"mem", offs |-> 8, policy |-> min,
                                                  name |-> "f_gp_v_paper_rec_c3"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_v_paper_rec_c4(x)          == [loc|->"mem", offs |-> 9, policy |-> min,
                                                  name |-> "f_gp_v_paper_rec_c4"]  

\* @type: U => [loc: Str, offs: Int, policy: POLICY, name: Str];
f_gp_v_paper_rec_c5(x)          == [loc|->"mem", offs |-> 10, policy |-> min,
                                                  name |-> "f_gp_v_paper_rec_c5"]
  
         
(***************************************************************************)
(* The set of session users for specified session number                   *)
(***************************************************************************)

S ==  {"allen", "bob"} \*, "mattew", "john"}

\*S == CHOOSE s \in SUBSET(U) : Cardinality(s) = Session_number
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
\* Last modified Sun Jan 09 23:03:45 MSK 2022 by user-sc
\* Last modified Sat Jan 08 12:15:02 MSK 2022 by user-sc
\* Last modified Thu Sep 23 17:09:18 MSK 2021 by user-sc
\* Last modified Tue Oct 13 11:26:10 MSK 2020 by user-sc
\* Last modified Wed Aug 19 14:25:25 MSK 2020 by User
\* Created Tue Aug 04 12:15:07 MSK 2020 by User
