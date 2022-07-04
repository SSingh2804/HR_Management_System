CREATE OR REPLACE PROCEDURE public.deleteall_emprec(
	IN employee_id integer,
	INOUT emp_pers integer DEFAULT NULL::integer
)

LANGUAGE 'plpgsql'
AS $BODY$
begin
	select "Emp_personal_ID" from "Employee_Personal_table" where "Employee_ID " = employee_id
	into emp_pers;



	delete from public."Employee_Personal_tablee" where "Employee_ID " = emp_pers;
	

	
end;
$BODY$;
