--Procedure to update Employee details


CREATE OR REPLACE PROCEDURE public.cr_new_emp(
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
	SET "Employee_ID"= employee_id , "Job_ID"= job_id, "First_Name"=first_name, 
        "Middle_Name"=middle_name, "Last_Name"=last_name, "Email"= email, 
		"Mobile"=mobile, "Date_of_joining"=date_of_joining, "Date_of_leaving"=date_of_leaving, 
		"Manager_ID"=manager_id, "Gender"=gender, "Accrued_leaves"=accrued_leaves, 
		"Shift_code"=shift_code, "Dept_no."=dept_no, "Emp_Type_ID "=emp_type_id
	WHERE Employee_ID ="employee_id";
end;
$BODY$;


--Procedure to update Employee personal details
CREATE OR REPLACE PROCEDURE public.personal_data_emp(
	IN emp_personal_id integer,
	IN marital_status text,
	IN qualification character varying,
	IN last_employer character varying,
	IN last_employer_address character varying,
	IN last_employer_contact character varying,
	IN previous_role text,
	IN tax_id character varying,
	IN date_of_birth integer,
	IN nationality character varying,
	IN blood_group character varying)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

UPDATE public."Employee_table"
	SET "Employee_ID"=?, "Job_ID"=?, "First_Name"=?, "Middle_Name"=?, "Last_Name"=?, "Email"=?, "Mobile"=?, "Date_of_joining"=?, "Date_of_leaving"=?, "Manager_ID"=?, "Gender"=?, "Accrued_leaves"=?, "Shift_code"=?, "Dept_no."=?, "Emp_Type_ID "=?
	WHERE <condition>;
	
	end;
$BODY$;