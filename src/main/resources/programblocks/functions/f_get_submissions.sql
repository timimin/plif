create type paper_type as object(paper_id number, title varchar2, abstract varchar2, text clob, authors varchar2);
create or replace type paper_arr_type as varray(1000) of paper_type;
create or replace function f_get_submissions (c_id number) return paper_arr_type
as
  v_submissions paper_arr_type;
begin
select paper_type(paper_id, title, abstract, text, 'unknown_auth') bulk collect into v_submissions
from papers
where paper_id in (select paper_id from submissions
                   where conference_id = c_id);
return v_submissions;
end f_get_submissions;