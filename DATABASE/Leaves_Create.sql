-- Table: public.Leaves_table

-- DROP TABLE IF EXISTS public."Leaves_table";

CREATE TABLE IF NOT EXISTS public."Leaves_table"
(
    "Leave_code" character varying COLLATE pg_catalog."default" NOT NULL,
    "Leave_Type_Desct" text COLLATE pg_catalog."default",
    "Total_Applicable" integer NOT NULL,
    CONSTRAINT "Emp_Leaves_table_pkey" PRIMARY KEY ("Leave_code")
)
