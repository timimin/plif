create or replace procedure p_change_status (s_id number, stat number)
is
begin
update submissions set status = stat
where submission_id = s_id;
end p_change_status;