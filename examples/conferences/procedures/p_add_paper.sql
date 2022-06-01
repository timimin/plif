create or replace procedure p_add_paper (p_id number, tit varchar2, absr varchar2, t clob, auth varchar2)
is
begin
insert into papers (paper_id, title, abstract, text, authors) values (p_id, tit, absr, t, auth);
exception
  when others
     then null;
end p_add_paper;
