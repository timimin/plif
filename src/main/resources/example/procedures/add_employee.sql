create or replace procedure add_employee (emp_id number, f_name varchar2, l_name varchar2, eml varchar2, ph_number varchar2, h_date date, j_id varchar2, sal number, comm_pct number, man_id number, dept_id number)
is
illegal_sal exception;
begin
  if sal > 10000
      then
      raise illegal_sal;
else insert into employees (employee_id, first_name, last_name, email,  phone_number,  hire_date, job_id,  salary,  commission_pct, manager_id,  department_id) values (emp_id, f_name,l_name, eml, ph_number, h_date, j_id, sal, comm_pct, man_id, dept_id);
end if;
exception
  when illegal_sal then
    null;
end;