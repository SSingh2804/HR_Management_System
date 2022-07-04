-- Table: public.Emp_Leaves

-- DROP TABLE IF EXISTS public."Emp_Leaves";

CREATE TABLE IF NOT EXISTS public."Emp_Leaves"
(
    "Emp_Leave_Id" integer NOT NULL,
    "Employee_Id" integer NOT NULL,
    "Applied_on" date NOT NULL,
    "Leave_date" date NOT NULL,
    CONSTRAINT "Emp_Leaves_pkey" PRIMARY KEY ("Emp_Leave_Id"),
    CONSTRAINT unique_pk UNIQUE ("Emp_Leave_Id")
        INCLUDE("Emp_Leave_Id"),
    CONSTRAINT empid_fk FOREIGN KEY ("Employee_Id")
        REFERENCES public."Employee_table" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)