create or replace procedure p_allocate (id number, s_id number, sec_id number, alloc_date date)
is
  paper_not_accepted exception;
  v_p_id number;
  v_is_acc boolean;
begin
  v_is_acc := f_is_accepted (s_id);
  if v_is_acc
     then
select paper_id into v_p_id
from submissions
where submission_id = s_id;
insert into allocations (allocation_id, submission_id, section_id, allocation_date)
values (id, s_id, sec_id, alloc_date);
else raise paper_not_accepted;
end if;
exception
     when paper_not_accepted then
        insert into logs
        values (1, 'an attempt was made to allocate unaccepted submission ' || s_id || ', ' || sysdate || '.');
when others then
        null;
end p_allocate;