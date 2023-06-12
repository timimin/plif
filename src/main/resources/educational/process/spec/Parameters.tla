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

col_uch_napravlenie_id == [loc|->"persistence", policy |-> min]
col_uch_napravlenie_head_id == [loc|->"persistence", policy |-> min]
col_uch_napravlenie_name == [loc|->"persistence", policy |-> min]
col_uch_napravlenie_short_name == [loc|->"persistence", policy |-> min]
col_uch_napravlenie_code == [loc|->"persistence", policy |-> min]
col_uch_napravlenie_order == [loc|->"persistence", policy |-> min]

col_uch_program_child_count == [loc|->"persistence", policy |-> min]
col_uch_program_child_razdel == [loc|->"persistence", policy |-> min]
col_uch_program_name == [loc|->"persistence", policy |-> min]
col_uch_program_sname == [loc|->"persistence", policy |-> min]
col_uch_program_tname == [loc|->"persistence", policy |-> min]
col_uch_program_code == [loc|->"persistence", policy |-> min]
col_uch_program_date == [loc|->"persistence", policy |-> min]
col_uch_program_type == [loc|->"persistence", policy |-> min]
col_uch_program_chasov == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_aud == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_l == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_p == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_s == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_o == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_o_name == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_sam_pr == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_sam == [loc|->"persistence", policy |-> min]
col_uch_program_chasov_att == [loc|->"persistence", policy |-> min]
col_uch_program_category == [loc|->"persistence", policy |-> min]
col_uch_program_srok == [loc|->"persistence", policy |-> min]
col_uch_program_form == [loc|->"persistence", policy |-> min]
col_uch_program_target == [loc|->"persistence", policy |-> min]
col_uch_program_rezult == [loc|->"persistence", policy |-> min]
col_uch_program_mtu == [loc|->"persistence", policy |-> min]
col_uch_program_osob == [loc|->"persistence", policy |-> min]
col_uch_program_rekom == [loc|->"persistence", policy |-> min]
col_uch_program_att == [loc|->"persistence", policy |-> min]
col_uch_program_authorlist == [loc|->"persistence", policy |-> min]
col_uch_program_control_qw == [loc|->"persistence", policy |-> min]
col_uch_program_unuse == [loc|->"persistence", policy |-> min]
col_uch_program_napr_id == [loc|->"persistence", policy |-> min]
col_uch_program_department_id == [loc|->"persistence", policy |-> min]
col_uch_program_id == [loc|->"persistence", policy |-> min]
col_uch_program_head_id == [loc|->"persistence", policy |-> min]

col_uch_programm_id == [loc|->"persistence", policy |-> min]
col_uch_programm_ierarh_id == [loc|->"persistence", policy |-> min]
col_uch_programm_level == [loc|->"persistence", policy |-> min]
col_uch_programm_count_child == [loc|->"persistence", policy |-> min]
col_uch_programm_unuse == [loc|->"persistence", policy |-> min]
col_uch_programm_programm_id == [loc|->"persistence", policy |-> min]
col_uch_programm_head_id == [loc|->"persistence", policy |-> min]
col_uch_programm_razdel == [loc|->"persistence", policy |-> min]
col_uch_programm_nonumeric == [loc|->"persistence", policy |-> min]
col_uch_programm_number == [loc|->"persistence", policy |-> min]
col_uch_programm_fullnumber == [loc|->"persistence", policy |-> min]
col_uch_programm_name == [loc|->"persistence", policy |-> min]
col_uch_programm_short_name == [loc|->"persistence", policy |-> min]
col_uch_programm_tablo_name == [loc|->"persistence", policy |-> min]
col_uch_programm_code == [loc|->"persistence", policy |-> min]
col_uch_programm_data == [loc|->"persistence", policy |-> min]
col_uch_programm_napravlenie == [loc|->"persistence", policy |-> min]
col_uch_programm_department == [loc|->"persistence", policy |-> min]
col_uch_programm_organization == [loc|->"persistence", policy |-> min]
col_uch_programm_type == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_audit == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_lection == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_practik == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_seminar == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_outer == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_outer_name == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_samost_prep == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_samost == [loc|->"persistence", policy |-> min]
col_uch_programm_count_chasov_attestat == [loc|->"persistence", policy |-> min]
col_uch_programm_category == [loc|->"persistence", policy |-> min]
col_uch_programm_srok == [loc|->"persistence", policy |-> min]
col_uch_programm_form == [loc|->"persistence", policy |-> min]
col_uch_programm_target == [loc|->"persistence", policy |-> min]
col_uch_programm_target_seminar == [loc|->"persistence", policy |-> min]
col_uch_programm_target_practik == [loc|->"persistence", policy |-> min]
col_uch_programm_target_samost == [loc|->"persistence", policy |-> min]
col_uch_programm_rezult == [loc|->"persistence", policy |-> min]
col_uch_programm_mtu == [loc|->"persistence", policy |-> min]
col_uch_programm_osob == [loc|->"persistence", policy |-> min]
col_uch_programm_rekom == [loc|->"persistence", policy |-> min]
col_uch_programm_attestationv == [loc|->"persistence", policy |-> min]
col_uch_programm_authorlist == [loc|->"persistence", policy |-> min]
col_uch_programm_control_qw == [loc|->"persistence", policy |-> min]
col_uch_programm_control_test == [loc|->"persistence", policy |-> min]
col_uch_programm_programm_link == [loc|->"persistence", policy |-> min]
col_uch_programm_index == [loc|->"persistence", policy |-> min]
col_uch_programm_child_count == [loc|->"persistence", policy |-> min]
col_uch_programm_child_razdel == [loc|->"persistence", policy |-> min]
col_uch_programm_sname == [loc|->"persistence", policy |-> min]
col_uch_programm_tname == [loc|->"persistence", policy |-> min]
col_uch_programm_date == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_aud == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_l == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_p == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_s == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_o == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_o_name == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_sam_pr == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_sam == [loc|->"persistence", policy |-> min]
col_uch_programm_chasov_att == [loc|->"persistence", policy |-> min]
col_uch_programm_att == [loc|->"persistence", policy |-> min]
col_uch_programm_napr_id == [loc|->"persistence", policy |-> min]
col_uch_programm_department_id == [loc|->"persistence", policy |-> min]

col_upr_department_id == [loc|->"persistence", policy |-> min]
col_upr_department_head_id == [loc|->"persistence", policy |-> min]
col_upr_department_ierarh_id == [loc|->"persistence", policy |-> min]
col_upr_department_level == [loc|->"persistence", policy |-> min]
col_upr_department_count_child == [loc|->"persistence", policy |-> min]
col_upr_department_title == [loc|->"persistence", policy |-> min]
col_upr_department_short_title == [loc|->"persistence", policy |-> min]
col_upr_department_short_title_r == [loc|->"persistence", policy |-> min]
col_upr_department_rashod == [loc|->"persistence", policy |-> min]
col_upr_department_pogar_nomer == [loc|->"persistence", policy |-> min]
col_upr_department_ucheb == [loc|->"persistence", policy |-> min]

f_UCHEBA_programm_list_p_data_view(x) == [loc|->"mem", offs |-> 0, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_view"]
f_UCHEBA_programm_list_p_data_unuse(x) == [loc|->"mem", offs |-> 1, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_unuse"]
f_UCHEBA_programm_list_p_data_name(x) == [loc|->"mem", offs |-> 2, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_name"]
f_UCHEBA_programm_list_p_data_code(x) == [loc|->"mem", offs |-> 3, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_code"]
f_UCHEBA_programm_list_p_date_n(x) == [loc|->"mem", offs |-> 4, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_date_n"]
f_UCHEBA_programm_list_p_date_o(x) == [loc|->"mem", offs |-> 5, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_date_o"]
f_UCHEBA_programm_list_p_data_naprav(x) == [loc|->"mem", offs |-> 6, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_naprav"]
f_UCHEBA_programm_list_p_data_kafedra(x) == [loc|->"mem", offs |-> 7, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_kafedra"]
f_UCHEBA_programm_list_p_data_chacov_n(x) == [loc|->"mem", offs |-> 8, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_chacov_n"]
f_UCHEBA_programm_list_p_data_chacov_o(x) == [loc|->"mem", offs |-> 9, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_p_data_chacov_o"]
f_UCHEBA_programm_list_v_r_rec_c1(x) == [loc|->"mem", offs |-> 10, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c1"]
f_UCHEBA_programm_list_v_r_rec_c2(x) == [loc|->"mem", offs |-> 11, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c2"]
f_UCHEBA_programm_list_v_r_rec_c3(x) == [loc|->"mem", offs |-> 12, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c3"]
f_UCHEBA_programm_list_v_r_rec_c4(x) == [loc|->"mem", offs |-> 13, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c4"]
f_UCHEBA_programm_list_v_r_rec_c5(x) == [loc|->"mem", offs |-> 14, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c5"]
f_UCHEBA_programm_list_v_r_rec_c6(x) == [loc|->"mem", offs |-> 15, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c6"]
f_UCHEBA_programm_list_v_r_rec_c7(x) == [loc|->"mem", offs |-> 16, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c7"]
f_UCHEBA_programm_list_v_r_rec_c8(x) == [loc|->"mem", offs |-> 17, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c8"]
f_UCHEBA_programm_list_v_r_rec_c9(x) == [loc|->"mem", offs |-> 18, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c9"]
f_UCHEBA_programm_list_v_r_rec_c10(x) == [loc|->"mem", offs |-> 19, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c10"]
f_UCHEBA_programm_list_v_r_rec_c11(x) == [loc|->"mem", offs |-> 20, policy |-> min, name |-> "f_UCHEBA_programm_list_v_r_rec_c11"]
f_UCHEBA_programm_list_r_rec_c1(x) == [loc|->"mem", offs |-> 21, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c1"]
f_UCHEBA_programm_list_r_rec_c2(x) == [loc|->"mem", offs |-> 22, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c2"]
f_UCHEBA_programm_list_r_rec_c3(x) == [loc|->"mem", offs |-> 23, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c3"]
f_UCHEBA_programm_list_r_rec_c4(x) == [loc|->"mem", offs |-> 24, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c4"]
f_UCHEBA_programm_list_r_rec_c5(x) == [loc|->"mem", offs |-> 25, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c5"]
f_UCHEBA_programm_list_r_rec_c6(x) == [loc|->"mem", offs |-> 26, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c6"]
f_UCHEBA_programm_list_r_rec_c7(x) == [loc|->"mem", offs |-> 27, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c7"]
f_UCHEBA_programm_list_r_rec_c8(x) == [loc|->"mem", offs |-> 28, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c8"]
f_UCHEBA_programm_list_r_rec_c9(x) == [loc|->"mem", offs |-> 29, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c9"]
f_UCHEBA_programm_list_r_rec_c10(x) == [loc|->"mem", offs |-> 30, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c10"]
f_UCHEBA_programm_list_r_rec_c11(x) == [loc|->"mem", offs |-> 31, policy |-> any_caller(x), name |-> "f_UCHEBA_programm_list_r_rec_c11"]

=============================================================================