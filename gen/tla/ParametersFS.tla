col_ALLOCATIONS_ALLOCATION_ID == [loc|->"persistence", policy |-> min]
col_ALLOCATIONS_PAPER_ID == [loc|->"persistence", policy |-> min]
col_ALLOCATIONS_SESSION_ID == [loc|->"persistence", policy |-> min]
col_ALLOCATIONS_ALLOCATION_DATE == [loc|->"persistence", policy |-> min]
col_CONFERENCES_CONFERENCE_ID == [loc|->"persistence", policy |-> min]
col_CONFERENCES_NAME == [loc|->"persistence", policy |-> min]
col_CONFERENCES_START_DATE == [loc|->"persistence", policy |-> min]
col_CONFERENCES_END_DATE == [loc|->"persistence", policy |-> min]
col_CONFERENCES_DESCRIPTION == [loc|->"persistence", policy |-> min]
col_LOGS_EVENT_ID == [loc|->"persistence", policy |-> min]
col_LOGS_ER_INFO == [loc|->"persistence", policy |-> min]
col_PAPERS_PAPER_ID == [loc|->"persistence", policy |-> min]
col_PAPERS_TITLE == [loc|->"persistence", policy |-> min]
col_PAPERS_ABSTRACT == [loc|->"persistence", policy |-> min]
col_PAPERS_TEXT == [loc|->"persistence", policy |-> min]
col_PAPERS_AUTHORS == [loc|->"persistence", policy |-> min]
col_SECTIONS_SECTION_ID == [loc|->"persistence", policy |-> min]
col_SECTIONS_TITLE == [loc|->"persistence", policy |-> min]
col_SECTIONS_PLACE == [loc|->"persistence", policy |-> min]
col_SECTIONS_START_DATE == [loc|->"persistence", policy |-> min]
col_SECTIONS_END_DATE == [loc|->"persistence", policy |-> min]
col_SECTIONS_CONFERENCE_ID == [loc|->"persistence", policy |-> min]
col_SUBMISSIONS_PAPER_ID == [loc|->"persistence", policy |-> min]
col_SUBMISSIONS_TITLE == [loc|->"persistence", policy |-> min]
col_SUBMISSIONS_ABSTRACTION == [loc|->"persistence", policy |-> min]
col_SUBMISSIONS_AUTHORS == [loc|->"persistence", policy |-> min]
col_SUBMISSIONS_TEXT == [loc|->"persistence", policy |-> min]

P_ADD_PAPER_p_P_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
P_ADD_PAPER_p_TIT(x) == [loc|->"mem", offs |->1, policy |-> any_caller(x)]
P_ADD_PAPER_p_ABSTR(x) == [loc|->"mem", offs |->2, policy |-> any_caller(x)]
P_ADD_PAPER_p_AUTH(x) == [loc|->"mem", offs |->3, policy |-> any_caller(x)]
P_ADD_PAPER_p_T(x) == [loc|->"mem", offs |->4, policy |-> any_caller(x)]

P_ALLOCATE_p_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
P_ALLOCATE_p_P_ID(x) == [loc|->"mem", offs |->1, policy |-> any_caller(x)]
P_ALLOCATE_p_S_ID(x) == [loc|->"mem", offs |->2, policy |-> any_caller(x)]
P_ALLOCATE_p_ALLOC_DATE(x) == [loc|->"mem", offs |->3, policy |-> any_caller(x)]
P_ALLOCATE_v_V_STATUS(x) == [loc|->"mem", offs |->4, policy |-> min]
P_ALLOCATE_e_PAPER_NOT_ALLOCATED(x) == [loc|->"mem", offs |->5, policy |-> min]

P_CHANGE_STATUS_p_S_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
P_CHANGE_STATUS_p_STAT(x) == [loc|->"mem", offs |->1, policy |-> any_caller(x)]

P_SUBMIT_PAPER_p_S_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
P_SUBMIT_PAPER_p_P_ID(x) == [loc|->"mem", offs |->1, policy |-> any_caller(x)]
P_SUBMIT_PAPER_p_C_ID(x) == [loc|->"mem", offs |->2, policy |-> any_caller(x)]
P_SUBMIT_PAPER_p_SUB_DATE(x) == [loc|->"mem", offs |->3, policy |-> any_caller(x)]
P_SUBMIT_PAPER_p_STAT(x) == [loc|->"mem", offs |->4, policy |-> any_caller(x)]

F_GET_SECTION_PROGRAM_p_S_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
F_GET_SECTION_PROGRAM_v_V_PROGRAM(x) == [loc|->"mem", offs |->1, policy |-> min]
F_GET_SECTION_PROGRAM_r_V_PROGRAM(x) == [loc|->"mem", offs |->2, policy |-> any_caller(x)]

F_GET_SUBMISSIONS_p_C_ID(x) == [loc|->"mem", offs |->0, policy |-> any_caller(x)]
F_GET_SUBMISSIONS_v_V_SUBMISSIONS(x) == [loc|->"mem", offs |->1, policy |-> min]
F_GET_SUBMISSIONS_r_V_SUBMISSIONS(x) == [loc|->"mem", offs |->2, policy |-> any_caller(x)]

