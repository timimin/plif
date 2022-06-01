create type paper_type as object(paper_id number, title varchar2, abstract varchar2, text clob, authors varchar2);
create type program_arr_type as varray(1000) of paper_type;
create or replace function f_get_section_program (s_id number)
return program_arr_type
as
  v_program program_arr_type;
begin
select paper_id, title, abstract, text, 'unknown_auth' bulk collect into v_program from papers
where papers.paper_id in (select SUBMISSIONS.paper_id from allocations JOIN SUBMISSIONS ON allocations.submission_id = SUBMISSIONS.submission_id WHERE allocations.section_id = s_id);
return v_program;
end;
