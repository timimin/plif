------------------------------- MODULE Parameters -------------------------------
EXTENDS Naturals, Sequences
CONSTANT U, UU, NONE, ALL, E0, E1, Undef, GPol, Session_number
VARIABLES Sessions, XLocks, VPol, Trace, SLocks, Ignore, StateE, New2Old
vars == <<Sessions, SLocks, StateE, New2Old, XLocks, VPol, Trace, Ignore>>
INSTANCE Paralocks WITH U <- U, UU <- UU, NONE <- NONE, E0 <- E0, E1 <- E1, Undef <- Undef, GPol <- GPol
min == {<<CHOOSE x \in UU: TRUE, <<[e1 \in E0 |-> {NONE}],  [e2 \in E1 |-> {NONE}]>> >>}
any_caller(x) == {<<x, <<[e1 \in E0 |-> {NONE}], [e2 \in E1 |-> {NONE}]>> >>}
max == {}
u1 == CHOOSE i \in UU: TRUE
u2 == CHOOSE j \in UU: j#u1
S ==  CHOOSE s \in SUBSET(U) : Cardinality(s) = Session_number

col_allocations_allocation_id == [loc|->"persistence", policy |-> min]
col_allocations_paper_id == [loc|->"persistence", policy |-> min]
col_allocations_section_id == [loc|->"persistence", policy |-> min]
col_allocations_allocation_date == [loc|->"persistence", policy |-> min]
col_allocations_submission_id == [loc|->"persistence", policy |-> min]

col_conferences_conference_id == [loc|->"persistence", policy |-> min]
col_conferences_name == [loc|->"persistence", policy |-> min]
col_conferences_start_date == [loc|->"persistence", policy |-> min]
col_conferences_end_date == [loc|->"persistence", policy |-> min]
col_conferences_description == [loc|->"persistence", policy |-> min]

col_logs_event_id == [loc|->"persistence", policy |-> min]
col_logs_err_info == [loc|->"persistence", policy |-> min]

col_papers_paper_id == [loc|->"persistence", policy |-> min]
col_papers_title == [loc|->"persistence", policy |-> min]
col_papers_abstract == [loc|->"persistence", policy |-> min]
col_papers_text == [loc|->"persistence", policy |-> min]
col_papers_authors == [loc|->"persistence", policy |-> min]

col_sections_section_id == [loc|->"persistence", policy |-> min]
col_sections_title == [loc|->"persistence", policy |-> min]
col_sections_place == [loc|->"persistence", policy |-> min]
col_sections_start_date == [loc|->"persistence", policy |-> min]
col_sections_end_date == [loc|->"persistence", policy |-> min]
col_sections_conference_id == [loc|->"persistence", policy |-> min]

col_submissions_submission_id == [loc|->"persistence", policy |-> min]
col_submissions_paper_id == [loc|->"persistence", policy |-> min]
col_submissions_conference_id == [loc|->"persistence", policy |-> min]
col_submissions_submission_date == [loc|->"persistence", policy |-> min]
col_submissions_status == [loc|->"persistence", policy |-> min]

p_add_paper_p_p_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "p_add_paper_p_p_id"]
p_add_paper_p_tit(x) == [loc|->"mem", offs |-> 1, policy |-> any_caller(x), name |-> "p_add_paper_p_tit"]
p_add_paper_p_absr(x) == [loc|->"mem", offs |-> 2, policy |-> any_caller(x), name |-> "p_add_paper_p_absr"]
p_add_paper_p_t(x) == [loc|->"mem", offs |-> 3, policy |-> any_caller(x), name |-> "p_add_paper_p_t"]
p_add_paper_p_auth(x) == [loc|->"mem", offs |-> 4, policy |-> any_caller(x), name |-> "p_add_paper_p_auth"]

p_allocate_p_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "p_allocate_p_id"]
p_allocate_p_s_id(x) == [loc|->"mem", offs |-> 1, policy |-> any_caller(x), name |-> "p_allocate_p_s_id"]
p_allocate_p_sec_id(x) == [loc|->"mem", offs |-> 2, policy |-> any_caller(x), name |-> "p_allocate_p_sec_id"]
p_allocate_p_alloc_date(x) == [loc|->"mem", offs |-> 3, policy |-> any_caller(x), name |-> "p_allocate_p_alloc_date"]
p_allocate_e_paper_not_accepted(x) == [loc|->"mem", offs |-> 4, policy |-> min, name |-> "p_allocate_e_paper_not_accepted"]
p_allocate_v_v_p_id(x) == [loc|->"mem", offs |-> 5, policy |-> min, name |-> "p_allocate_v_v_p_id"]
p_allocate_v_v_is_acc(x) == [loc|->"mem", offs |-> 6, policy |-> min, name |-> "p_allocate_v_v_is_acc"]

p_change_status_p_s_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "p_change_status_p_s_id"]
p_change_status_p_stat(x) == [loc|->"mem", offs |-> 1, policy |-> any_caller(x), name |-> "p_change_status_p_stat"]

p_submit_paper_p_s_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "p_submit_paper_p_s_id"]
p_submit_paper_p_p_id(x) == [loc|->"mem", offs |-> 1, policy |-> any_caller(x), name |-> "p_submit_paper_p_p_id"]
p_submit_paper_p_c_id(x) == [loc|->"mem", offs |-> 2, policy |-> any_caller(x), name |-> "p_submit_paper_p_c_id"]
p_submit_paper_p_sub_date(x) == [loc|->"mem", offs |-> 3, policy |-> any_caller(x), name |-> "p_submit_paper_p_sub_date"]
p_submit_paper_p_stat(x) == [loc|->"mem", offs |-> 4, policy |-> any_caller(x), name |-> "p_submit_paper_p_stat"]

f_get_paper_p_p_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "f_get_paper_p_p_id"]
f_get_paper_v_v_paper_rec_c1(x) == [loc|->"mem", offs |-> 1, policy |-> min, name |-> "f_get_paper_v_v_paper_rec_c1"]
f_get_paper_v_v_paper_rec_c2(x) == [loc|->"mem", offs |-> 2, policy |-> min, name |-> "f_get_paper_v_v_paper_rec_c2"]
f_get_paper_v_v_paper_rec_c3(x) == [loc|->"mem", offs |-> 3, policy |-> min, name |-> "f_get_paper_v_v_paper_rec_c3"]
f_get_paper_v_v_paper_rec_c4(x) == [loc|->"mem", offs |-> 4, policy |-> min, name |-> "f_get_paper_v_v_paper_rec_c4"]
f_get_paper_v_v_paper_rec_c5(x) == [loc|->"mem", offs |-> 5, policy |-> min, name |-> "f_get_paper_v_v_paper_rec_c5"]
f_get_paper_r_rec_c1(x) == [loc|->"mem", offs |-> 6, policy |-> any_caller(x), name |-> "f_get_paper_r_rec_c1"]
f_get_paper_r_rec_c2(x) == [loc|->"mem", offs |-> 7, policy |-> any_caller(x), name |-> "f_get_paper_r_rec_c2"]
f_get_paper_r_rec_c3(x) == [loc|->"mem", offs |-> 8, policy |-> any_caller(x), name |-> "f_get_paper_r_rec_c3"]
f_get_paper_r_rec_c4(x) == [loc|->"mem", offs |-> 9, policy |-> any_caller(x), name |-> "f_get_paper_r_rec_c4"]
f_get_paper_r_rec_c5(x) == [loc|->"mem", offs |-> 10, policy |-> any_caller(x), name |-> "f_get_paper_r_rec_c5"]

f_get_section_program_p_s_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "f_get_section_program_p_s_id"]
f_get_section_program_v_v_program_arr_e1_c1(x) == [loc|->"mem", offs |-> 1, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e1_c1"]
f_get_section_program_v_v_program_arr_e1_c2(x) == [loc|->"mem", offs |-> 2, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e1_c2"]
f_get_section_program_v_v_program_arr_e1_c3(x) == [loc|->"mem", offs |-> 3, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e1_c3"]
f_get_section_program_v_v_program_arr_e1_c4(x) == [loc|->"mem", offs |-> 4, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e1_c4"]
f_get_section_program_v_v_program_arr_e1_c5(x) == [loc|->"mem", offs |-> 5, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e1_c5"]
f_get_section_program_v_v_program_arr_e2_c1(x) == [loc|->"mem", offs |-> 6, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e2_c1"]
f_get_section_program_v_v_program_arr_e2_c2(x) == [loc|->"mem", offs |-> 7, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e2_c2"]
f_get_section_program_v_v_program_arr_e2_c3(x) == [loc|->"mem", offs |-> 8, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e2_c3"]
f_get_section_program_v_v_program_arr_e2_c4(x) == [loc|->"mem", offs |-> 9, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e2_c4"]
f_get_section_program_v_v_program_arr_e2_c5(x) == [loc|->"mem", offs |-> 10, policy |-> min, name |-> "f_get_section_program_v_v_program_arr_e2_c5"]
f_get_section_program_r_arr_e1_c1(x) == [loc|->"mem", offs |-> 11, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e1_c1"]
f_get_section_program_r_arr_e1_c2(x) == [loc|->"mem", offs |-> 12, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e1_c2"]
f_get_section_program_r_arr_e1_c3(x) == [loc|->"mem", offs |-> 13, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e1_c3"]
f_get_section_program_r_arr_e1_c4(x) == [loc|->"mem", offs |-> 14, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e1_c4"]
f_get_section_program_r_arr_e1_c5(x) == [loc|->"mem", offs |-> 15, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e1_c5"]
f_get_section_program_r_arr_e2_c1(x) == [loc|->"mem", offs |-> 16, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e2_c1"]
f_get_section_program_r_arr_e2_c2(x) == [loc|->"mem", offs |-> 17, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e2_c2"]
f_get_section_program_r_arr_e2_c3(x) == [loc|->"mem", offs |-> 18, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e2_c3"]
f_get_section_program_r_arr_e2_c4(x) == [loc|->"mem", offs |-> 19, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e2_c4"]
f_get_section_program_r_arr_e2_c5(x) == [loc|->"mem", offs |-> 20, policy |-> any_caller(x), name |-> "f_get_section_program_r_arr_e2_c5"]

f_is_accepted_p_s_id(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "f_is_accepted_p_s_id"]
f_is_accepted_v_v_status(x) == [loc|->"mem", offs |-> 1, policy |-> min, name |-> "f_is_accepted_v_v_status"]
f_is_accepted_r(x) == [loc|->"mem", offs |-> 2, policy |-> any_caller(x), name |-> "f_is_accepted_r"]

=============================================================================