-- PROCEDURE: public.sp_create_hruser(character varying, character varying, character varying)

DROP PROCEDURE IF EXISTS public.sp_create_hruser(character varying, character varying, character varying);

CREATE OR REPLACE PROCEDURE public.sp_create_hruser(
	IN username character varying,
	IN password character varying,
	IN email character varying)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    insert into "HR_user" ("username", "email", "password")
    values (username, email, password); 
end;
$BODY$;

-- PROCEDURE: public.sp_edit_employee(character varying, character varying, character varying)

CREATE OR REPLACE PROCEDURE public.sp_edit_employee(
	IN employeeid integer,
	IN firstname character varying,
	IN middlename character varying,
	IN lastname character varying,
	IN gender character varying,
	IN emptype integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
update "Employee_table"
Set "First_Name" = firstname, "Middle_Name" = middlename, "Last_Name" = lastname, "Gender" = gender, "Emp_Type_ID" = emptype
where "Employee_ID" = employeeid;
end;
$BODY$;



-- PROCEDURE: public.sp_emp_appraisal(integer,integer,integer,integer,character varying)

DROP PROCEDURE IF EXISTS public.sp_emp_appraisal(integer,integer,integer,integer,character varying);

CREATE OR REPLACE PROCEDURE public.sp_emp_appraisal(
	IN Emp_perfomance_id integer,
	IN Employee_Id integer,
	IN Emp_rating integer,
    IN Manager_rating integer,
    IN Remarks character varying)

LANGUAGE 'plpgsql'
AS $BODY$
begin
    insert into "Employee_Performance_table" ("Emp_Performance_ID", "Employee_ID", "Emp_rating","Manager_rating","Remarks")
    values (Emp_perfomance_id, Employee_Id, Emp_rating,Manager_rating,Remarks); 
end;
$BODY$;


-- PROCEDURE: public.sp_create_employeeuser(character varying, character varying, character varying, integer)

-- DROP PROCEDURE IF EXISTS public.sp_create_employeeuser(character varying, character varying, character varying, integer);

CREATE OR REPLACE PROCEDURE public.sp_create_employeeuser(
	IN username character varying,
	IN password character varying,
	IN email character varying,
	IN empid integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    insert into "Employee_Login" ("username", "email", "password", "Employee_Id")
    values (username, email, password, empid); 
end;
$BODY$;

CREATE OR REPLACE PROCEDURE public.add_leave_type(
	IN leave_code character varying,
	IN leave_description character varying,
	IN maxleaves integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    insert into "Employee_Login" ("Leaves_code", "Leaves_Type_Desct", "Total_Applicable")
    values (leave_code, leave_description, maxleaves); 
end;
$BODY$;
-- PROCEDURE: public.sp_emp_appraisal_view(integer,integer,integer,integer,character varying)

CREATE OR REPLACE PROCEDURE public.sp_emp_appraisal_view(
	IN Employee_Id integer,
	OUT Emp_perfomance_id integer,
	OUT Emp_rating integer,
    OUT Manager_rating integer,
    OUT Remarks character varying)

LANGUAGE 'plpgsql'
AS $BODY$
begin
    select  "Emp_Performance_ID", 
			"Emp_rating",
			"Manager_rating",
			"Remarks"
	from public."Employee_Performance_table" 
	INTO Emp_perfomance_id, Emp_rating, Manager_rating, Remarks
	where "Employee_Performance_table"."Employee_ID"= Employee_Id;

end;
$BODY$;  

-- PROCEDURE: public.add_leave_type(character varying, character varying, integer)

-- DROP PROCEDURE IF EXISTS public.add_leave_type(character varying, character varying, integer);

CREATE OR REPLACE PROCEDURE public.add_leave_type(
	IN leave_code character varying,
	IN leave_description character varying,
	IN maxleaves integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    insert into "Leaves_table" ("Leave_code", "Leave_Type_Desct", "Total_Applicable")
    values (leave_code, leave_description, maxleaves); 
end;
$BODY$;
ALTER PROCEDURE public.add_leave_type(character varying, character varying, integer)
    OWNER TO skand;

-- PROCEDURE: public.view_empinfo(integer, integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer, character varying, character varying, character varying, integer, character varying, character varying, date, character varying, character varying, character varying, integer, character varying, integer, character varying)

-- DROP PROCEDURE IF EXISTS public.view_empinfo(integer, integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer, character varying, character varying, character varying, integer, character varying, character varying, date, character varying, character varying, character varying, integer, character varying, integer, character varying);

CREATE OR REPLACE PROCEDURE public.view_empinfo(
	INOUT employee_id integer DEFAULT NULL::integer,
	INOUT job_id integer DEFAULT NULL::integer,
	INOUT first_name character varying DEFAULT NULL::character varying,
	INOUT middle_name character varying DEFAULT NULL::character varying,
	INOUT last_name character varying DEFAULT NULL::character varying,
	INOUT email character varying DEFAULT NULL::character varying,
	INOUT mobile character varying DEFAULT NULL::character varying,
	INOUT date_of_joining date DEFAULT NULL::date,
	INOUT manager_id integer DEFAULT NULL::integer,
	INOUT gender character varying DEFAULT NULL::character varying,
	INOUT accrued_leaves integer DEFAULT NULL::integer,
	INOUT shift_code integer DEFAULT NULL::integer,
	INOUT dept_no integer DEFAULT NULL::integer,
	INOUT emp_type_id integer DEFAULT NULL::integer,
	INOUT marital_status character varying DEFAULT NULL::character varying,
	INOUT qualification character varying DEFAULT NULL::character varying,
	INOUT last_employer_address character varying DEFAULT NULL::character varying,
	INOUT last_employer_contact integer DEFAULT NULL::integer,
	INOUT previous_role character varying DEFAULT NULL::character varying,
	INOUT tax_id character varying DEFAULT NULL::character varying,
	INOUT date_of_birth date DEFAULT NULL::date,
	INOUT nationality character varying DEFAULT NULL::character varying,
	INOUT blood_group character varying DEFAULT NULL::character varying,
	INOUT addr1_street_name character varying DEFAULT NULL::character varying,
	INOUT addr1_house_no integer DEFAULT NULL::integer,
	INOUT addr1_city character varying DEFAULT NULL::character varying,
	INOUT postcode integer DEFAULT NULL::integer,
	INOUT country character varying DEFAULT NULL::character varying)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
SELECT emp."Employee_ID",
emp."Job_ID",
emp."First_Name",
emp."Middle_Name",
emp."Last_Name",
emp."Email",
emp."Mobile",
emp."Date_of_joining",
emp."Manager_ID",
emp."Gender",
emp."Accrued_leaves",
emp."Shift_code",
emp."Emp_Type_ID ",
per."Marital_status",
per."Qualification",
per."Last_employer_address",
per."Last_employer_contact",
per."Previous_role",
per."Tax_ID",per."Date_of_birth",
per."Nationality",
per."Blood_group",
addr."Addr1_Street_Name",
addr."Addr1_House_No",
addr."Addr1_City",
addr."Addr1_Postcode",
addr."Addr1_Country"

INTO
employee_id,
job_id,
first_name,
middle_name,
last_name,
email,
mobile,
date_of_joining,
manager_ID,
gender,
accrued_leaves,
shift_code,
emp_type_id,
marital_status,
qualification,
last_employer_address,
last_employer_contact,
previous_role,
tax_ID,
date_of_birth,
nationality,
blood_group,
addr1_street_name,
addr1_house_no,
addr1_city,
postcode,
country

FROM public."Employee_table" as emp,
public."Employee_Personal_table" as per,
public."Emp_address_table" as addr

WHERE emp."Employee_ID" = per."Employee_ID"
AND emp."Employee_ID" = addr."Employee_ID";

END;
$BODY$;
ALTER PROCEDURE public.view_empinfo(integer, integer, character varying, character varying, character varying, character varying, character varying, date, integer, character varying, integer, integer, integer, integer, character varying, character varying, character varying, integer, character varying, character varying, date, character varying, character varying, character varying, integer, character varying, integer, character varying)
    OWNER TO skand;


-------------------------------Insert, Update, Delete for Finance Module-------------------------------------

-- PROCEDURE: public.sp_emp_finance_info(integer, integer, integer, text, character varying, character varying, character varying, date, date, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone)

-- DROP PROCEDURE IF EXISTS public.sp_emp_finance_info(integer, integer, integer, text, character varying, character varying, character varying, date, date, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone);

CREATE OR REPLACE PROCEDURE public.sp_emp_finance_info(
	IN emp_bank_id integer,
	IN employee_id integer,
	IN bank_acc_id integer,
	IN bank_name text,
	IN bank_acc_no character varying,
	IN bank_iban character varying,
	IN bank_location character varying,
	IN bank_acc_start_date date,
	IN bank_acc_end_date date,
	IN salary_id integer,
	IN bonus character varying,
	IN salary_band character varying,
	IN monthly_salary character varying,
	IN annual_salary character varying,
	IN monthly_tax_deduction character varying,
	IN monthly_insurance_deductions character varying,
	IN monthly_pension_deductions character varying,
	IN pf_contribution character varying,
	IN salary_creation_timestamp timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	insert into "Emp_Salary_table" ("Salary_ID",
    								"Employee_ID",
    								"Bonus",
    								"Salary_Band",
    								"Monthly_Salary",
    								"Annual_Salary",
   									"Monthly_Tax _deduction",
    								"Monthly_Insurance_deductions",
    								"Monthly_Pension_deductions",
    								"PF_contribution",
    								"Salary_creation_timestamp")
	values (salary_id,
		    employee_id,
		    bonus,
		    salary_band,
		    monthly_salary,
		    annual_salary,
		    monthly_tax_deduction,
		    monthly_insurance_deductions,
		    monthly_pension_deductions,
		    pf_contribution,
		    salary_creation_timestamp);
			
	insert into "Bank_Account_table" ("Bank_acc_ID", 
									  "Bank_Account_No", 
									  "Bank_Name", 
									  "Bank_IBAN", 
									  "Bank_Location")
	values (bank_acc_id,
			bank_acc_no,
			bank_name,
			bank_iban,
			bank_location);
			
    insert into  "Emp_Bank_table" ("Emp_Bank_ID", 
								   "Employee_ID ", 
								   "Bank_acc_ID", 
								   "Bank_acc_start_date", 
								   "Bank_acc_end_date", 
								   "Salary_ID")
    values (emp_bank_id,
			employee_id,
			bank_acc_id,
			bank_acc_start_date,
			bank_acc_end_date,
			salary_id); 
end;
$BODY$;


-- PROCEDURE: public.sp_emp_financeinfo_update(integer, date, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone)

-- DROP PROCEDURE IF EXISTS public.sp_emp_financeinfo_update(integer, date, date, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone);

CREATE OR REPLACE PROCEDURE public.sp_emp_financeinfo_update(
	IN employee_id integer,
	IN bank_acc_start_date date,
	IN bank_acc_end_date date,
	IN bonus character varying,
	IN salary_band character varying,
	IN monthly_salary character varying,
	IN annual_salary character varying,
	IN monthly_tax_deduction character varying,
	IN monthly_insurance_deductions character varying,
	IN monthly_pension_deductions character varying,
	IN pf_contribution character varying,
	IN salary_creation_timestamp timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
   
	update "Emp_Salary_table" 
	set
	"Bonus"=bonus, 
	"Salary_Band"=salary_band, 
	"Monthly_Salary"=monthly_salary, 
	"Annual_Salary"=annual_salary, 
	"Monthly_Tax _deduction"=monthly_tax_deduction,
	"Monthly_Insurance_deductions"=monthly_insurance_deductions,
	"Monthly_Pension_deductions"=monthly_pension_deductions,
	"PF_contribution"=pf_contribution,
	"Salary_creation_timestamp"=salary_creation_timestamp
    where "Employee_ID"=employee_id;
	
	update "Emp_Bank_table" 
	set 
	"Bank_acc_start_date"=bank_acc_start_date, 
	"Bank_acc_end_date"=bank_acc_end_date,
	"Salary_ID"=(select "Salary_ID" from "Emp_Salary_table" where 
				"Emp_Salary_table"."Employee_ID"=employee_id)
    where "Employee_ID "=employee_id;
end;
$BODY$;


-- PROCEDURE: public.sp_emp_finance_delete(integer, integer, integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_finance_delete(integer, integer, integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_finance_delete(
	IN employee_id integer,
	INOUT val1 integer DEFAULT NULL::integer,
	INOUT val2 integer DEFAULT NULL::integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	select "Bank_acc_ID" from "Emp_Bank_table" where "Employee_ID " = employee_id
	into val1;
	select "Salary_ID" from "Emp_Bank_table" where "Employee_ID " = employee_id
	into val2;
	delete from "Emp_Bank_table" where "Employee_ID " = employee_id;
	delete from "Bank_Account_table" where "Bank_acc_ID" = val1 ;
	delete from "Emp_Salary_table" where "Salary_ID" = val2 ;
	
end;
$BODY$;

-------------------------------Insert, Update, Delete for Department Module-------------------------------------

-- PROCEDURE: public.sp_emp_dept(integer, integer, integer, date, date)

-- DROP PROCEDURE IF EXISTS public.sp_emp_dept(integer, integer, integer, date, date);

CREATE OR REPLACE PROCEDURE public.sp_emp_dept(
	IN emp_dept_id integer,
	IN dept_no integer,
	IN employee_id integer,
	IN emp_dept_joining_date date,
	IN emp_dept_leaving_date date)
LANGUAGE 'plpgsql'
AS $BODY$
begin

    insert into  "Emp_Dept_table" ("Emp_Dept_ID",
    "Dept_no.",
    "Employee_ID",
    "Emp_dept_joining_date",
    "Emp_dept_leaving_date")
    values (emp_dept_id,
	dept_no,
	employee_id,
	emp_dept_joining_date,
	emp_dept_leaving_date); 
end;
$BODY$;

-- PROCEDURE: public.sp_emp_dept_update(integer, integer, date, date)

-- DROP PROCEDURE IF EXISTS public.sp_emp_dept_update(integer, integer, date, date);

CREATE OR REPLACE PROCEDURE public.sp_emp_dept_update(
	IN dept_no integer,
	IN employee_id integer,
	IN emp_dept_joining_date date,
	IN emp_dept_leaving_date date)
LANGUAGE 'plpgsql'
AS $BODY$
begin

    update  "Emp_Dept_table" 
	set
	"Dept_no."=dept_no,
    "Employee_ID"=employee_id,
    "Emp_dept_joining_date"=emp_dept_joining_date,
    "Emp_dept_leaving_date"=emp_dept_leaving_date
	where "Employee_ID"=employee_id;
	end;
$BODY$;

-- PROCEDURE: public.sp_emp_dept_delete(integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_dept_delete(integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_dept_delete(
	IN employee_id integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	delete from "Emp_Dept_table" where "Employee_ID" = employee_id;
end;
$BODY$;

-------------------------------Insert, Update, Delete for Job Module-------------------------------------

-- PROCEDURE: public.sp_emp_job(integer, integer, integer, timestamp without time zone, date, text, integer, text, date, date)

-- DROP PROCEDURE IF EXISTS public.sp_emp_job(integer, integer, integer, timestamp without time zone, date, text, integer, text, date, date);

CREATE OR REPLACE PROCEDURE public.sp_emp_job(
	IN job_emp_id integer,
	IN employee_id integer,
	IN job_id integer,
	IN job_creation_timestamp timestamp without time zone,
	IN job_updated_on date,
	IN job_description text,
	IN dept_no integer,
	IN active_inactive text,
	IN job_start_date date,
	IN job_end_date date)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	insert into  "Job_table" ("Job_ID",
    "Job_creation_timestamp",
    "Job_updated_on",
    "Job_description",
    "Dept_no.",
    "Active/Inactive")
    values (job_id,
    job_creation_timestamp,
    job_updated_on,
    Job_description,
    dept_no,
    active_inactive);

    insert into  "Emp_Job_table" ("Job_emp_ID",
    "Employee_ID",
    "Job_ID",
    "Job_start_date",
    "Job_end_date")
    values (job_emp_id,
	employee_id,
	job_id,
	job_start_date,
	job_end_date); 
end;
$BODY$;

-- PROCEDURE: public.sp_emp_job_update(integer, timestamp without time zone, date, text, integer, text, date, date)

-- DROP PROCEDURE IF EXISTS public.sp_emp_job_update(integer, timestamp without time zone, date, text, integer, text, date, date);

CREATE OR REPLACE PROCEDURE public.sp_emp_job_update(
	IN employee_id integer,
	IN job_creation_timestamp timestamp without time zone,
	IN job_updated_on date,
	IN job_description text,
	IN dept_no integer,
	IN active_inactive text,
	IN job_start_date date,
	IN job_end_date date)
LANGUAGE 'plpgsql'
AS $BODY$
begin
   
	update "Job_table" 
	set
    "Job_creation_timestamp" = job_creation_timestamp,
    "Job_updated_on" = job_updated_on,
    "Job_description" = job_description,
    "Dept_no." = dept_no,
    "Active/Inactive" = active_inactive
    where "Job_ID" = (select "Job_ID" from "Emp_Job_table" where "Employee_ID" = employee_id);
	
	update "Emp_Job_table" 
	set 
    "Job_start_date" = job_start_date,
    "Job_end_date" = job_end_date
    where "Employee_ID"=employee_id;
end;
$BODY$;

-- PROCEDURE: public.sp_emp_job_delete(integer, integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_job_delete(integer, integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_job_delete(
	IN employee_id integer,
	INOUT val1 integer DEFAULT NULL::integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	select "Job_ID" from "Emp_Job_table" where "Employee_ID" = employee_id
	into val1;
	delete from "Emp_Job_table" where "Employee_ID" = employee_id;
	delete from "Job_table" where "Job_ID" = val1;
end
$BODY$;

-------------------------------------Display, Search for Finance Module-------------------------------------

-- PROCEDURE: public.sp_emp_financeinfo_view(integer, integer, text, character varying, character varying, character varying, date, date, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone)

-- DROP PROCEDURE IF EXISTS public.sp_emp_financeinfo_view(integer, integer, text, character varying, character varying, character varying, date, date, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone);

CREATE OR REPLACE PROCEDURE public.sp_emp_financeinfo_view(
	INOUT employee_id integer DEFAULT NULL::integer,
	INOUT bank_acc_id integer DEFAULT NULL::integer,
	INOUT bank_name text DEFAULT NULL::text,
	INOUT bank_acc_no character varying DEFAULT NULL::character varying,
	INOUT bank_iban character varying DEFAULT NULL::character varying,
	INOUT bank_location character varying DEFAULT NULL::character varying,
	INOUT bank_acc_start_date date DEFAULT NULL::date,
	INOUT bank_acc_end_date date DEFAULT NULL::date,
	INOUT salary_id integer DEFAULT NULL::integer,
	INOUT bonus character varying DEFAULT NULL::character varying,
	INOUT salary_band character varying DEFAULT NULL::character varying,
	INOUT monthly_salary character varying DEFAULT NULL::character varying,
	INOUT annual_salary character varying DEFAULT NULL::character varying,
	INOUT monthly_tax_deduction character varying DEFAULT NULL::character varying,
	INOUT monthly_insurance_deductions character varying DEFAULT NULL::character varying,
	INOUT monthly_pension_deductions character varying DEFAULT NULL::character varying,
	INOUT pf_contribution character varying DEFAULT NULL::character varying,
	INOUT salary_creation_timestamp timestamp without time zone DEFAULT NULL::timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
SELECT ban."Employee_ID ",
ban."Bank_acc_ID",
acc."Bank_Name",
acc."Bank_Account_No",
acc."Bank_IBAN",
acc."Bank_Location",
ban."Bank_acc_start_date",
ban."Bank_acc_end_date",
ban."Salary_ID",
sal."Bonus",
sal."Salary_Band",
sal."Monthly_Salary",
sal."Annual_Salary",
sal."Monthly_Tax _deduction",
sal."Monthly_Insurance_deductions",
sal."Monthly_Pension_deductions",
sal."PF_contribution",
sal."Salary_creation_timestamp"

INTO
employee_id,
bank_acc_id,
bank_name,
bank_acc_no,
bank_iban,
bank_location,
bank_acc_start_date,
bank_acc_end_date,
salary_id,
bonus,
salary_band,
monthly_salary,
annual_salary,
monthly_tax_deduction,
monthly_insurance_deductions,
monthly_pension_deductions,
pf_contribution,
salary_creation_timestamp

FROM public."Bank_Account_table" as acc,
public."Emp_Bank_table" as ban,
public."Emp_Salary_table" as sal

WHERE ban."Bank_acc_ID" = acc."Bank_acc_ID"
AND ban."Employee_ID " = sal."Employee_ID";

END;
$BODY$;

-- PROCEDURE: public.sp_emp_finance_search(integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_finance_search(integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_finance_search(
	IN employee_id integer,
	OUT bank_acc_id integer,
	OUT bank_name text,
	OUT bank_acc_no character varying,
	OUT bank_iban character varying,
	OUT bank_location character varying,
	OUT bank_acc_start_date date,
	OUT bank_acc_end_date date,
	OUT salary_id integer,
	OUT bonus character varying,
	OUT salary_band character varying,
	OUT monthly_salary character varying,
	OUT annual_salary character varying,
	OUT monthly_tax_deduction character varying,
	OUT monthly_insurance_deductions character varying,
	OUT monthly_pension_deductions character varying,
	OUT pf_contribution character varying,
	OUT salary_creation_timestamp timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin

SELECT ban."Bank_acc_ID",
acc."Bank_Name",
acc."Bank_Account_No",
acc."Bank_IBAN",
acc."Bank_Location",
ban."Bank_acc_start_date",
ban."Bank_acc_end_date",
ban."Salary_ID",
sal."Bonus",
sal."Salary_Band",
sal."Monthly_Salary",
sal."Annual_Salary",
sal."Monthly_Tax _deduction",
sal."Monthly_Insurance_deductions",
sal."Monthly_Pension_deductions",
sal."PF_contribution",
sal."Salary_creation_timestamp"

INTO
bank_acc_id,
bank_name,
bank_acc_no,
bank_iban,
bank_location,
bank_acc_start_date,
bank_acc_end_date,
salary_id,
bonus,
salary_band,
monthly_salary,
annual_salary,
monthly_tax_deduction,
monthly_insurance_deductions,
monthly_pension_deductions,
pf_contribution,
salary_creation_timestamp

FROM public."Bank_Account_table" as acc,
public."Emp_Bank_table" as ban,
public."Emp_Salary_table" as sal

WHERE ban."Bank_acc_ID" = acc."Bank_acc_ID"
AND ban."Employee_ID " = sal."Employee_ID";
end;
$BODY$;


-------------------------------------Display, Search for Department Module-------------------------------------

-- PROCEDURE: public.sp_emp_dept_view(integer, text, integer, character varying, date, date, timestamp without time zone)

-- DROP PROCEDURE IF EXISTS public.sp_emp_dept_view(integer, text, integer, character varying, date, date, timestamp without time zone);

CREATE OR REPLACE PROCEDURE public.sp_emp_dept_view(
	INOUT dept_no integer DEFAULT NULL::integer,
	INOUT dept_name text DEFAULT NULL::text,
	INOUT employee_id integer DEFAULT NULL::integer,
	INOUT dept_contact_no character varying DEFAULT NULL::character varying,
	INOUT emp_dept_joining_date date DEFAULT NULL::date,
	INOUT emp_dept_leaving_date date DEFAULT NULL::date,
	INOUT creation_timestamp timestamp without time zone DEFAULT NULL::timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	SELECT edep."Dept_no.",
	dep."Dept_Name",
	edep."Employee_ID",
	dep."Dept_contact_no",
	edep."Emp_dept_joining_date",
	edep."Emp_dept_leaving_date",
	dep."Creation_Timestamp"
	
	INTO dept_no,
	dept_name,
	employee_id,
	dept_contact_no,
	emp_dept_joining_date,
	emp_dept_leaving_date,
	creation_timestamp
	
	FROM public."Emp_Dept_table" as edep,
	public."Department_table" as dep
	
	WHERE edep."Dept_no." = dep."Dept_no.";
	
end;
$BODY$;

-- PROCEDURE: public.sp_emp_dept_search(integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_dept_search(integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_dept_search(
	IN employee_id integer,
	OUT dept_no integer,
	OUT dept_name character varying,
	OUT dept_contact_no character varying,
	OUT dept_joining_date date,
	OUT dept_leaving_date date,
	OUT creation_timestamp timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    select  "Dept_no.", 
			"Emp_dept_joining_date",
			"Emp_dept_leaving_date"
	from public."Emp_Dept_table" 
	INTO dept_no, dept_joining_date, dept_leaving_date
	where "Emp_Dept_table"."Employee_ID"= employee_id;
	
	select  "Dept_Name", 
			"Dept_contact_no",
			"Creation_Timestamp"
	from public."Department_table" 
	INTO dept_name, dept_contact_no, creation_timestamp
	where "Department_table"."Dept_no."=(select "Dept_no." from "Emp_Dept_table" where "Employee_ID" = employee_id);

end;
$BODY$;

-------------------------------------Display, Search for Job Module-------------------------------------

-- PROCEDURE: public.sp_emp_job_view(integer, integer, timestamp without time zone, date, text, integer, text, date, date)

-- DROP PROCEDURE IF EXISTS public.sp_emp_job_view(integer, integer, timestamp without time zone, date, text, integer, text, date, date);

CREATE OR REPLACE PROCEDURE public.sp_emp_job_view(
	INOUT employee_id integer DEFAULT NULL::integer,
	INOUT job_id integer DEFAULT NULL::integer,
	INOUT job_creation_timestamp timestamp without time zone DEFAULT NULL::timestamp without time zone,
	INOUT job_updated_on date DEFAULT NULL::date,
	INOUT job_description text DEFAULT NULL::text,
	INOUT dept_no integer DEFAULT NULL::integer,
	INOUT active_inactive text DEFAULT NULL::text,
	INOUT job_start_date date DEFAULT NULL::date,
	INOUT job_end_date date DEFAULT NULL::date)
LANGUAGE 'plpgsql'
AS $BODY$
begin
	SELECT ejob."Employee_ID",
	ejob."Job_ID",
	job."Job_creation_timestamp",
	job."Job_updated_on",
	job."Job_description",
	job."Dept_no.",
	job."Active/Inactive",
	ejob."Job_start_date",
	ejob."Job_end_date"
	
	INTO employee_id,
	job_id,
	job_creation_timestamp,
	job_updated_on,
	job_description,
	dept_no,
	active_inactive,
	job_start_date,
	job_end_date
	
	FROM public."Job_table" as job,
	public."Emp_Job_table" as ejob

	WHERE ejob."Job_ID" = job."Job_ID";
end;
$BODY$;

-- PROCEDURE: public.sp_emp_job_search(integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_job_search(integer);

CREATE OR REPLACE PROCEDURE public.sp_emp_job_search(
	IN employee_id integer,
	OUT job_id integer,
	OUT job_creation_timestamp timestamp without time zone,
	OUT job_updated_on date,
	OUT job_description text,
	OUT dept_no integer,
	OUT active_inactive text,
	OUT job_start_date date,
	OUT job_end_date date)
LANGUAGE 'plpgsql'
AS $BODY$
begin
    SELECT ejob."Job_ID",
	job."Job_creation_timestamp",
	job."Job_updated_on",
	job."Job_description",
	job."Dept_no.",
	job."Active/Inactive",
	ejob."Job_start_date",
	ejob."Job_end_date"
	
	INTO job_id,
	job_creation_timestamp,
	job_updated_on,
	job_description,
	dept_no,
	active_inactive,
	job_start_date,
	job_end_date
	
	FROM public."Job_table" as job,
	public."Emp_Job_table" as ejob

	WHERE ejob."Job_ID" = job."Job_ID";
end;
$BODY$;

