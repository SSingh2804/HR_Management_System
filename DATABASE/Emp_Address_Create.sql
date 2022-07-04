-- Table: public.Emp_address_table

-- DROP TABLE IF EXISTS public."Emp_address_table";

CREATE TABLE IF NOT EXISTS public."Emp_address_table"
(
    "Address_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Addr1_Street_Name" character varying COLLATE pg_catalog."default" NOT NULL,
    "Addr1_Building_Name" character varying COLLATE pg_catalog."default" NOT NULL,
    "Addr1_House_No" character varying COLLATE pg_catalog."default" NOT NULL,
    "Addr1_City" text COLLATE pg_catalog."default" NOT NULL,
    "Addr1_Postcode" integer NOT NULL,
    "Addr1_Country" text COLLATE pg_catalog."default" NOT NULL,
    "Addr2_Street_Name" character varying COLLATE pg_catalog."default",
    "Addr2_Building_Name" character varying COLLATE pg_catalog."default",
    "Addr2_House_No" character varying COLLATE pg_catalog."default",
    "Addr2_City" text COLLATE pg_catalog."default",
    "Addr2_Postcode" integer,
    "Addr2_Country" text COLLATE pg_catalog."default",
    CONSTRAINT "Emp_address_table_pkey" PRIMARY KEY ("Address_ID"),
    CONSTRAINT fk_add_emp FOREIGN KEY ("Employee_ID")
        REFERENCES public."Employee_table" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)