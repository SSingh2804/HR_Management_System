-- PROCEDURE: public.delete_emp_rec(integer)

-- DROP PROCEDURE IF EXISTS public.delete_emp_rec(integer);

-- CREATE OR REPLACE PROCEDURE public.delete_emp_rec(
-- 	IN employee_id integer)
-- LANGUAGE 'plpgsql'
-- AS $BODY$
-- BEGIN
-- ALTER TABLE public."Employee_table"   
--     DROP CONSTRAINT fk_emp_emptype,   
--     ADD CONSTRAINT fk_emp_emptype FOREIGN KEY (Employee_ID)
--           REFERENCES Employee_table (Employee_ID) ON DELETE CASCADE;
		  
-- 	DELETE FROM public."Employee_table" 
-- 	WHERE Employee_table.Employee_ID = employee_id;
-- END; 
-- $BODY$;
-- ALTER PROCEDURE public.delete_emp_rec(integer)
--     OWNER TO postgres;
	
	
	-- PROCEDURE: public.sp_emp_finance_delete(integer, integer, integer)

-- DROP PROCEDURE IF EXISTS public.sp_emp_finance_delete(integer, integer, integer);

CREATE OR REPLACE PROCEDURE public.delete_emp_record(
	IN employee_id integer,
	INOUT emp_per integer DEFAULT NULL::integer,
	INOUT emp_addr integer DEFAULT NULL::integer
    INOUT emp_sal   integer DEFAULT NULL::integer,
    INOUT emp_perf   integer DEFAULT NULL::integer,
	INOUT emp_timesh   integer DEFAULT NULL::integer,
    INOUT emp_bankacc   integer DEFAULT NULL::integer,
    INOUT emp_job  integer DEFAULT NULL::integer,
    INOUT emp_dep   integer DEFAULT NULL::integer,
    INOUT emp_loc   integer DEFAULT NULL::integer)
LANGUAGE 'plpgsql'
AS $BODY$
begin




	select "Employee_personal_ID" from "Employee_personal_table" where "Employee_ID " = employee_id
	into emp_per;
	select "Address_ID" from "Emp_address_table" where "Employee_ID " = employee_id
	into emp_addr;
	select "Salary_ID" from "Emp_Salary_table" where "Employee_ID " = employee_id
	into emp_sal;
	select "Emp_Performance_ID" from "Employee_Performance_table" where "Employee_ID " = employee_id
	into emp_perf;
	select "Timesheet_ID" from "Emp_Timesheet_table" where "Employee_ID " = employee_id
	into emp_timesh;
	select "Bank_acc_ID" from "Emp_Bank_table" where "Employee_ID " = employee_id
	into emp_bankacc;
	select "Job_emp_ID" from "Emp_Job_table" where "Employee_ID " = employee_id
	into emp_job;
	select "Emp_Dept_ID" from "Emp_Dept_table" where "Employee_ID " = employee_id
	into emp_dep;
	select "Location_ID" from "Emp_Location_table" where "Employee_ID " = employee_id
	into emp_loc;
	
	
	delete from "Employee_personal_table" where "Employee_ID " = emp_per;
	delete from "Emp_address_table" where "Employee_ID " = emp_addr;
	delete from "Emp_Salary_table" where "Employee_ID " = emp_sal;
	delete from "Employee_Performance_table" where "Employee_ID " = emp_addr;
	delete from "Emp_Timesheet_table" where "Employee_ID " = emp_timesh;
	delete from "Emp_Bank_table" where "Employee_ID " = emp_bankacc;
	delete from "Emp_Job_table" where "Employee_ID " = emp_job;
	delete from "Emp_Dept_table" where "Employee_ID " = emp_dep;
	delete from "Emp_Location_table" where "Employee_ID " = emp_loc;

	
end;
$BODY$;
