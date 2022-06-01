create or replace function f_is_accepted (s_id number) return boolean
is
   v_status number;
begin
select status into v_status from submissions
where submission_id = s_id;
if v_status = 1
     then return true;
else return false;
end if;
end f_is_accepted;