-- PROCEDURE: public.cr_new_emp(integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer)

-- DROP PROCEDURE IF EXISTS public.cr_new_emp(integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer);

CREATE OR REPLACE PROCEDURE public.cr_new_emp(
	IN job_id integer,
	IN first_name character varying,
	IN middle_name character varying,
	IN last_name character varying,
	IN email character varying,
	IN mobile character varying,
	IN date_of_joining date,
	IN manager_id integer,
	IN gender character varying,
	IN accrued_leaves integer,
	IN shift_code integer,
	IN dept_no integer,
	IN emp_type_id integer)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
INSERT into "Employee_table"(
	"Job_ID","First_Name","Middle_Name",
    "Last_Name","Email",
    "Mobile","Date_of_joining",
	"Manager_ID","Gender",
	"Accrued_leaves","Shift_code","Dept_no.","Emp_Type_ID ")
values (
	Job_ID,First_Name,Middle_Name,
    Last_Name,Email,
    Mobile,Date_of_joining,
	Manager_ID,Gender,
	Accrued_leaves,Shift_code,Dept_no,Emp_Type_ID);
end;
$BODY$;
ALTER PROCEDURE public.cr_new_emp(integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer)
    OWNER TO postgres;
