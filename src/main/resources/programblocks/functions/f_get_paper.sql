create type paper_type as object(paper_id number, title varchar2, abstract varchar2, text clob, authors varchar2);
create or replace function f_get_paper(p_id number) return paper_type
as
  v_paper paper_type;
begin
select paper_type(paper_id, title, abstract, text, authors)
into v_paper
from papers
where paper_id = p_id;
return v_paper;
end f_get_paper;