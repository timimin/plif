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
SELECT programm_id, programm_name, programm_short_name, programm_count_chasov, programm_count_chasov_audit, programm_data, programm_fullnumber, programm_code, napravlenie_short_name, napravlenie_name, departement_short_title INTO r FROM uch_program
WHERE uch_program.napr_id=uch_napravlenie.id and uch_program.department_id=upr_department.id and uch_program_type = '89878DB1-1E71-4E6C-B615-9085F2ED964D' and programm_id <> data_view and programm_name LIKE '%'+ data_name+'%' and programm_code LIKE '%'+ data_code+'%' and programm_data >= date_n and programm_data <= date_o and programm_napravlenie =  data_naprav and programm_department =  data_kafedra and programm_count_chasov = data_chacov_n and programm_count_chasov = data_chacov_o and programm_unuse = data_unuse;
  return r;
END;



--, uch_napravlenie, upr_department
