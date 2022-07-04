-- Table: public.Employee_Login

-- DROP TABLE IF EXISTS public."Employee_Login";

CREATE TABLE IF NOT EXISTS public."Employee_Login"
(
    "Employee_Login_Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Employee_Id" integer NOT NULL,
    username character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employee_login_id_pk PRIMARY KEY ("Employee_Login_Id"),
    CONSTRAINT email_unique UNIQUE (username),
    CONSTRAINT fk_employee_id FOREIGN KEY ("Employee_Id")
        REFERENCES public."Employee_table" ("Employee_ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Employee_Login"
    OWNER to postgres;