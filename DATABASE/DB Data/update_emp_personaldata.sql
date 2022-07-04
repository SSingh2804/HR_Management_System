-- PROCEDURE: public.update_personal_empdata(integer, integer, text, character varying, character varying, character varying, character varying, character varying, character varying, date, character varying, character varying)

DROP PROCEDURE IF EXISTS public.update_personal_empdata(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, date, character varying, character varying);

CREATE OR REPLACE PROCEDURE public.update_personal_empdata(
	IN emp_personal_id integer,
	IN employee_id integer,
	IN marital_status character varying,
	IN qualification character varying,
	IN last_employer character varying,
	IN last_employer_address character varying,
	IN last_employer_contact character varying,
	IN previous_role character varying,
	IN tax_id character varying,
	IN date_of_birth date,
	IN nationality character varying,
	IN blood_group character varying)
LANGUAGE 'plpgsql'
AS $BODY$

BEGIN

	UPDATE "Employee_Personal_table"
 SET 
	"Marital_status"=marital_status,
    "Qualification"=qualification,
    "Last_employer"=last_employer,
    "Last_employer_address"=last_employer_address,
    "Last_employer_contact"=last_employer_contact,
    "Previous_role"=previous_role,
	"Tax_ID"=tax_id,
    "Date_of_birth"=date_of_birth,
    "Nationality"=nationality,
	"Blood_group"=blood_group
 
 WHERE "Emp_personal_ID" = emp_personal_id;
end;
$BODY$;
ALTER PROCEDURE public.update_personal_empdata(integer, integer, text, character varying, character varying, character varying, character varying, character varying, character varying, date, character varying, character varying)
    OWNER TO postgres;
