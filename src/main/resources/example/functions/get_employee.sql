create or replace function get_employee (eml varchar2)
    return varchar2
as
  rst varchar2(4000);
begin
select last_name || ' ' || first_name || ' ' || email into rst from employees
where email > eml;
return rst;
exception
      when others then
    null;
return null;
end get_employee;