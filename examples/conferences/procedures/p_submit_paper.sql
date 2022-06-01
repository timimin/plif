create or replace procedure p_submit_paper (s_id number, p_id number, c_id number, sub_date date, stat number)
is
begin
insert into submissions (submission_id, paper_id, conference_id, submission_date, status) values (s_id, p_id, c_id, sub_date, stat);
exception
  when others
     then null;
end p_submit_paper;