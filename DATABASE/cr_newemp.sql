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




----------------------------------------------------------------------------------------------------------
Personal Data entry procedure 
-- PROCEDURE: public.personal_data_emp(integer, character varying, character varying, character varying, character varying, character varying, text, character varying, date, character varying, character varying, integer, character varying, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying, integer, character varying)

DROP PROCEDURE IF EXISTS public.personal_data_emp(integer, character varying, character varying, character varying, character varying, character varying, text, character varying, date, character varying, character varying, integer, character varying, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying, integer, character varying);

CREATE OR REPLACE PROCEDURE public.personal_data_emp(
	IN empid integer,
	IN marital_status character varying,
	IN qualification character varying,
	IN last_employer character varying,
	IN last_employer_address character varying,
	IN last_employer_contact character varying,
	IN previous_role text,
	IN tax_id character varying,
	IN date_of_birth date,
	IN nationality character varying,
	IN blood_group character varying,
	IN employee_id integer,
	IN addr1_street_name character varying,
	IN addr1_building_name character varying,
	IN addr1_house_no character varying,
	IN addr1_city character varying,
	IN addr1_postcode integer,
	IN addr1_country character varying,
	IN addr2_street_name character varying,
	IN addr2_building_name character varying,
	IN addr2_house_no character varying,
	IN addr2_city character varying,
	IN addr2_postcode integer,
	IN addr2_country character varying)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

	INSERT into "Employee_Personal_table"(
	"Employee_ID","Marital_status","Qualification",
    "Last_employer","Last_employer_address",
    "Last_employer_contact","Previous_role",
	"Tax_ID","Date_of_birth","Nationality",
	"Blood_group")
values (Employee_ID,
     Marital_status,Qualification,
    Last_employer,Last_employer_address,
    Last_employer_contact,Previous_role,
	Tax_ID,Date_of_birth,Nationality,
	Blood_group);
	
	INSERT into "Emp_address_table"(
	"Employee_ID","Addr1_Street_Name","Addr1_Building_Name","Addr1_House_No","Addr1_City",
    "Addr1_Postcode","Addr1_Country",
	"Addr2_Street_Name","Addr2_Building_Name","Addr2_House_No","Addr2_City",
    "Addr2_Postcode","Addr2_Country")
values (employee_id,addr1_street_name,
    addr1_building_name,addr1_city,
    addr1_postcode,addr1_country,
	addr2_street_name,addr2_building_name,addr2_city,
    addr2_postcode,addr2_country);
	
 
		
end;
$BODY$;
ALTER PROCEDURE public.personal_data_emp(integer, character varying, character varying, character varying, character varying, character varying, text, character varying, date, character varying, character varying, integer, character varying, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying, integer, character varying)
    OWNER TO postgres;
