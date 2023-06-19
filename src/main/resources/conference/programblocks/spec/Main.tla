------------------------------- MODULE Main -------------------------------
EXTENDS RuntimeFS
p_add_paper_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 min,
 min,
 min,
 min>>
 ]
/\ New2Old' =
 <<
 <<p_add_paper_p_p_id(id).policy,
 p_add_paper_p_tit(id).policy,
 p_add_paper_p_absr(id).policy,
 p_add_paper_p_t(id).policy,
 p_add_paper_p_auth(id).policy>>,
 <<min,
 min,
 min,
 min,
 min>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

p_add_paper4(id) ==
/\ insert(id, <<
 "col_papers_paper_id",
 "col_papers_title",
 "col_papers_abstract",
 "col_papers_text",
 "col_papers_authors">>,
 <<
 load(id, p_add_paper_p_p_id(id)),
 load(id, p_add_paper_p_tit(id)),
 load(id, p_add_paper_p_absr(id)),
 load(id, p_add_paper_p_t(id)),
 load(id, p_add_paper_p_auth(id))>>,
 <<
 "p_add_paper", "exit"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_add_paper4",
 "insert into papers ( paper_id , title , abstract , text , authors ) values ( p_id , tit , absr , t , auth )",
 [from |-> <<
 <<[policy |-> load(id, p_add_paper_p_p_id(id)),
 name |-> p_add_paper_p_p_id(id).name]>>,
 <<[policy |-> load(id, p_add_paper_p_tit(id)),
 name |-> p_add_paper_p_tit(id).name]>>,
 <<[policy |-> load(id, p_add_paper_p_absr(id)),
 name |-> p_add_paper_p_absr(id).name]>>,
 <<[policy |-> load(id, p_add_paper_p_t(id)),
 name |-> p_add_paper_p_t(id).name]>>,
 <<[policy |-> load(id, p_add_paper_p_auth(id)),
 name |-> p_add_paper_p_auth(id).name]>>
 >>,
 to |-> <<
 VPol.col_papers_paper_id,
 VPol.col_papers_title,
 VPol.col_papers_abstract,
 VPol.col_papers_text,
 VPol.col_papers_authors>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks

p_add_paper_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 5)]
/\ Trace' = Append(Trace, <<id,"p_add_paper_exit",
 "p_add_paper_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

p_add_paper(id,st) ==
 CASE Head(st).pc[2] = "lbl_4" -> p_add_paper4(id)
[] Head(st).pc[2] = "exit" -> p_add_paper_exit(id)
[] OTHER -> UNCHANGED vars

p_allocate_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 min,
 min,
 min,
 p_allocate_e_paper_not_accepted(id).policy,
 p_allocate_v_v_p_id(id).policy,
 p_allocate_v_v_is_acc(id).policy>>
 ]
/\ New2Old' =
 <<
 <<p_allocate_p_id(id).policy,
 p_allocate_p_s_id(id).policy,
 p_allocate_p_sec_id(id).policy,
 p_allocate_p_alloc_date(id).policy,
 p_allocate_e_paper_not_accepted(id).policy,
 p_allocate_v_v_p_id(id).policy,
 p_allocate_v_v_is_acc(id).policy>>,
 <<min,
 min,
 min,
 min,
 p_allocate_e_paper_not_accepted(id).policy,
 p_allocate_v_v_p_id(id).policy,
 p_allocate_v_v_is_acc(id).policy>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

p_allocate7(id) ==
/\ call(id, <<
 "f_is_accepted", "lbl_5">>,
 "lbl_7r",
 <<
 LUB4Seq(Sessions[id]["PCLabel"] \o <<load(id, p_allocate_p_s_id(id))>>),
 LUB4Seq(Sessions[id]["PCLabel"] \o <<f_is_accepted_v_v_status(id).policy>>),
 LUB4Seq(Sessions[id]["PCLabel"] \o <<f_is_accepted_r(id).policy>>)>>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol, New2Old>>

p_allocate7r(id) ==
/\ exit_call(id, <<
 p_allocate_v_v_is_acc(id)>>,
 <<
 "p_allocate", "lbl_8">>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol>>

p_allocate8(id) ==
/\ if(id, LUB4Seq(<<
 load(id, p_allocate_v_v_is_acc(id))>>),
 <<
 "p_allocate", "lbl_10_13"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate8",
 "if v_is_acc",
 [from |-> <<
 <<[policy |-> load(id, p_allocate_v_v_is_acc(id)),
 name |-> p_allocate_v_v_is_acc(id).name]>>
 >>,
 to |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>]>>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

p_allocate10_13(id) ==
\/ /\ skip(id, <<"p_allocate", "lbl_10">>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>
\/ /\ skip(id, <<"p_allocate", "lbl_13">>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>


p_allocate10(id) ==
/\ select(id, <<
 p_allocate_v_v_p_id(id)>>,
 <<
 VPol["col_submissions_paper_id"].policy>>,
 LUB4Seq(<<
 VPol["col_submissions_submission_id"].policy,
 load(id, p_allocate_p_s_id(id))>>),
 <<
 "p_allocate", "lbl_12"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate10",
 "select paper_id into v_p_id from submissions where submission_id = s_id",
 [from |-> <<
 <<
 VPol.col_submissions_paper_id,
 VPol.col_submissions_submission_id,
 [policy |-> load(id, p_allocate_p_s_id(id)),
 name |-> p_allocate_p_s_id(id).name]
 >>
 >>,
 to |-> <<
 [policy |-> load(id, p_allocate_v_v_p_id(id)),
 name |-> p_allocate_v_v_p_id(id).name]>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol>>

p_allocate12(id) ==
/\ insert(id, <<
 "col_allocations_allocation_id",
 "col_allocations_submission_id",
 "col_allocations_section_id",
 "col_allocations_allocation_date">>,
 <<
 load(id, p_allocate_p_id(id)),
 load(id, p_allocate_p_s_id(id)),
 load(id, p_allocate_p_sec_id(id)),
 load(id, p_allocate_p_alloc_date(id))>>,
 <<
 "p_allocate", "lbl_14"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate12",
 "insert into allocations ( allocation_id , submission_id , section_id , allocation_date ) values ( id , s_id , sec_id , alloc_date )",
 [from |-> <<
 <<[policy |-> load(id, p_allocate_p_id(id)),
 name |-> p_allocate_p_id(id).name]>>,
 <<[policy |-> load(id, p_allocate_p_s_id(id)),
 name |-> p_allocate_p_s_id(id).name]>>,
 <<[policy |-> load(id, p_allocate_p_sec_id(id)),
 name |-> p_allocate_p_sec_id(id).name]>>,
 <<[policy |-> load(id, p_allocate_p_alloc_date(id)),
 name |-> p_allocate_p_alloc_date(id).name]>>
 >>,
 to |-> <<
 VPol.col_allocations_allocation_id,
 VPol.col_allocations_submission_id,
 VPol.col_allocations_section_id,
 VPol.col_allocations_allocation_date>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks

p_allocate13(id) ==
/\ skip(id, <<"p_allocate", "lbl_16">>)
/\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>

p_allocate16(id) ==
/\ whenexc(id, load(id, p_allocate_e_paper_not_accepted(id)),
 <<
 "p_allocate", "lbl_17"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate13",
 "raise paper_not_accepted",
 [from |-> <<
 <<[policy |-> load(id, p_allocate_e_paper_not_accepted(id)),
 name |-> p_allocate_e_paper_not_accepted(id).name]>>>>,
  to |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>]>>)
 /\ UNCHANGED  <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

p_allocate14(id) ==
/\ ifend(id, <<"p_allocate", "exit">>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate14",
 "endif",
 [from |-> <<<<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>>>,
 to |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>]>>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

p_allocate17(id) ==
/\ insert(id, <<
 "col_logs_event_id",
 "col_logs_err_info">>,
 <<
 min,
 min>>,
 <<
 "p_allocate", "exit"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_allocate17",
 "insert into logs values ( 1 , 'an attempt was made to allocate unaccepted submission ' | | s_id | | ', ' | | sysdate | | '.' )",
 [from |-> <<
 <<[policy |-> min, name |-> "literal_1"]>>,
 <<[policy |-> min, name |-> "literal_2"]>>
 >>,
 to |-> <<
 VPol.col_logs_event_id,
 VPol.col_logs_err_info>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks

p_allocate_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 7)]
/\ Trace' = Append(Trace, <<id,"p_allocate_exit",
 "p_allocate_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

p_allocate(id,st) ==
 CASE Head(st).pc[2] = "lbl_7" -> p_allocate7(id)
[] Head(st).pc[2] = "lbl_7r" -> p_allocate7r(id)
[] Head(st).pc[2] = "lbl_8" -> p_allocate8(id)
[] Head(st).pc[2] = "lbl_10_13" -> p_allocate10_13(id)
[] Head(st).pc[2] = "lbl_10" -> p_allocate10(id)
[] Head(st).pc[2] = "lbl_12" -> p_allocate12(id)
[] Head(st).pc[2] = "lbl_13" -> p_allocate13(id)
[] Head(st).pc[2] = "lbl_16" -> p_allocate16(id)
[] Head(st).pc[2] = "lbl_14" -> p_allocate14(id)
[] Head(st).pc[2] = "lbl_17" -> p_allocate17(id)
[] Head(st).pc[2] = "exit" -> p_allocate_exit(id)
[] OTHER -> UNCHANGED vars

p_change_status_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 min>>
 ]
/\ New2Old' =
 <<
 <<p_change_status_p_s_id(id).policy,
 p_change_status_p_stat(id).policy>>,
 <<min,
 min>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

p_change_status4(id) ==
/\ update(id, <<
 "col_submissions_status">>,
 <<
 load(id, p_change_status_p_stat(id))>>,
 LUB4Seq(<<
 VPol["col_submissions_submission_id"].policy,
 load(id, p_change_status_p_s_id(id))>>),
 <<
 "p_change_status", "exit"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_change_status4",
 "update submissions set status = stat where submission_id = s_id",
 [from |-> <<
 <<[policy |-> load(id, p_change_status_p_stat(id)),
 name |-> p_change_status_p_stat(id).name],
 VPol.col_submissions_submission_id,
 [policy |-> load(id, p_change_status_p_s_id(id)),
 name |-> p_change_status_p_s_id(id).name]>>
 >>,
 to |-> <<
 VPol.col_submissions_status>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks

p_change_status_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 2)]
/\ Trace' = Append(Trace, <<id,"p_change_status_exit",
 "p_change_status_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

p_change_status(id,st) ==
 CASE Head(st).pc[2] = "lbl_4" -> p_change_status4(id)
[] Head(st).pc[2] = "exit" -> p_change_status_exit(id)
[] OTHER -> UNCHANGED vars

p_submit_paper_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 min,
 min,
 min,
 min>>
 ]
/\ New2Old' =
 <<
 <<p_submit_paper_p_s_id(id).policy,
 p_submit_paper_p_p_id(id).policy,
 p_submit_paper_p_c_id(id).policy,
 p_submit_paper_p_sub_date(id).policy,
 p_submit_paper_p_stat(id).policy>>,
 <<min,
 min,
 min,
 min,
 min>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

p_submit_paper4(id) ==
/\ insert(id, <<
 "col_submissions_submission_id",
 "col_submissions_paper_id",
 "col_submissions_conference_id",
 "col_submissions_submission_date",
 "col_submissions_status">>,
 <<
 load(id, p_submit_paper_p_s_id(id)),
 load(id, p_submit_paper_p_p_id(id)),
 load(id, p_submit_paper_p_c_id(id)),
 load(id, p_submit_paper_p_sub_date(id)),
 load(id, p_submit_paper_p_stat(id))>>,
 <<
 "p_submit_paper", "exit"
 >>)
/\ Trace' = Append(Trace,<<id,
 "p_submit_paper4",
 "insert into submissions ( submission_id , paper_id , conference_id , submission_date , status ) values ( s_id , p_id , c_id , sub_date , stat )",
 [from |-> <<
 <<[policy |-> load(id, p_submit_paper_p_s_id(id)),
 name |-> p_submit_paper_p_s_id(id).name]>>,
 <<[policy |-> load(id, p_submit_paper_p_p_id(id)),
 name |-> p_submit_paper_p_p_id(id).name]>>,
 <<[policy |-> load(id, p_submit_paper_p_c_id(id)),
 name |-> p_submit_paper_p_c_id(id).name]>>,
 <<[policy |-> load(id, p_submit_paper_p_sub_date(id)),
 name |-> p_submit_paper_p_sub_date(id).name]>>,
 <<[policy |-> load(id, p_submit_paper_p_stat(id)),
 name |-> p_submit_paper_p_stat(id).name]>>
 >>,
 to |-> <<
 VPol.col_submissions_submission_id,
 VPol.col_submissions_paper_id,
 VPol.col_submissions_conference_id,
 VPol.col_submissions_submission_date,
 VPol.col_submissions_status>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks

p_submit_paper_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 5)]
/\ Trace' = Append(Trace, <<id,"p_submit_paper_exit",
 "p_submit_paper_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

p_submit_paper(id,st) ==
 CASE Head(st).pc[2] = "lbl_4" -> p_submit_paper4(id)
[] Head(st).pc[2] = "exit" -> p_submit_paper_exit(id)
[] OTHER -> UNCHANGED vars

f_get_paper_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 f_get_paper_v_v_paper_rec_c1(id).policy,
 f_get_paper_v_v_paper_rec_c2(id).policy,
 f_get_paper_v_v_paper_rec_c3(id).policy,
 f_get_paper_v_v_paper_rec_c4(id).policy,
 f_get_paper_v_v_paper_rec_c5(id).policy,
 f_get_paper_r_rec_c1(id).policy,
 f_get_paper_r_rec_c2(id).policy,
 f_get_paper_r_rec_c3(id).policy,
 f_get_paper_r_rec_c4(id).policy,
 f_get_paper_r_rec_c5(id).policy>>
 ]
/\ New2Old' =
 <<
 <<f_get_paper_p_p_id(id).policy,
 f_get_paper_v_v_paper_rec_c1(id).policy,
 f_get_paper_v_v_paper_rec_c2(id).policy,
 f_get_paper_v_v_paper_rec_c3(id).policy,
 f_get_paper_v_v_paper_rec_c4(id).policy,
 f_get_paper_v_v_paper_rec_c5(id).policy,
 f_get_paper_r_rec_c1(id).policy,
 f_get_paper_r_rec_c2(id).policy,
 f_get_paper_r_rec_c3(id).policy,
 f_get_paper_r_rec_c4(id).policy,
 f_get_paper_r_rec_c5(id).policy>>,
 <<min,
 f_get_paper_v_v_paper_rec_c1(id).policy,
 f_get_paper_v_v_paper_rec_c2(id).policy,
 f_get_paper_v_v_paper_rec_c3(id).policy,
 f_get_paper_v_v_paper_rec_c4(id).policy,
 f_get_paper_v_v_paper_rec_c5(id).policy,
 f_get_paper_r_rec_c1(id).policy,
 f_get_paper_r_rec_c2(id).policy,
 f_get_paper_r_rec_c3(id).policy,
 f_get_paper_r_rec_c4(id).policy,
 f_get_paper_r_rec_c5(id).policy>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

f_get_paper6(id) ==
/\ select(id, <<
 f_get_paper_v_v_paper_rec_c1(id),
 f_get_paper_v_v_paper_rec_c2(id),
 f_get_paper_v_v_paper_rec_c3(id),
 f_get_paper_v_v_paper_rec_c4(id),
 f_get_paper_v_v_paper_rec_c5(id)>>,
 <<
 VPol["col_papers_paper_id"].policy,
 VPol["col_papers_title"].policy,
 VPol["col_papers_abstract"].policy,
 VPol["col_papers_text"].policy,
 VPol["col_papers_authors"].policy>>,
 LUB4Seq(<<
 VPol["col_papers_paper_id"].policy,
 load(id, f_get_paper_p_p_id(id))>>),
 <<
 "f_get_paper", "lbl_8"
 >>)
/\ Trace' = Append(Trace,<<id,
 "f_get_paper6",
 "select paper_type ( paper_id , title , abstract , text , authors ) into v_paper from papers where paper_id = p_id",
 [from |-> <<
 <<
 VPol.col_papers_paper_id,
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_paper_p_p_id(id)),
 name |-> f_get_paper_p_p_id(id).name]
 >>,
 <<
 VPol.col_papers_title,
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_paper_p_p_id(id)),
 name |-> f_get_paper_p_p_id(id).name]
 >>,
 <<
 VPol.col_papers_abstract,
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_paper_p_p_id(id)),
 name |-> f_get_paper_p_p_id(id).name]
 >>,
 <<
 VPol.col_papers_text,
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_paper_p_p_id(id)),
 name |-> f_get_paper_p_p_id(id).name]
 >>,
 <<
 VPol.col_papers_authors,
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_paper_p_p_id(id)),
 name |-> f_get_paper_p_p_id(id).name]
 >>
 >>,
 to |-> <<
 [policy |-> load(id, f_get_paper_v_v_paper_rec_c1(id)),
 name |-> f_get_paper_v_v_paper_rec_c1(id).name],
 [policy |-> load(id, f_get_paper_v_v_paper_rec_c2(id)),
 name |-> f_get_paper_v_v_paper_rec_c2(id).name],
 [policy |-> load(id, f_get_paper_v_v_paper_rec_c3(id)),
 name |-> f_get_paper_v_v_paper_rec_c3(id).name],
 [policy |-> load(id, f_get_paper_v_v_paper_rec_c4(id)),
 name |-> f_get_paper_v_v_paper_rec_c4(id).name],
 [policy |-> load(id, f_get_paper_v_v_paper_rec_c5(id)),
 name |-> f_get_paper_v_v_paper_rec_c5(id).name]>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol>>

f_get_paper8(id) ==
/\ return(id, <<
 f_get_paper_r_rec_c1(id),
 f_get_paper_r_rec_c2(id),
 f_get_paper_r_rec_c3(id),
 f_get_paper_r_rec_c4(id),
 f_get_paper_r_rec_c5(id)>>,
 <<
 load(id, f_get_paper_v_v_paper_rec_c1(id)),
 load(id, f_get_paper_v_v_paper_rec_c2(id)),
 load(id, f_get_paper_v_v_paper_rec_c3(id)),
 load(id, f_get_paper_v_v_paper_rec_c4(id)),
 load(id, f_get_paper_v_v_paper_rec_c5(id))>>,
 <<
 "f_get_paper", "exit"
 >>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks
/\ VPol' = VPol

f_get_paper_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["Ret"] =
 <<
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_paper_r_rec_c1(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_paper_r_rec_c2(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_paper_r_rec_c3(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_paper_r_rec_c4(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_paper_r_rec_c5(id).offs]
 >>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 11)]
/\ Trace' = Append(Trace, <<id,"f_get_paper_exit",
 "f_get_paper_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

f_get_paper(id,st) ==
 CASE Head(st).pc[2] = "lbl_6" -> f_get_paper6(id)
[] Head(st).pc[2] = "lbl_8" -> f_get_paper8(id)
[] Head(st).pc[2] = "exit" -> f_get_paper_exit(id)
[] OTHER -> UNCHANGED vars

f_get_section_program_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 f_get_section_program_v_v_program_arr_e1_c1(id).policy,
 f_get_section_program_v_v_program_arr_e1_c2(id).policy,
 f_get_section_program_v_v_program_arr_e1_c3(id).policy,
 f_get_section_program_v_v_program_arr_e1_c4(id).policy,
 f_get_section_program_v_v_program_arr_e1_c5(id).policy,
 f_get_section_program_v_v_program_arr_e2_c1(id).policy,
 f_get_section_program_v_v_program_arr_e2_c2(id).policy,
 f_get_section_program_v_v_program_arr_e2_c3(id).policy,
 f_get_section_program_v_v_program_arr_e2_c4(id).policy,
 f_get_section_program_v_v_program_arr_e2_c5(id).policy,
 f_get_section_program_r_arr_e1_c1(id).policy,
 f_get_section_program_r_arr_e1_c2(id).policy,
 f_get_section_program_r_arr_e1_c3(id).policy,
 f_get_section_program_r_arr_e1_c4(id).policy,
 f_get_section_program_r_arr_e1_c5(id).policy,
 f_get_section_program_r_arr_e2_c1(id).policy,
 f_get_section_program_r_arr_e2_c2(id).policy,
 f_get_section_program_r_arr_e2_c3(id).policy,
 f_get_section_program_r_arr_e2_c4(id).policy,
 f_get_section_program_r_arr_e2_c5(id).policy>>
 ]
/\ New2Old' =
 <<
 <<f_get_section_program_p_s_id(id).policy,
 f_get_section_program_v_v_program_arr_e1_c1(id).policy,
 f_get_section_program_v_v_program_arr_e1_c2(id).policy,
 f_get_section_program_v_v_program_arr_e1_c3(id).policy,
 f_get_section_program_v_v_program_arr_e1_c4(id).policy,
 f_get_section_program_v_v_program_arr_e1_c5(id).policy,
 f_get_section_program_v_v_program_arr_e2_c1(id).policy,
 f_get_section_program_v_v_program_arr_e2_c2(id).policy,
 f_get_section_program_v_v_program_arr_e2_c3(id).policy,
 f_get_section_program_v_v_program_arr_e2_c4(id).policy,
 f_get_section_program_v_v_program_arr_e2_c5(id).policy,
 f_get_section_program_r_arr_e1_c1(id).policy,
 f_get_section_program_r_arr_e1_c2(id).policy,
 f_get_section_program_r_arr_e1_c3(id).policy,
 f_get_section_program_r_arr_e1_c4(id).policy,
 f_get_section_program_r_arr_e1_c5(id).policy,
 f_get_section_program_r_arr_e2_c1(id).policy,
 f_get_section_program_r_arr_e2_c2(id).policy,
 f_get_section_program_r_arr_e2_c3(id).policy,
 f_get_section_program_r_arr_e2_c4(id).policy,
 f_get_section_program_r_arr_e2_c5(id).policy>>,
 <<min,
 f_get_section_program_v_v_program_arr_e1_c1(id).policy,
 f_get_section_program_v_v_program_arr_e1_c2(id).policy,
 f_get_section_program_v_v_program_arr_e1_c3(id).policy,
 f_get_section_program_v_v_program_arr_e1_c4(id).policy,
 f_get_section_program_v_v_program_arr_e1_c5(id).policy,
 f_get_section_program_v_v_program_arr_e2_c1(id).policy,
 f_get_section_program_v_v_program_arr_e2_c2(id).policy,
 f_get_section_program_v_v_program_arr_e2_c3(id).policy,
 f_get_section_program_v_v_program_arr_e2_c4(id).policy,
 f_get_section_program_v_v_program_arr_e2_c5(id).policy,
 f_get_section_program_r_arr_e1_c1(id).policy,
 f_get_section_program_r_arr_e1_c2(id).policy,
 f_get_section_program_r_arr_e1_c3(id).policy,
 f_get_section_program_r_arr_e1_c4(id).policy,
 f_get_section_program_r_arr_e1_c5(id).policy,
 f_get_section_program_r_arr_e2_c1(id).policy,
 f_get_section_program_r_arr_e2_c2(id).policy,
 f_get_section_program_r_arr_e2_c3(id).policy,
 f_get_section_program_r_arr_e2_c4(id).policy,
 f_get_section_program_r_arr_e2_c5(id).policy>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

f_get_section_program8(id) ==
/\ select(id, <<
 f_get_section_program_v_v_program_arr_e1_c1(id),
 f_get_section_program_v_v_program_arr_e1_c2(id),
 f_get_section_program_v_v_program_arr_e1_c3(id),
 f_get_section_program_v_v_program_arr_e1_c4(id),
 f_get_section_program_v_v_program_arr_e1_c5(id),
 f_get_section_program_v_v_program_arr_e2_c1(id),
 f_get_section_program_v_v_program_arr_e2_c2(id),
 f_get_section_program_v_v_program_arr_e2_c3(id),
 f_get_section_program_v_v_program_arr_e2_c4(id),
 f_get_section_program_v_v_program_arr_e2_c5(id)>>,
 <<
 VPol["col_papers_paper_id"].policy,
 VPol["col_papers_title"].policy,
 VPol["col_papers_abstract"].policy,
 VPol["col_papers_text"].policy,
 min,
 VPol["col_papers_paper_id"].policy,
 VPol["col_papers_title"].policy,
 VPol["col_papers_abstract"].policy,
 VPol["col_papers_text"].policy,
 min>>,
 LUB4Seq(<<
 load(id, f_get_section_program_p_s_id(id)),
 VPol["col_papers_paper_id"].policy,
 VPol["col_submissions_paper_id"].policy,
 VPol["col_allocations_submission_id"].policy,
 VPol["col_submissions_submission_id"].policy,
 VPol["col_allocations_section_id"].policy>>),
 <<
 "f_get_section_program", "lbl_10"
 >>)
/\ Trace' = Append(Trace,<<id,
 "f_get_section_program8",
 "select paper_id , title , abstract , text , 'unknown_auth' bulk collect into v_program from papers where papers . paper_id in ( select SUBMISSIONS . paper_id from allocations JOIN SUBMISSIONS ON allocations . submission_id = SUBMISSIONS . submission_id WHERE allocations . section_id = s_id )",
 [from |-> <<
 <<
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_title,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_abstract,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_text,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 [policy |-> min, name |-> "literal_3"],
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_paper_id,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_title,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_abstract,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 VPol.col_papers_text,
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>,
 <<
 [policy |-> min, name |-> "literal_4"],
 [policy |-> load(id, f_get_section_program_p_s_id(id)),
 name |-> f_get_section_program_p_s_id(id).name],
 VPol.col_papers_paper_id,
 VPol.col_submissions_paper_id,
 VPol.col_allocations_submission_id,
 VPol.col_submissions_submission_id,
 VPol.col_allocations_section_id
 >>
 >>,
 to |-> <<
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e1_c1(id)),
 name |-> f_get_section_program_v_v_program_arr_e1_c1(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e1_c2(id)),
 name |-> f_get_section_program_v_v_program_arr_e1_c2(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e1_c3(id)),
 name |-> f_get_section_program_v_v_program_arr_e1_c3(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e1_c4(id)),
 name |-> f_get_section_program_v_v_program_arr_e1_c4(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e1_c5(id)),
 name |-> f_get_section_program_v_v_program_arr_e1_c5(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e2_c1(id)),
 name |-> f_get_section_program_v_v_program_arr_e2_c1(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e2_c2(id)),
 name |-> f_get_section_program_v_v_program_arr_e2_c2(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e2_c3(id)),
 name |-> f_get_section_program_v_v_program_arr_e2_c3(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e2_c4(id)),
 name |-> f_get_section_program_v_v_program_arr_e2_c4(id).name],
 [policy |-> load(id, f_get_section_program_v_v_program_arr_e2_c5(id)),
 name |-> f_get_section_program_v_v_program_arr_e2_c5(id).name]>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol>>

f_get_section_program10(id) ==
/\ return(id, <<
 f_get_section_program_r_arr_e1_c1(id),
 f_get_section_program_r_arr_e1_c2(id),
 f_get_section_program_r_arr_e1_c3(id),
 f_get_section_program_r_arr_e1_c4(id),
 f_get_section_program_r_arr_e1_c5(id),
 f_get_section_program_r_arr_e2_c1(id),
 f_get_section_program_r_arr_e2_c2(id),
 f_get_section_program_r_arr_e2_c3(id),
 f_get_section_program_r_arr_e2_c4(id),
 f_get_section_program_r_arr_e2_c5(id)>>,
 <<
 load(id, f_get_section_program_v_v_program_arr_e1_c1(id)),
 load(id, f_get_section_program_v_v_program_arr_e1_c2(id)),
 load(id, f_get_section_program_v_v_program_arr_e1_c3(id)),
 load(id, f_get_section_program_v_v_program_arr_e1_c4(id)),
 load(id, f_get_section_program_v_v_program_arr_e1_c5(id)),
 load(id, f_get_section_program_v_v_program_arr_e2_c1(id)),
 load(id, f_get_section_program_v_v_program_arr_e2_c2(id)),
 load(id, f_get_section_program_v_v_program_arr_e2_c3(id)),
 load(id, f_get_section_program_v_v_program_arr_e2_c4(id)),
 load(id, f_get_section_program_v_v_program_arr_e2_c5(id))>>,
 <<
 "f_get_section_program", "exit"
 >>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks
/\ VPol' = VPol

f_get_section_program_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["Ret"] =
 <<
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e1_c1(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e1_c2(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e1_c3(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e1_c4(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e1_c5(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e2_c1(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e2_c2(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e2_c3(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e2_c4(id).offs],
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_get_section_program_r_arr_e2_c5(id).offs]
 >>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 21)]
/\ Trace' = Append(Trace, <<id,"f_get_section_program_exit",
 "f_get_section_program_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

f_get_section_program(id,st) ==
 CASE Head(st).pc[2] = "lbl_8" -> f_get_section_program8(id)
[] Head(st).pc[2] = "lbl_10" -> f_get_section_program10(id)
[] Head(st).pc[2] = "exit" -> f_get_section_program_exit(id)
[] OTHER -> UNCHANGED vars

f_is_accepted_load(id) ==
IF XLocks = Undef
THEN
/\ XLocks' = id
/\ Sessions' =
 [
 Sessions EXCEPT ![id]["SessionM"] = Sessions[id]["SessionM"] \o
 <<min,
 f_is_accepted_v_v_status(id).policy,
 f_is_accepted_r(id).policy>>
 ]
/\ New2Old' =
 <<
 <<f_is_accepted_p_s_id(id).policy,
 f_is_accepted_v_v_status(id).policy,
 f_is_accepted_r(id).policy>>,
 <<min,
 f_is_accepted_v_v_status(id).policy,
 f_is_accepted_r(id).policy>>
 >>
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<VPol>>
ELSE UNCHANGED vars

f_is_accepted5(id) ==
/\ select(id, <<
 f_is_accepted_v_v_status(id)>>,
 <<
 VPol["col_submissions_status"].policy>>,
 LUB4Seq(<<
 VPol["col_submissions_submission_id"].policy,
 load(id, f_is_accepted_p_s_id(id))>>),
 <<
 "f_is_accepted", "lbl_7"
 >>)
/\ Trace' = Append(Trace,<<id,
 "f_is_accepted5",
 "select status into v_status from submissions where submission_id = s_id",
 [from |-> <<
 <<
 VPol.col_submissions_status,
 VPol.col_submissions_submission_id,
 [policy |-> load(id, f_is_accepted_p_s_id(id)),
 name |-> f_is_accepted_p_s_id(id).name]
 >>
 >>,
 to |-> <<
 [policy |-> load(id, f_is_accepted_v_v_status(id)),
 name |-> f_is_accepted_v_v_status(id).name]>>
 ]>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<XLocks, VPol>>

f_is_accepted7(id) ==
/\ if(id, LUB4Seq(<<
 load(id, f_is_accepted_v_v_status(id))>>),
 <<
 "f_is_accepted", "lbl_8_9"
 >>)
/\ Trace' = Append(Trace,<<id,
 "f_is_accepted7",
 "if v_status = 1",
 [from |-> <<
 <<[policy |-> load(id, f_is_accepted_v_v_status(id)),
 name |-> f_is_accepted_v_v_status(id).name],
 [policy |-> min, name |-> "literal_5"]>>
 >>,
 to |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>]>>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

f_is_accepted8_9(id) ==
\/ /\ skip(id, <<"f_is_accepted", "lbl_8">>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>
\/ /\ skip(id, <<"f_is_accepted", "lbl_9">>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore, Trace>>


f_is_accepted8(id) ==
/\ return(id, <<
 f_is_accepted_r(id)>>,
 <<
 min>>,
 <<
 "f_is_accepted", "lbl_10"
 >>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks
/\ VPol' = VPol

f_is_accepted9(id) ==
/\ return(id, <<
 f_is_accepted_r(id)>>,
 <<
 min>>,
 <<
 "f_is_accepted", "lbl_10"
 >>)
/\ Trace' = Append(Trace,<<>>)
/\ Ignore' = 0
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ XLocks' = XLocks
/\ VPol' = VPol

f_is_accepted10(id) ==
/\ ifend(id, <<"f_is_accepted", "exit">>)
/\ Trace' = Append(Trace,<<id,
 "f_is_accepted10",
 "endif",
 [from |-> <<<<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>>>,
 to |-> <<[policy |-> LUB4Seq(Sessions[id]["PCLabel"]), name |-> "PCLabel"]>>]>>)
 /\ UNCHANGED <<StateE, New2Old, XLocks, VPol, SLocks, Ignore>>

f_is_accepted_exit(id) ==
/\ IF Len(Sessions[id]["StateRegs"]) = 1
 THEN XLocks' = Undef
 ELSE XLocks' = XLocks
/\ Sessions' =
 [Sessions EXCEPT
 ![id]["StateRegs"] = Tail(Sessions[id]["StateRegs"]) \o <<>>,
 ![id]["Ret"] =
 <<
 Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + f_is_accepted_r(id).offs]
 >>,
 ![id]["SessionM"] = SubSeq(Sessions[id]["SessionM"], 1, Len(Sessions[id]["SessionM"]) - 3)]
/\ Trace' = Append(Trace, <<id,"f_is_accepted_exit",
 "f_is_accepted_exit",
 [from |-> << >>, to |-> << >>]>>)
 /\ Ignore' = 1
/\ SLocks' = SLocks
/\ StateE' = SLocks'[id]
/\ UNCHANGED <<New2Old, VPol>>

f_is_accepted(id,st) ==
 CASE Head(st).pc[2] = "lbl_5" -> f_is_accepted5(id)
[] Head(st).pc[2] = "lbl_7" -> f_is_accepted7(id)
[] Head(st).pc[2] = "lbl_8_9" -> f_is_accepted8_9(id)
[] Head(st).pc[2] = "lbl_8" -> f_is_accepted8(id)
[] Head(st).pc[2] = "lbl_9" -> f_is_accepted9(id)
[] Head(st).pc[2] = "lbl_10" -> f_is_accepted10(id)
[] Head(st).pc[2] = "exit" -> f_is_accepted_exit(id)
[] OTHER -> UNCHANGED vars

dispatch(id,st) ==
CASE
/\ Head(st).pc[1] = "p_add_paper"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ p_add_paper_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "p_add_paper"
/\ Sessions[id]["SessionM"] # <<>> -> p_add_paper(id, st)

[] Head(st).pc[1] = "p_allocate"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ p_allocate_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "p_allocate"
/\ Sessions[id]["SessionM"] # <<>> -> p_allocate(id, st)

[] Head(st).pc[1] = "p_change_status"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ p_change_status_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "p_change_status"
/\ Sessions[id]["SessionM"] # <<>> -> p_change_status(id, st)

[] Head(st).pc[1] = "p_submit_paper"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ p_submit_paper_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "p_submit_paper"
/\ Sessions[id]["SessionM"] # <<>> -> p_submit_paper(id, st)

[] Head(st).pc[1] = "f_get_paper"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ f_get_paper_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "f_get_paper"
/\ Sessions[id]["SessionM"] # <<>> -> f_get_paper(id, st)

[] Head(st).pc[1] = "f_get_section_program"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ f_get_section_program_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "f_get_section_program"
/\ Sessions[id]["SessionM"] # <<>> -> f_get_section_program(id, st)

[] Head(st).pc[1] = "f_is_accepted"
/\ Sessions[id]["SessionM"] = <<>> ->
   /\ f_is_accepted_load(id)
   /\ Trace' = Append(Trace,<<>>)
[] /\ Head(st).pc[1] = "f_is_accepted"
/\ Sessions[id]["SessionM"] # <<>> -> f_is_accepted(id, st)

Init ==
LET pc == [{"pc"} ->
{<<"p_add_paper", "lbl_4">>,
<<"p_allocate", "lbl_7">>,
<<"p_change_status", "lbl_4">>,
<<"p_submit_paper", "lbl_4">>,
<<"f_get_paper", "lbl_6">>,
<<"f_get_section_program", "lbl_8">>,
<<"f_is_accepted", "lbl_5">>}
]
IN
/\ Trace = <<>>
/\ StateE = [e1 \in E0 |-> {}] @@ [e2 \in E1 |-> {}]
/\ Sessions \in 
     [S -> 
          ReduceSet(LAMBDA x, y: x \cup 
              {y @@ [SessionM |-> <<>>]
                 @@ [PCLabel  |-> <<min>>]
                 @@ [Ret      |-> Undef]},
                 {}, 
                 [{"StateRegs"} -> 
                      ReduceSet (LAMBDA x, y: 
                          x \cup ({<<y @@ [fp |->1]>>}), {}, pc) ])
     ]
/\ SLocks = 
     [s \in S |-> [e1 \in E0 |-> {}] 
      @@ [e2 \in E1 |-> {}]]
/\ New2Old = <<>>
/\ Ignore = 0
/\ XLocks = Undef
/\ VPol =
 [
 col_allocations_allocation_id |-> [ext|->0, policy |-> min, name |-> "col_allocations_allocation_id"],
 col_allocations_paper_id |-> [ext|->0, policy |-> min, name |-> "col_allocations_paper_id"],
 col_allocations_section_id |-> [ext|->0, policy |-> min, name |-> "col_allocations_section_id"],
 col_allocations_allocation_date |-> [ext|->0, policy |-> min, name |-> "col_allocations_allocation_date"],
 col_allocations_submission_id |-> [ext|->0, policy |-> min, name |-> "col_allocations_submission_id"],

 col_conferences_conference_id |-> [ext|->0, policy |-> min, name |-> "col_conferences_conference_id"],
 col_conferences_name |-> [ext|->0, policy |-> min, name |-> "col_conferences_name"],
 col_conferences_start_date |-> [ext|->0, policy |-> min, name |-> "col_conferences_start_date"],
 col_conferences_end_date |-> [ext|->0, policy |-> min, name |-> "col_conferences_end_date"],
 col_conferences_description |-> [ext|->0, policy |-> min, name |-> "col_conferences_description"],

 col_logs_event_id |-> [ext|->0, policy |-> min, name |-> "col_logs_event_id"],
 col_logs_err_info |-> [ext|->0, policy |-> min, name |-> "col_logs_err_info"],

 col_papers_paper_id |-> [ext|->0, policy |-> min, name |-> "col_papers_paper_id"],
 col_papers_title |-> [ext|->0, policy |-> min, name |-> "col_papers_title"],
 col_papers_abstract |-> [ext|->0, policy |-> min, name |-> "col_papers_abstract"],
 col_papers_text |-> [ext|->0, policy |-> min, name |-> "col_papers_text"],
 col_papers_authors |-> [ext|->0, policy |-> min, name |-> "col_papers_authors"],

 col_sections_section_id |-> [ext|->0, policy |-> min, name |-> "col_sections_section_id"],
 col_sections_title |-> [ext|->0, policy |-> min, name |-> "col_sections_title"],
 col_sections_place |-> [ext|->0, policy |-> min, name |-> "col_sections_place"],
 col_sections_start_date |-> [ext|->0, policy |-> min, name |-> "col_sections_start_date"],
 col_sections_end_date |-> [ext|->0, policy |-> min, name |-> "col_sections_end_date"],
 col_sections_conference_id |-> [ext|->0, policy |-> min, name |-> "col_sections_conference_id"],

 col_submissions_submission_id |-> [ext|->0, policy |-> min, name |-> "col_submissions_submission_id"],
 col_submissions_paper_id |-> [ext|->0, policy |-> min, name |-> "col_submissions_paper_id"],
 col_submissions_conference_id |-> [ext|->0, policy |-> min, name |-> "col_submissions_conference_id"],
 col_submissions_submission_date |-> [ext|->0, policy |-> min, name |-> "col_submissions_submission_date"],
 col_submissions_status |-> [ext|->0, policy |-> min, name |-> "col_submissions_status"]
 ]

Next(K(_,_)) == 
        \/ \E  s \in S :
            /\ Sessions[s]["StateRegs"] # <<>>
            /\ K(s,Sessions[s]["StateRegs"])
        \/ \A  s \in S : 
            /\ Sessions[s]["StateRegs"] = <<>>
            /\ UNCHANGED vars
SpecFS == Init /\ [] [Next(dispatch)]_vars
=============================================================================