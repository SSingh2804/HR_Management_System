PGDMP     .    (                z        	   HR_Server    14.3    14.3 d    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394 	   HR_Server    DATABASE     o   CREATE DATABASE "HR_Server" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "HR_Server";
                postgres    false            ?            1259    16527    Bank_Account    TABLE       CREATE TABLE public."Bank_Account" (
    "Bank_acc_ID" integer NOT NULL,
    "Bank_Account_No" character varying NOT NULL,
    "Salary_ID" integer NOT NULL,
    "Bank_Name" text NOT NULL,
    "Bank_IFSC" character varying NOT NULL,
    "Bank_Location" character varying
);
 "   DROP TABLE public."Bank_Account";
       public         heap    postgres    false            ?            1259    16505 	   Countries    TABLE     k   CREATE TABLE public."Countries" (
    "Country_ID	" integer NOT NULL,
    "Country_name	" text NOT NULL
);
    DROP TABLE public."Countries";
       public         heap    postgres    false            ?            1259    16491    Department_table    TABLE       CREATE TABLE public."Department_table" (
    "Dept_no." integer NOT NULL,
    "Dept_Name" text NOT NULL,
    "Org_ID" integer,
    "Dept_contact_no" character varying NOT NULL,
    "Location_ID" integer,
    "Creation_Timestamp" timestamp without time zone
);
 &   DROP TABLE public."Department_table";
       public         heap    postgres    false            ?            1259    16422    Emp_Achievements_table    TABLE     ?   CREATE TABLE public."Emp_Achievements_table" (
    "Course_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Date_of_Certification" date,
    "Certifications_desc" character varying,
    "Certification_validity" date
);
 ,   DROP TABLE public."Emp_Achievements_table";
       public         heap    postgres    false            ?            1259    16522    Emp_Bank_table    TABLE     ?   CREATE TABLE public."Emp_Bank_table" (
    "Emp_Bank_ID" integer NOT NULL,
    "Employee_ID " integer NOT NULL,
    "Bank_acc_ID" integer NOT NULL,
    "Bank_acc_start_date" date NOT NULL,
    "Bank_acc_end_date" date
);
 $   DROP TABLE public."Emp_Bank_table";
       public         heap    postgres    false            ?            1259    16517    Emp_Dept_table    TABLE     ?   CREATE TABLE public."Emp_Dept_table" (
    "Emp_Dept_ID" integer NOT NULL,
    "Dept_no." integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Emp_dept_joining_date" date NOT NULL,
    "Emp_dept_leaving_date" date
);
 $   DROP TABLE public."Emp_Dept_table";
       public         heap    postgres    false            ?            1259    16429    Emp_Equip_Info_table    TABLE       CREATE TABLE public."Emp_Equip_Info_table" (
    "System_ID" character varying NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Type_of_system" character varying NOT NULL,
    "Location" character varying,
    "Equip_info_creation_Timestamp" timestamp without time zone NOT NULL
);
 *   DROP TABLE public."Emp_Equip_Info_table";
       public         heap    postgres    false            ?           0    0    TABLE "Emp_Equip_Info_table"    COMMENT     W   COMMENT ON TABLE public."Emp_Equip_Info_table" IS 'Employee system information table';
          public          postgres    false    213            ?            1259    16512    Emp_Job_table    TABLE     ?   CREATE TABLE public."Emp_Job_table" (
    "Job_emp_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Job_ID" integer NOT NULL,
    "Job_start_date" date NOT NULL,
    "Job_end_date" date
);
 #   DROP TABLE public."Emp_Job_table";
       public         heap    postgres    false            ?            1259    16457    Emp_Leaves_table    TABLE     ?   CREATE TABLE public."Emp_Leaves_table" (
    "Leave_code" character varying NOT NULL,
    "Leave_Type_Desct" text,
    "No_of_Leaves_applicable" character varying NOT NULL
);
 &   DROP TABLE public."Emp_Leaves_table";
       public         heap    postgres    false            ?            1259    16612    Emp_Location_table    TABLE     ?   CREATE TABLE public."Emp_Location_table" (
    "Location_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Country_ID" integer NOT NULL,
    "Address_ID" integer NOT NULL
);
 (   DROP TABLE public."Emp_Location_table";
       public         heap    postgres    false            ?            1259    16443    Emp_Salary_table    TABLE     ;  CREATE TABLE public."Emp_Salary_table" (
    "Payroll_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Bonus" character varying,
    "Salary_Band" character varying NOT NULL,
    "Monthly_Salary" character varying,
    "Annual_Salary" character varying NOT NULL,
    "Monthly_Tax _deduction" character varying NOT NULL,
    "Monthly_Insurance_deductions" character varying NOT NULL,
    "Monthly_Pension_deductions" character varying NOT NULL,
    "PF_contribution" character varying,
    "Salary_creation_timestamp" timestamp without time zone NOT NULL
);
 &   DROP TABLE public."Emp_Salary_table";
       public         heap    postgres    false            ?            1259    16450    Emp_Timesheet_table    TABLE     ?  CREATE TABLE public."Emp_Timesheet_table" (
    "Timesheet_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Timesheet_code" character varying,
    "Project_ID" integer,
    "Shift_code" integer NOT NULL,
    "Billable_hours" character varying,
    "Leave_code" integer,
    "Leave_hours" character varying,
    "Timesheet_creation_timestamp" timestamp without time zone
);
 )   DROP TABLE public."Emp_Timesheet_table";
       public         heap    postgres    false            ?            1259    16415    Emp_address_table    TABLE     I  CREATE TABLE public."Emp_address_table" (
    "Address_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Addr1_Street Name" character varying NOT NULL,
    "Addr1_Building Name" character varying NOT NULL,
    "Addr1_House No." character varying NOT NULL,
    "Addr1_City" text NOT NULL,
    "Addr1_Postcode" integer NOT NULL,
    "Addr1_Country" text NOT NULL,
    "Addr2_Street Name" character varying,
    "Addr2_Building Name" character varying,
    "Addr2_House No." character varying,
    "Addr2_City" text,
    "Addr2_Postcode" integer,
    "Addr2_Country" text
);
 '   DROP TABLE public."Emp_address_table";
       public         heap    postgres    false            ?            1259    16471    Emp_type    TABLE     n   CREATE TABLE public."Emp_type" (
    "Emp_Type_ID" integer NOT NULL,
    "Type_of_employee " text NOT NULL
);
    DROP TABLE public."Emp_type";
       public         heap    postgres    false            ?            1259    16464    Employee_Performance_table    TABLE     c  CREATE TABLE public."Employee_Performance_table" (
    "Emp_Performance_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Emp_rating" character varying,
    "Job_Role" text NOT NULL,
    "Last_Promotion" date,
    "Remarks" text,
    "Manager_rating" character varying,
    "Performance_creation_Timestamp" time without time zone NOT NULL
);
 0   DROP TABLE public."Employee_Performance_table";
       public         heap    postgres    false            ?            1259    16405    Employee_Personal_table    TABLE       CREATE TABLE public."Employee_Personal_table" (
    "Emp_personal_ID" integer NOT NULL,
    "Employee_ID" integer NOT NULL,
    "Marital_status" text,
    "Qualification" character varying NOT NULL,
    "Last_employer" character varying NOT NULL,
    "Last_employer_address" character varying,
    "Last_employer_contact" character varying,
    "Previous_role" text NOT NULL,
    "Tax_ID" character varying NOT NULL,
    "Date_of_birth" date NOT NULL,
    "Nationality" character varying NOT NULL,
    "Blood_group" character varying
);
 -   DROP TABLE public."Employee_Personal_table";
       public         heap    postgres    false            ?            1259    16395    Employee_table    TABLE     *  CREATE TABLE public."Employee_table" (
    "Employee_ID" integer NOT NULL,
    "Job_Role_ID" integer NOT NULL,
    "First_Name" text NOT NULL,
    "Middle_Name" text,
    "Last_Name" text NOT NULL,
    "Email" character varying NOT NULL,
    "Mobile" character varying NOT NULL,
    "Date_of_joining" date NOT NULL,
    "Date_of_leaving" date,
    "Type_of_employee" text NOT NULL,
    "Manager_ID" integer NOT NULL,
    "Gender" text NOT NULL,
    "Accrued_leaves" integer NOT NULL,
    "Shift_code" integer NOT NULL,
    "Dept_no." integer NOT NULL
);
 $   DROP TABLE public."Employee_table";
       public         heap    postgres    false            ?            1259    16476    Job_Postings_Recruitment_table    TABLE     5  CREATE TABLE public."Job_Postings_Recruitment_table" (
    "Dept_no." integer NOT NULL,
    "Job_dept." character varying NOT NULL,
    "Job_Role" character varying NOT NULL,
    "Job_Desc" text,
    "Min_salary" character varying,
    "Max_salary" character varying,
    "Job_Posting_ID" integer NOT NULL
);
 4   DROP TABLE public."Job_Postings_Recruitment_table";
       public         heap    postgres    false            ?            1259    16436 	   Job_table    TABLE       CREATE TABLE public."Job_table" (
    "Job_ID" integer NOT NULL,
    "Job_creation_timestamp" timestamp without time zone NOT NULL,
    "Job_updated_on" date NOT NULL,
    "Job_description" text,
    "Dept_no." integer NOT NULL,
    "Active/Inactive" text NOT NULL
);
    DROP TABLE public."Job_table";
       public         heap    postgres    false            ?            1259    16483    New_Applicant_Track_table    TABLE     /  CREATE TABLE public."New_Applicant_Track_table" (
    "Application_ID" integer NOT NULL,
    "Applicant_FirstName" text NOT NULL,
    "Applicant_MiddleName" text,
    "Applicant_LastName" text NOT NULL,
    "Applicant_email" character varying NOT NULL,
    "Applicant_Years_of_Exp" character varying
);
 /   DROP TABLE public."New_Applicant_Track_table";
       public         heap    postgres    false            ?          0    16527    Bank_Account 
   TABLE DATA           ?   COPY public."Bank_Account" ("Bank_acc_ID", "Bank_Account_No", "Salary_ID", "Bank_Name", "Bank_IFSC", "Bank_Location") FROM stdin;
    public          postgres    false    227   ˏ       ?          0    16505 	   Countries 
   TABLE DATA           E   COPY public."Countries" ("Country_ID	", "Country_name	") FROM stdin;
    public          postgres    false    223   p?       ?          0    16491    Department_table 
   TABLE DATA           ?   COPY public."Department_table" ("Dept_no.", "Dept_Name", "Org_ID", "Dept_contact_no", "Location_ID", "Creation_Timestamp") FROM stdin;
    public          postgres    false    222   ??                 0    16422    Emp_Achievements_table 
   TABLE DATA           ?   COPY public."Emp_Achievements_table" ("Course_ID", "Employee_ID", "Date_of_Certification", "Certifications_desc", "Certification_validity") FROM stdin;
    public          postgres    false    212   8?       ?          0    16522    Emp_Bank_table 
   TABLE DATA           ?   COPY public."Emp_Bank_table" ("Emp_Bank_ID", "Employee_ID ", "Bank_acc_ID", "Bank_acc_start_date", "Bank_acc_end_date") FROM stdin;
    public          postgres    false    226   ??       ?          0    16517    Emp_Dept_table 
   TABLE DATA           ?   COPY public."Emp_Dept_table" ("Emp_Dept_ID", "Dept_no.", "Employee_ID", "Emp_dept_joining_date", "Emp_dept_leaving_date") FROM stdin;
    public          postgres    false    225   ?       ?          0    16429    Emp_Equip_Info_table 
   TABLE DATA           ?   COPY public."Emp_Equip_Info_table" ("System_ID", "Employee_ID", "Type_of_system", "Location", "Equip_info_creation_Timestamp") FROM stdin;
    public          postgres    false    213   %?       ?          0    16512    Emp_Job_table 
   TABLE DATA           r   COPY public."Emp_Job_table" ("Job_emp_ID", "Employee_ID", "Job_ID", "Job_start_date", "Job_end_date") FROM stdin;
    public          postgres    false    224   ??       ?          0    16457    Emp_Leaves_table 
   TABLE DATA           i   COPY public."Emp_Leaves_table" ("Leave_code", "Leave_Type_Desct", "No_of_Leaves_applicable") FROM stdin;
    public          postgres    false    217   В       ?          0    16612    Emp_Location_table 
   TABLE DATA           h   COPY public."Emp_Location_table" ("Location_ID", "Employee_ID", "Country_ID", "Address_ID") FROM stdin;
    public          postgres    false    228   ??       ?          0    16443    Emp_Salary_table 
   TABLE DATA             COPY public."Emp_Salary_table" ("Payroll_ID", "Employee_ID", "Bonus", "Salary_Band", "Monthly_Salary", "Annual_Salary", "Monthly_Tax _deduction", "Monthly_Insurance_deductions", "Monthly_Pension_deductions", "PF_contribution", "Salary_creation_timestamp") FROM stdin;
    public          postgres    false    215   L?       ?          0    16450    Emp_Timesheet_table 
   TABLE DATA           ?   COPY public."Emp_Timesheet_table" ("Timesheet_ID", "Employee_ID", "Timesheet_code", "Project_ID", "Shift_code", "Billable_hours", "Leave_code", "Leave_hours", "Timesheet_creation_timestamp") FROM stdin;
    public          postgres    false    216   ??       ~          0    16415    Emp_address_table 
   TABLE DATA           *  COPY public."Emp_address_table" ("Address_ID", "Employee_ID", "Addr1_Street Name", "Addr1_Building Name", "Addr1_House No.", "Addr1_City", "Addr1_Postcode", "Addr1_Country", "Addr2_Street Name", "Addr2_Building Name", "Addr2_House No.", "Addr2_City", "Addr2_Postcode", "Addr2_Country") FROM stdin;
    public          postgres    false    211   c?       ?          0    16471    Emp_type 
   TABLE DATA           H   COPY public."Emp_type" ("Emp_Type_ID", "Type_of_employee ") FROM stdin;
    public          postgres    false    219   ?       ?          0    16464    Employee_Performance_table 
   TABLE DATA           ?   COPY public."Employee_Performance_table" ("Emp_Performance_ID", "Employee_ID", "Emp_rating", "Job_Role", "Last_Promotion", "Remarks", "Manager_rating", "Performance_creation_Timestamp") FROM stdin;
    public          postgres    false    218   3?       }          0    16405    Employee_Personal_table 
   TABLE DATA             COPY public."Employee_Personal_table" ("Emp_personal_ID", "Employee_ID", "Marital_status", "Qualification", "Last_employer", "Last_employer_address", "Last_employer_contact", "Previous_role", "Tax_ID", "Date_of_birth", "Nationality", "Blood_group") FROM stdin;
    public          postgres    false    210   P?       |          0    16395    Employee_table 
   TABLE DATA             COPY public."Employee_table" ("Employee_ID", "Job_Role_ID", "First_Name", "Middle_Name", "Last_Name", "Email", "Mobile", "Date_of_joining", "Date_of_leaving", "Type_of_employee", "Manager_ID", "Gender", "Accrued_leaves", "Shift_code", "Dept_no.") FROM stdin;
    public          postgres    false    209   ??       ?          0    16476    Job_Postings_Recruitment_table 
   TABLE DATA           ?   COPY public."Job_Postings_Recruitment_table" ("Dept_no.", "Job_dept.", "Job_Role", "Job_Desc", "Min_salary", "Max_salary", "Job_Posting_ID") FROM stdin;
    public          postgres    false    220   6?       ?          0    16436 	   Job_table 
   TABLE DATA           ?   COPY public."Job_table" ("Job_ID", "Job_creation_timestamp", "Job_updated_on", "Job_description", "Dept_no.", "Active/Inactive") FROM stdin;
    public          postgres    false    214   S?       ?          0    16483    New_Applicant_Track_table 
   TABLE DATA           ?   COPY public."New_Applicant_Track_table" ("Application_ID", "Applicant_FirstName", "Applicant_MiddleName", "Applicant_LastName", "Applicant_email", "Applicant_Years_of_Exp") FROM stdin;
    public          postgres    false    221   p?       ?           2606    16533    Bank_Account Bank_Account_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Bank_Account"
    ADD CONSTRAINT "Bank_Account_pkey" PRIMARY KEY ("Bank_acc_ID");
 L   ALTER TABLE ONLY public."Bank_Account" DROP CONSTRAINT "Bank_Account_pkey";
       public            postgres    false    227            ?           2606    16511    Countries Countries_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Countries"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY ("Country_ID	");
 F   ALTER TABLE ONLY public."Countries" DROP CONSTRAINT "Countries_pkey";
       public            postgres    false    223            ?           2606    16497 &   Department_table Department_table_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Department_table"
    ADD CONSTRAINT "Department_table_pkey" PRIMARY KEY ("Dept_no.");
 T   ALTER TABLE ONLY public."Department_table" DROP CONSTRAINT "Department_table_pkey";
       public            postgres    false    222            ?           2606    16428 2   Emp_Achievements_table Emp_Achievements_table_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."Emp_Achievements_table"
    ADD CONSTRAINT "Emp_Achievements_table_pkey" PRIMARY KEY ("Course_ID");
 `   ALTER TABLE ONLY public."Emp_Achievements_table" DROP CONSTRAINT "Emp_Achievements_table_pkey";
       public            postgres    false    212            ?           2606    16526 "   Emp_Bank_table Emp_Bank_table_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Emp_Bank_table"
    ADD CONSTRAINT "Emp_Bank_table_pkey" PRIMARY KEY ("Emp_Bank_ID");
 P   ALTER TABLE ONLY public."Emp_Bank_table" DROP CONSTRAINT "Emp_Bank_table_pkey";
       public            postgres    false    226            ?           2606    16521 "   Emp_Dept_table Emp_Dept_table_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Emp_Dept_table"
    ADD CONSTRAINT "Emp_Dept_table_pkey" PRIMARY KEY ("Emp_Dept_ID");
 P   ALTER TABLE ONLY public."Emp_Dept_table" DROP CONSTRAINT "Emp_Dept_table_pkey";
       public            postgres    false    225            ?           2606    16435 .   Emp_Equip_Info_table Emp_Equip_Info_table_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public."Emp_Equip_Info_table"
    ADD CONSTRAINT "Emp_Equip_Info_table_pkey" PRIMARY KEY ("System_ID");
 \   ALTER TABLE ONLY public."Emp_Equip_Info_table" DROP CONSTRAINT "Emp_Equip_Info_table_pkey";
       public            postgres    false    213            ?           2606    16516     Emp_Job_table Emp_Job_table_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Emp_Job_table"
    ADD CONSTRAINT "Emp_Job_table_pkey" PRIMARY KEY ("Job_emp_ID");
 N   ALTER TABLE ONLY public."Emp_Job_table" DROP CONSTRAINT "Emp_Job_table_pkey";
       public            postgres    false    224            ?           2606    16463 &   Emp_Leaves_table Emp_Leaves_table_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Emp_Leaves_table"
    ADD CONSTRAINT "Emp_Leaves_table_pkey" PRIMARY KEY ("Leave_code");
 T   ALTER TABLE ONLY public."Emp_Leaves_table" DROP CONSTRAINT "Emp_Leaves_table_pkey";
       public            postgres    false    217            ?           2606    16616 *   Emp_Location_table Emp_Location_table_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT "Emp_Location_table_pkey" PRIMARY KEY ("Location_ID");
 X   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT "Emp_Location_table_pkey";
       public            postgres    false    228            ?           2606    16449 &   Emp_Salary_table Emp_Salary_table_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Emp_Salary_table"
    ADD CONSTRAINT "Emp_Salary_table_pkey" PRIMARY KEY ("Payroll_ID");
 T   ALTER TABLE ONLY public."Emp_Salary_table" DROP CONSTRAINT "Emp_Salary_table_pkey";
       public            postgres    false    215            ?           2606    16456 ,   Emp_Timesheet_table Emp_Timesheet_table_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT "Emp_Timesheet_table_pkey" PRIMARY KEY ("Timesheet_ID");
 Z   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT "Emp_Timesheet_table_pkey";
       public            postgres    false    216            ?           2606    16421 (   Emp_address_table Emp_address_table_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Emp_address_table"
    ADD CONSTRAINT "Emp_address_table_pkey" PRIMARY KEY ("Address_ID");
 V   ALTER TABLE ONLY public."Emp_address_table" DROP CONSTRAINT "Emp_address_table_pkey";
       public            postgres    false    211            ?           2606    16470 :   Employee_Performance_table Employee_Performance_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Performance_table"
    ADD CONSTRAINT "Employee_Performance_table_pkey" PRIMARY KEY ("Emp_Performance_ID");
 h   ALTER TABLE ONLY public."Employee_Performance_table" DROP CONSTRAINT "Employee_Performance_table_pkey";
       public            postgres    false    218            ?           2606    16411 4   Employee_Personal_table Employee_Personal_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Personal_table"
    ADD CONSTRAINT "Employee_Personal_table_pkey" PRIMARY KEY ("Emp_personal_ID");
 b   ALTER TABLE ONLY public."Employee_Personal_table" DROP CONSTRAINT "Employee_Personal_table_pkey";
       public            postgres    false    210            ?           2606    16401 "   Employee_table Employee_table_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Employee_table"
    ADD CONSTRAINT "Employee_table_pkey" PRIMARY KEY ("Employee_ID");
 P   ALTER TABLE ONLY public."Employee_table" DROP CONSTRAINT "Employee_table_pkey";
       public            postgres    false    209            ?           2606    16872 B   Job_Postings_Recruitment_table Job_Postings_Recruitment_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Job_Postings_Recruitment_table"
    ADD CONSTRAINT "Job_Postings_Recruitment_table_pkey" PRIMARY KEY ("Job_Posting_ID");
 p   ALTER TABLE ONLY public."Job_Postings_Recruitment_table" DROP CONSTRAINT "Job_Postings_Recruitment_table_pkey";
       public            postgres    false    220            ?           2606    16442    Job_table Job_table_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Job_table"
    ADD CONSTRAINT "Job_table_pkey" PRIMARY KEY ("Job_ID");
 F   ALTER TABLE ONLY public."Job_table" DROP CONSTRAINT "Job_table_pkey";
       public            postgres    false    214            ?           2606    16489 8   New_Applicant_Track_table New_Applicant_Track_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."New_Applicant_Track_table"
    ADD CONSTRAINT "New_Applicant_Track_table_pkey" PRIMARY KEY ("Application_ID");
 f   ALTER TABLE ONLY public."New_Applicant_Track_table" DROP CONSTRAINT "New_Applicant_Track_table_pkey";
       public            postgres    false    221            ?           1259    16605    fki_e    INDEX     L   CREATE INDEX fki_e ON public."Emp_Bank_table" USING btree ("Employee_ID ");
    DROP INDEX public.fki_e;
       public            postgres    false    226            ?           1259    16551    fki_fk_achie_emp    INDEX     ^   CREATE INDEX fki_fk_achie_emp ON public."Emp_Achievements_table" USING btree ("Employee_ID");
 $   DROP INDEX public.fki_fk_achie_emp;
       public            postgres    false    212            ?           1259    16545    fki_fk_add_emp    INDEX     W   CREATE INDEX fki_fk_add_emp ON public."Emp_address_table" USING btree ("Employee_ID");
 "   DROP INDEX public.fki_fk_add_emp;
       public            postgres    false    211            ?           1259    16611    fki_fk_empbank_bankacc    INDEX     \   CREATE INDEX fki_fk_empbank_bankacc ON public."Emp_Bank_table" USING btree ("Bank_acc_ID");
 *   DROP INDEX public.fki_fk_empbank_bankacc;
       public            postgres    false    226            ?           1259    16599    fki_fk_empdept_dept    INDEX     V   CREATE INDEX fki_fk_empdept_dept ON public."Emp_Dept_table" USING btree ("Dept_no.");
 '   DROP INDEX public.fki_fk_empdept_dept;
       public            postgres    false    225            ?           1259    16593    fki_fk_empdept_emp    INDEX     X   CREATE INDEX fki_fk_empdept_emp ON public."Emp_Dept_table" USING btree ("Employee_ID");
 &   DROP INDEX public.fki_fk_empdept_emp;
       public            postgres    false    225            ?           1259    16575    fki_fk_empjob_emp    INDEX     V   CREATE INDEX fki_fk_empjob_emp ON public."Emp_Job_table" USING btree ("Employee_ID");
 %   DROP INDEX public.fki_fk_empjob_emp;
       public            postgres    false    224            ?           1259    16581    fki_fk_empjob_job    INDEX     Q   CREATE INDEX fki_fk_empjob_job ON public."Emp_Job_table" USING btree ("Job_ID");
 %   DROP INDEX public.fki_fk_empjob_job;
       public            postgres    false    224            ?           1259    16622    fki_fk_emploc_coun    INDEX     [   CREATE INDEX fki_fk_emploc_coun ON public."Emp_Location_table" USING btree ("Country_ID");
 &   DROP INDEX public.fki_fk_emploc_coun;
       public            postgres    false    228            ?           1259    16628    fki_fk_emploc_emp    INDEX     [   CREATE INDEX fki_fk_emploc_emp ON public."Emp_Location_table" USING btree ("Employee_ID");
 %   DROP INDEX public.fki_fk_emploc_emp;
       public            postgres    false    228            ?           1259    16634    fki_fk_emploc_empadd    INDEX     ]   CREATE INDEX fki_fk_emploc_empadd ON public."Emp_Location_table" USING btree ("Address_ID");
 (   DROP INDEX public.fki_fk_emploc_empadd;
       public            postgres    false    228            ?           1259    16557    fki_fk_equip_emp    INDEX     \   CREATE INDEX fki_fk_equip_emp ON public."Emp_Equip_Info_table" USING btree ("Employee_ID");
 $   DROP INDEX public.fki_fk_equip_emp;
       public            postgres    false    213            ?           1259    16878    fki_fk_job_dept    INDEX     M   CREATE INDEX fki_fk_job_dept ON public."Job_table" USING btree ("Dept_no.");
 #   DROP INDEX public.fki_fk_job_dept;
       public            postgres    false    214            ?           1259    16868    fki_fk_jobpostrecr_dept    INDEX     j   CREATE INDEX fki_fk_jobpostrecr_dept ON public."Job_Postings_Recruitment_table" USING btree ("Dept_no.");
 +   DROP INDEX public.fki_fk_jobpostrecr_dept;
       public            postgres    false    220            ?           1259    16563    fki_fk_perfor_emp    INDEX     c   CREATE INDEX fki_fk_perfor_emp ON public."Employee_Performance_table" USING btree ("Employee_ID");
 %   DROP INDEX public.fki_fk_perfor_emp;
       public            postgres    false    218            ?           1259    16539    fki_fk_personal_emp    INDEX     b   CREATE INDEX fki_fk_personal_emp ON public."Employee_Personal_table" USING btree ("Employee_ID");
 '   DROP INDEX public.fki_fk_personal_emp;
       public            postgres    false    210            ?           1259    16587    fki_fk_sal_emp    INDEX     V   CREATE INDEX fki_fk_sal_emp ON public."Emp_Salary_table" USING btree ("Employee_ID");
 "   DROP INDEX public.fki_fk_sal_emp;
       public            postgres    false    215            ?           1259    16569    fki_fk_timesheet_emp    INDEX     _   CREATE INDEX fki_fk_timesheet_emp ON public."Emp_Timesheet_table" USING btree ("Employee_ID");
 (   DROP INDEX public.fki_fk_timesheet_emp;
       public            postgres    false    216            ?           2606    16546 #   Emp_Achievements_table fk_achie_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Achievements_table"
    ADD CONSTRAINT fk_achie_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 O   ALTER TABLE ONLY public."Emp_Achievements_table" DROP CONSTRAINT fk_achie_emp;
       public          postgres    false    3240    212    209            ?           2606    16540    Emp_address_table fk_add_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_address_table"
    ADD CONSTRAINT fk_add_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 H   ALTER TABLE ONLY public."Emp_address_table" DROP CONSTRAINT fk_add_emp;
       public          postgres    false    3240    209    211            ?           2606    16606 !   Emp_Bank_table fk_empbank_bankacc    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Bank_table"
    ADD CONSTRAINT fk_empbank_bankacc FOREIGN KEY ("Bank_acc_ID") REFERENCES public."Bank_Account"("Bank_acc_ID");
 M   ALTER TABLE ONLY public."Emp_Bank_table" DROP CONSTRAINT fk_empbank_bankacc;
       public          postgres    false    227    3289    226            ?           2606    16600    Emp_Bank_table fk_empbank_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Bank_table"
    ADD CONSTRAINT fk_empbank_emp FOREIGN KEY ("Employee_ID ") REFERENCES public."Employee_table"("Employee_ID");
 I   ALTER TABLE ONLY public."Emp_Bank_table" DROP CONSTRAINT fk_empbank_emp;
       public          postgres    false    209    226    3240            ?           2606    16594    Emp_Dept_table fk_empdept_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Dept_table"
    ADD CONSTRAINT fk_empdept_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 J   ALTER TABLE ONLY public."Emp_Dept_table" DROP CONSTRAINT fk_empdept_dept;
       public          postgres    false    222    3273    225            ?           2606    16588    Emp_Dept_table fk_empdept_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Dept_table"
    ADD CONSTRAINT fk_empdept_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 I   ALTER TABLE ONLY public."Emp_Dept_table" DROP CONSTRAINT fk_empdept_emp;
       public          postgres    false    225    209    3240            ?           2606    16570    Emp_Job_table fk_empjob_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Job_table"
    ADD CONSTRAINT fk_empjob_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 G   ALTER TABLE ONLY public."Emp_Job_table" DROP CONSTRAINT fk_empjob_emp;
       public          postgres    false    224    209    3240            ?           2606    16576    Emp_Job_table fk_empjob_job    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Job_table"
    ADD CONSTRAINT fk_empjob_job FOREIGN KEY ("Job_ID") REFERENCES public."Job_table"("Job_ID");
 G   ALTER TABLE ONLY public."Emp_Job_table" DROP CONSTRAINT fk_empjob_job;
       public          postgres    false    214    224    3254            ?           2606    16617 !   Emp_Location_table fk_emploc_coun    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_coun FOREIGN KEY ("Country_ID") REFERENCES public."Countries"("Country_ID	");
 M   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_coun;
       public          postgres    false    3275    223    228            ?           2606    16623     Emp_Location_table fk_emploc_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 L   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_emp;
       public          postgres    false    209    3240    228            ?           2606    16629 #   Emp_Location_table fk_emploc_empadd    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_empadd FOREIGN KEY ("Address_ID") REFERENCES public."Emp_address_table"("Address_ID");
 O   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_empadd;
       public          postgres    false    228    211    3245            ?           2606    16552 !   Emp_Equip_Info_table fk_equip_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Equip_Info_table"
    ADD CONSTRAINT fk_equip_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 M   ALTER TABLE ONLY public."Emp_Equip_Info_table" DROP CONSTRAINT fk_equip_emp;
       public          postgres    false    3240    209    213            ?           2606    16873    Job_table fk_job_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Job_table"
    ADD CONSTRAINT fk_job_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 A   ALTER TABLE ONLY public."Job_table" DROP CONSTRAINT fk_job_dept;
       public          postgres    false    222    214    3273            ?           2606    16863 2   Job_Postings_Recruitment_table fk_jobpostrecr_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Job_Postings_Recruitment_table"
    ADD CONSTRAINT fk_jobpostrecr_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 ^   ALTER TABLE ONLY public."Job_Postings_Recruitment_table" DROP CONSTRAINT fk_jobpostrecr_dept;
       public          postgres    false    220    3273    222            ?           2606    16558 (   Employee_Performance_table fk_perfor_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Performance_table"
    ADD CONSTRAINT fk_perfor_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 T   ALTER TABLE ONLY public."Employee_Performance_table" DROP CONSTRAINT fk_perfor_emp;
       public          postgres    false    3240    209    218            ?           2606    16534 '   Employee_Personal_table fk_personal_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Personal_table"
    ADD CONSTRAINT fk_personal_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 S   ALTER TABLE ONLY public."Employee_Personal_table" DROP CONSTRAINT fk_personal_emp;
       public          postgres    false    209    3240    210            ?           2606    16582    Emp_Salary_table fk_sal_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Salary_table"
    ADD CONSTRAINT fk_sal_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 G   ALTER TABLE ONLY public."Emp_Salary_table" DROP CONSTRAINT fk_sal_emp;
       public          postgres    false    215    3240    209            ?           2606    16564 $   Emp_Timesheet_table fk_timesheet_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT fk_timesheet_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 P   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT fk_timesheet_emp;
       public          postgres    false    216    3240    209            ?   ?   x?}?1?0@??9'@??$?Ze@Bl?,EDP???p?!???Yp	,T z??n?'0K`??8Ϗ6?]?l4(????:??J????`??B^4?tk?k?ܕ?Ѭ4n?+L?Eq?z\h??`????4?1y????0*.|?;??i      ?   3   x?34?tO-?M̫?24???K?L?24?t,-.)1M9݊??S?b???? 0?g      ?   u   x?3???440?453BNS ????\??X??D???
???8=C??q?3?NM.-?,?D????ڒ?713?$5/1/9???C?@G?B?
?F?%?????? 4?????? ?5V         H   x?Mȹ !?s򚿉????@,+M4?wGZ?eȜ?)?,S9E?q?L?4???2?3ބs???߬??6?#?      ?   h   x?U??? ѳ???`h"?1???HO#B??B>iDe??h?E??:?@?i??erP?L4@#?9?ɗ????d??@+?]?C?	?Kvh????>0      ?      x?????? ? ?      ?   ~   x?m̻A??x?
X4??I?
.?????0	g??$??iD?& ??>??H?+??ZQ?.?Z#???f?????"?a??:8	[??E?#X???pD?9(?3??A%\?
"8?p?????nW?      ?      x?????? ? ?      ?      x?????? ? ?      ?   O   x?ι1??*?F??????q$Cd@́??@j?%???<?'y?%.??[܁N󈇄y?K???G??t#??E?Z??      ?   ?   x????? ?3L?????3K????w???VEJ ??'K??*U????"???|?e????v*$???????@?????*?
S?&rm??]-??.ŁR??CYe?NY??A??ύݮz?|vs??@???.5???7??????(̮?eW???uR?{??	?c?      ?   W   x?m??	 1D??X̢??ib+H?u,??A?p?(??Vֻ???????X)?}???t??e/0yف??c?????#"oX;x      ~   ?   x???=?0@??9????0?ڥ*??z{?C-?PKOo??Z?p?\/=? ???'M3?t??c[a8?dS'4??v??4??Ot?׍???G?E??$?*pf?7??E0*pe\;F?՟o?+?p0Ƽ٘??      ?   "   x?32?L+??Q(??M?22?,H,*?pb???? ?6?      ?      x?????? ? ?      }   (  x????N?0???U?-mi??? ??čf?a??P?߶S`??U???rr?(!?B[C??y?/FxI?!ú?f?C??????q +?Z?????]Y$?M@)s$?$wٖ?V??$[??##??j???|)*??ph?"w"??<M??8???????lg,:Y24?ٲ?p????'??ZbEIG?k??DE?L?QrEŎ??T??m?hoi$?K????????fi_???Ӡy?uG?[?i?	????????̘KM?I??????'??Ȉ?(?Ԓ??^s?~??y???f/?o? ?2??V      |   ?  x?u?;o?0????Ș
??ĭ^??A?"B;e??lHXbYJ??;?.mW???}??BH?JI?»??9Х??<`쯟^?4WN?J[??W??????s?_Lq????{:	 ?XI?T?W??b?7~?}?-?H???:S??8?ε?Еgw{?:44t[L?\?;??f?ne?K.?????,??Ef?a???u?R?p ???q?o?u??N?:+?9iX?=?=֛8???=?<??i????-???bҧ&??
j??fO??>b??????,?M??Og?o??X??w??B?q?G??vY`???Xd?1?8N?*ġ_?h0-?Z?p>??!???-{???9???+.?e?c????x?!B,?"hN?1??????&z????/??$???۳??lق?Uz?^?V ?V??      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     