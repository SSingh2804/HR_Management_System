-- PROCEDURE:update emp details
-- PROCEDURE: public.update_emprec(integer, integer, character varying, character varying, character varying, character varying, character varying, date, date, integer, character varying, integer, integer, integer, integer)

DROP PROCEDURE IF EXISTS public.update_emprec(integer, integer, character varying, character varying, character varying, character varying, character varying, date, date, integer, character varying, integer, integer, integer, integer);

CREATE OR REPLACE PROCEDURE public.update_emprec(
	IN employee_id integer,
	IN job_id integer,
	IN first_name character varying,
	IN middle_name character varying,
	IN last_name character varying,
	IN email character varying,
	IN mobile character varying,
	IN date_of_joining date,
	IN date_of_leaving date,
	IN manager_id integer,
	IN gender character varying,
	IN accrued_leaves integer,
	IN shift_code integer,
	IN dept_no integer,
	IN emp_type_id integer)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
UPDATE Employee_table
	SET "Employee_ID"=employee_id , "Job_ID"=job_id, "First_Name"=first_name, 
        "Middle_Name"=middle_name, "Last_Name"=last_name, "Email"=email, 
		"Mobile"=mobile, "Date_of_joining"=date_of_joining, "Date_of_leaving"=date_of_leaving, 
		"Manager_ID"=manager_id, "Gender"=gender, "Accrued_leaves"=accrued_leaves, 
		"Shift_code"=shift_code, "Dept_no."=dept_no, "Emp_Type_ID "=emp_type_id
	WHERE Employee_ID ="employee_id";
end;
$BODY$;
ALTER PROCEDURE public.update_emprec(integer, integer, character varying, character varying, character varying, character varying, character varying, date, date, integer, character varying, integer, integer, integer, integer)
    OWNER TO postgres;
