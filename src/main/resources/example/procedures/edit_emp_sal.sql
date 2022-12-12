create or replace procedure edit_emp_sal(emp_id in number, sal number)
is
 illegal_sal exception;
begin
  if sal > 10000
      then
      raise illegal_sal;
else update employees set salary = sal
where employee_id = emp_id;
end if;
exception
  when illegal_sal then
    null;
end;