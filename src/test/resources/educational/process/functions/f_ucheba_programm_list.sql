CREATE TYPE t1 AS object(
   programm_id number,
   programm_name number,
   programm_short_name number,
   programm_count_chasov number,
   programm_count_chasov_audit number,
   programm_podp_data number,
   programm_inv number,
   programm_code number,
   programm_napr number,
   programm_napr_full number,
   programm_department number);

CREATE FUNCTION
           f_UCHEBA_programm_list
(
    data_view number
   , data_unuse number
   , data_name number
   , data_code number
   , date_n number
   , date_o number
   , data_naprav number
   , data_kafedra number
   , data_chacov_n number
   , data_chacov_o number
) RETURN t1
AS
   r t1;
BEGIN
SELECT  uch_programm.programm_id, uch_programm.name, uch_programm.short_name, uch_programm.count_chasov, uch_programm.count_chasov_audit, uch_programm.data, uch_programm.fullnumber, uch_programm.code, uch_napravlenie.short_name, uch_napravlenie.name, upr_department.short_title INTO r FROM uch_programm --programm_id, programm_name, programm_short_name, programm_count_chasov, programm_count_chasov_audit, programm_data, programm_fullnumber, programm_code, napravlenie_short_name, napravlenie_name, departement_short_title INTO r FROM uch_program
WHERE uch_programm.napravlenie=uch_napravlenie.id and uch_programm.department=upr_department.id and uch_programm.type = '89878DB1-1E71-4E6C-B615-9085F2ED964D' and uch_programm.id <> data_view and uch_programm.name = data_name and uch_programm.code = data_code and uch_programm.data >= date_n and uch_programm.data <= date_o and uch_programm.napravlenie =  data_naprav and  uch_programm.department =  data_kafedra and uch_programm.count_chasov = data_chacov_n and  uch_programm.count_chasov  = data_chacov_o and uch_programm.unuse = data_unuse;
  return r;
END;

--uch_programm.programm_id, uch_programm.name, uch_programm.short_name, uch_programm.count_chasov, uch_programm.count_chasov_audit, uch_programm.data, uch_programm.fullnumber, uch_programm.code, uch_napravlenie.short_name, uch_napravlenie.name, upr_department.short_title INTO r FROM uch_programm

--, uch_napravlenie, upr_department
