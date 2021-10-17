create type paper_type as object(paper_id number, title varchar2, abstract varchar2, text clob, authors varchar2);
create or replace type paper_arr_type as varray(1000) of paper_type;
create or replace function f_get_accepted(c_id number) return paper_arr_type
as
  v_accepted paper_arr_type;
begin
select paper_type(paper_id, title, abstract, text, 'unknown_auth') bulk collect into v_accepted
from papers
where paper_id in (select paper_id from submissions
                   where conference_id = c_id and status = 1);
return v_accepted;
end f_get_accepted;