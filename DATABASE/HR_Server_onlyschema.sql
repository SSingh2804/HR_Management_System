PGDMP     0                    z        	   HR_Server    14.3    14.3 j    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394 	   HR_Server    DATABASE     o   CREATE DATABASE "HR_Server" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "HR_Server";
                postgres    false            ?            1259    16527    Bank_Account_table    TABLE       CREATE TABLE public."Bank_Account_table" (
    "Bank_acc_ID" integer NOT NULL,
    "Bank_Account_No" character varying NOT NULL,
    "Salary_ID" integer NOT NULL,
    "Bank_Name" text NOT NULL,
    "Bank_IBAN" character varying NOT NULL,
    "Bank_Location" character varying
);
 (   DROP TABLE public."Bank_Account_table";
       public         heap    postgres    false            ?            1259    16505    Countries_table    TABLE     q   CREATE TABLE public."Countries_table" (
    "Country_ID	" integer NOT NULL,
    "Country_name	" text NOT NULL
);
 %   DROP TABLE public."Countries_table";
       public         heap    postgres    false            ?            1259    16906 #   Department_Recruitment_Applications    TABLE       CREATE TABLE public."Department_Recruitment_Applications" (
    "Dep_Recruitment_App_ID" integer NOT NULL,
    "Application_ID" integer,
    "Dept_no." integer,
    "Job_Posting_ID" integer,
    "Application_creation_Timestamp" timestamp without time zone
);
 9   DROP TABLE public."Department_Recruitment_Applications";
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
    "Emp_Achievement_ID" integer NOT NULL,
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
       public         heap    postgres    false            ?            1259    16429    Emp_Equip_Info_table    TABLE       CREATE TABLE public."Emp_Equip_Info_table" (
    "Emp_Equip_ID" character varying NOT NULL,
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
       public         heap    postgres    false            ?            1259    16443    Emp_Salary_table    TABLE     :  CREATE TABLE public."Emp_Salary_table" (
    "Salary_ID" integer NOT NULL,
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
    "Leave_hours" character varying,
    "Timesheet_creation_timestamp" timestamp without time zone,
    "Leave_code" character varying(255)
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
       public         heap    postgres    false            ?            1259    16395    Employee_table    TABLE       CREATE TABLE public."Employee_table" (
    "Employee_ID" integer NOT NULL,
    "Job_ID" integer NOT NULL,
    "First_Name" text NOT NULL,
    "Middle_Name" text,
    "Last_Name" text NOT NULL,
    "Email" character varying NOT NULL,
    "Mobile" character varying NOT NULL,
    "Date_of_joining" date NOT NULL,
    "Date_of_leaving" date,
    "Manager_ID" integer NOT NULL,
    "Gender" text NOT NULL,
    "Accrued_leaves" integer NOT NULL,
    "Shift_code" integer NOT NULL,
    "Dept_no." integer NOT NULL,
    "Emp_Type_ID " integer
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
       public         heap    postgres    false            ?           2606    16533 $   Bank_Account_table Bank_Account_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Bank_Account_table"
    ADD CONSTRAINT "Bank_Account_pkey" PRIMARY KEY ("Bank_acc_ID");
 R   ALTER TABLE ONLY public."Bank_Account_table" DROP CONSTRAINT "Bank_Account_pkey";
       public            postgres    false    227            ?           2606    16511    Countries_table Countries_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Countries_table"
    ADD CONSTRAINT "Countries_pkey" PRIMARY KEY ("Country_ID	");
 L   ALTER TABLE ONLY public."Countries_table" DROP CONSTRAINT "Countries_pkey";
       public            postgres    false    223            ?           2606    16910 L   Department_Recruitment_Applications Department_Recruitment_Applications_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Department_Recruitment_Applications"
    ADD CONSTRAINT "Department_Recruitment_Applications_pkey" PRIMARY KEY ("Dep_Recruitment_App_ID");
 z   ALTER TABLE ONLY public."Department_Recruitment_Applications" DROP CONSTRAINT "Department_Recruitment_Applications_pkey";
       public            postgres    false    229            ?           2606    16497 &   Department_table Department_table_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Department_table"
    ADD CONSTRAINT "Department_table_pkey" PRIMARY KEY ("Dept_no.");
 T   ALTER TABLE ONLY public."Department_table" DROP CONSTRAINT "Department_table_pkey";
       public            postgres    false    222            ?           2606    16428 2   Emp_Achievements_table Emp_Achievements_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Achievements_table"
    ADD CONSTRAINT "Emp_Achievements_table_pkey" PRIMARY KEY ("Emp_Achievement_ID");
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
   CONSTRAINT     |   ALTER TABLE ONLY public."Emp_Equip_Info_table"
    ADD CONSTRAINT "Emp_Equip_Info_table_pkey" PRIMARY KEY ("Emp_Equip_ID");
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
   CONSTRAINT     q   ALTER TABLE ONLY public."Emp_Salary_table"
    ADD CONSTRAINT "Emp_Salary_table_pkey" PRIMARY KEY ("Salary_ID");
 T   ALTER TABLE ONLY public."Emp_Salary_table" DROP CONSTRAINT "Emp_Salary_table_pkey";
       public            postgres    false    215            ?           2606    16456 ,   Emp_Timesheet_table Emp_Timesheet_table_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT "Emp_Timesheet_table_pkey" PRIMARY KEY ("Timesheet_ID");
 Z   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT "Emp_Timesheet_table_pkey";
       public            postgres    false    216            ?           2606    16421 (   Emp_address_table Emp_address_table_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Emp_address_table"
    ADD CONSTRAINT "Emp_address_table_pkey" PRIMARY KEY ("Address_ID");
 V   ALTER TABLE ONLY public."Emp_address_table" DROP CONSTRAINT "Emp_address_table_pkey";
       public            postgres    false    211            ?           2606    16930    Emp_type Emp_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Emp_type"
    ADD CONSTRAINT "Emp_type_pkey" PRIMARY KEY ("Emp_Type_ID");
 D   ALTER TABLE ONLY public."Emp_type" DROP CONSTRAINT "Emp_type_pkey";
       public            postgres    false    219            ?           2606    16470 :   Employee_Performance_table Employee_Performance_table_pkey 
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
       public            postgres    false    221            ?           2606    16976    Bank_Account_table uk_bankaccid 
   CONSTRAINT     e   ALTER TABLE ONLY public."Bank_Account_table"
    ADD CONSTRAINT uk_bankaccid UNIQUE ("Bank_acc_ID");
 K   ALTER TABLE ONLY public."Bank_Account_table" DROP CONSTRAINT uk_bankaccid;
       public            postgres    false    227            ?           2606    16955    Countries_table uk_counid 
   CONSTRAINT     _   ALTER TABLE ONLY public."Countries_table"
    ADD CONSTRAINT uk_counid UNIQUE ("Country_ID	");
 E   ALTER TABLE ONLY public."Countries_table" DROP CONSTRAINT uk_counid;
       public            postgres    false    223            ?           2606    16947    Employee_table uk_emp_email 
   CONSTRAINT     [   ALTER TABLE ONLY public."Employee_table"
    ADD CONSTRAINT uk_emp_email UNIQUE ("Email");
 G   ALTER TABLE ONLY public."Employee_table" DROP CONSTRAINT uk_emp_email;
       public            postgres    false    209            ?           2606    16957     Emp_Equip_Info_table uk_empequip 
   CONSTRAINT     g   ALTER TABLE ONLY public."Emp_Equip_Info_table"
    ADD CONSTRAINT uk_empequip UNIQUE ("Emp_Equip_ID");
 L   ALTER TABLE ONLY public."Emp_Equip_Info_table" DROP CONSTRAINT uk_empequip;
       public            postgres    false    213            ?           2606    16945    Employee_table uk_empid 
   CONSTRAINT     u   ALTER TABLE ONLY public."Employee_table"
    ADD CONSTRAINT uk_empid UNIQUE ("Employee_ID") INCLUDE ("Employee_ID");
 C   ALTER TABLE ONLY public."Employee_table" DROP CONSTRAINT uk_empid;
       public            postgres    false    209            ?           2606    16974    Emp_Location_table uk_loc 
   CONSTRAINT     _   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT uk_loc UNIQUE ("Location_ID");
 E   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT uk_loc;
       public            postgres    false    228            ?           2606    16959    Emp_Salary_table uk_salaryid 
   CONSTRAINT     `   ALTER TABLE ONLY public."Emp_Salary_table"
    ADD CONSTRAINT uk_salaryid UNIQUE ("Salary_ID");
 H   ALTER TABLE ONLY public."Emp_Salary_table" DROP CONSTRAINT uk_salaryid;
       public            postgres    false    215            ?           2606    16949     Employee_Personal_table uk_taxid 
   CONSTRAINT     a   ALTER TABLE ONLY public."Employee_Personal_table"
    ADD CONSTRAINT uk_taxid UNIQUE ("Tax_ID");
 L   ALTER TABLE ONLY public."Employee_Personal_table" DROP CONSTRAINT uk_taxid;
       public            postgres    false    210            ?           2606    16978 "   Emp_Timesheet_table uk_timesheetid 
   CONSTRAINT     i   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT uk_timesheetid UNIQUE ("Timesheet_ID");
 N   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT uk_timesheetid;
       public            postgres    false    216            ?           1259    16605    fki_e    INDEX     L   CREATE INDEX fki_e ON public."Emp_Bank_table" USING btree ("Employee_ID ");
    DROP INDEX public.fki_e;
       public            postgres    false    226            ?           1259    16551    fki_fk_achie_emp    INDEX     ^   CREATE INDEX fki_fk_achie_emp ON public."Emp_Achievements_table" USING btree ("Employee_ID");
 $   DROP INDEX public.fki_fk_achie_emp;
       public            postgres    false    212            ?           1259    16545    fki_fk_add_emp    INDEX     W   CREATE INDEX fki_fk_add_emp ON public."Emp_address_table" USING btree ("Employee_ID");
 "   DROP INDEX public.fki_fk_add_emp;
       public            postgres    false    211            ?           1259    16965    fki_fk_bankacc_empsal    INDEX     ]   CREATE INDEX fki_fk_bankacc_empsal ON public."Bank_Account_table" USING btree ("Salary_ID");
 )   DROP INDEX public.fki_fk_bankacc_empsal;
       public            postgres    false    227            ?           1259    16922    fki_fk_deptrecapp_dept    INDEX     n   CREATE INDEX fki_fk_deptrecapp_dept ON public."Department_Recruitment_Applications" USING btree ("Dept_no.");
 *   DROP INDEX public.fki_fk_deptrecapp_dept;
       public            postgres    false    229            ?           1259    16928    fki_fk_deptrecapp_jobposrec    INDEX     y   CREATE INDEX fki_fk_deptrecapp_jobposrec ON public."Department_Recruitment_Applications" USING btree ("Job_Posting_ID");
 /   DROP INDEX public.fki_fk_deptrecapp_jobposrec;
       public            postgres    false    229            ?           1259    16916    fki_fk_deptrecapp_newapptra    INDEX     y   CREATE INDEX fki_fk_deptrecapp_newapptra ON public."Department_Recruitment_Applications" USING btree ("Application_ID");
 /   DROP INDEX public.fki_fk_deptrecapp_newapptra;
       public            postgres    false    229            ?           1259    16936    fki_fk_emp_emptype    INDEX     Y   CREATE INDEX fki_fk_emp_emptype ON public."Employee_table" USING btree ("Emp_Type_ID ");
 &   DROP INDEX public.fki_fk_emp_emptype;
       public            postgres    false    209            ?           1259    16984    fki_fk_emp_job    INDEX     O   CREATE INDEX fki_fk_emp_job ON public."Employee_table" USING btree ("Job_ID");
 "   DROP INDEX public.fki_fk_emp_job;
       public            postgres    false    209            ?           1259    16611    fki_fk_empbank_bankacc    INDEX     \   CREATE INDEX fki_fk_empbank_bankacc ON public."Emp_Bank_table" USING btree ("Bank_acc_ID");
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
       public            postgres    false    228            ?           1259    16942    fki_fk_emptimesh_empleav    INDEX     b   CREATE INDEX fki_fk_emptimesh_empleav ON public."Emp_Timesheet_table" USING btree ("Leave_code");
 ,   DROP INDEX public.fki_fk_emptimesh_empleav;
       public            postgres    false    216            ?           1259    16557    fki_fk_equip_emp    INDEX     \   CREATE INDEX fki_fk_equip_emp ON public."Emp_Equip_Info_table" USING btree ("Employee_ID");
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
       public            postgres    false    216                       2606    16546 #   Emp_Achievements_table fk_achie_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Achievements_table"
    ADD CONSTRAINT fk_achie_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 O   ALTER TABLE ONLY public."Emp_Achievements_table" DROP CONSTRAINT fk_achie_emp;
       public          postgres    false    212    3244    209                       2606    16540    Emp_address_table fk_add_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_address_table"
    ADD CONSTRAINT fk_add_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 H   ALTER TABLE ONLY public."Emp_address_table" DROP CONSTRAINT fk_add_emp;
       public          postgres    false    211    3244    209                       2606    16966 $   Bank_Account_table fk_bankacc_empsal    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Bank_Account_table"
    ADD CONSTRAINT fk_bankacc_empsal FOREIGN KEY ("Salary_ID") REFERENCES public."Emp_Salary_table"("Salary_ID") NOT VALID;
 P   ALTER TABLE ONLY public."Bank_Account_table" DROP CONSTRAINT fk_bankacc_empsal;
       public          postgres    false    227    3271    215                       2606    16917 6   Department_Recruitment_Applications fk_deptrecapp_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Department_Recruitment_Applications"
    ADD CONSTRAINT fk_deptrecapp_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 b   ALTER TABLE ONLY public."Department_Recruitment_Applications" DROP CONSTRAINT fk_deptrecapp_dept;
       public          postgres    false    229    222    3294                       2606    16923 ;   Department_Recruitment_Applications fk_deptrecapp_jobposrec    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Department_Recruitment_Applications"
    ADD CONSTRAINT fk_deptrecapp_jobposrec FOREIGN KEY ("Job_Posting_ID") REFERENCES public."Job_Postings_Recruitment_table"("Job_Posting_ID");
 g   ALTER TABLE ONLY public."Department_Recruitment_Applications" DROP CONSTRAINT fk_deptrecapp_jobposrec;
       public          postgres    false    229    220    3289                       2606    16911 ;   Department_Recruitment_Applications fk_deptrecapp_newapptra    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Department_Recruitment_Applications"
    ADD CONSTRAINT fk_deptrecapp_newapptra FOREIGN KEY ("Application_ID") REFERENCES public."New_Applicant_Track_table"("Application_ID");
 g   ALTER TABLE ONLY public."Department_Recruitment_Applications" DROP CONSTRAINT fk_deptrecapp_newapptra;
       public          postgres    false    221    3292    229                        2606    16931    Employee_table fk_emp_emptype    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_table"
    ADD CONSTRAINT fk_emp_emptype FOREIGN KEY ("Emp_Type_ID ") REFERENCES public."Emp_type"("Emp_Type_ID");
 I   ALTER TABLE ONLY public."Employee_table" DROP CONSTRAINT fk_emp_emptype;
       public          postgres    false    3287    219    209                       2606    16979    Employee_table fk_emp_job    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_table"
    ADD CONSTRAINT fk_emp_job FOREIGN KEY ("Job_ID") REFERENCES public."Job_table"("Job_ID") NOT VALID;
 E   ALTER TABLE ONLY public."Employee_table" DROP CONSTRAINT fk_emp_job;
       public          postgres    false    3268    209    214                       2606    16606 !   Emp_Bank_table fk_empbank_bankacc    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Bank_table"
    ADD CONSTRAINT fk_empbank_bankacc FOREIGN KEY ("Bank_acc_ID") REFERENCES public."Bank_Account_table"("Bank_acc_ID");
 M   ALTER TABLE ONLY public."Emp_Bank_table" DROP CONSTRAINT fk_empbank_bankacc;
       public          postgres    false    226    3312    227                       2606    16600    Emp_Bank_table fk_empbank_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Bank_table"
    ADD CONSTRAINT fk_empbank_emp FOREIGN KEY ("Employee_ID ") REFERENCES public."Employee_table"("Employee_ID");
 I   ALTER TABLE ONLY public."Emp_Bank_table" DROP CONSTRAINT fk_empbank_emp;
       public          postgres    false    209    226    3244                       2606    16594    Emp_Dept_table fk_empdept_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Dept_table"
    ADD CONSTRAINT fk_empdept_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 J   ALTER TABLE ONLY public."Emp_Dept_table" DROP CONSTRAINT fk_empdept_dept;
       public          postgres    false    225    3294    222                       2606    16588    Emp_Dept_table fk_empdept_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Dept_table"
    ADD CONSTRAINT fk_empdept_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 I   ALTER TABLE ONLY public."Emp_Dept_table" DROP CONSTRAINT fk_empdept_emp;
       public          postgres    false    209    3244    225                       2606    16570    Emp_Job_table fk_empjob_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Job_table"
    ADD CONSTRAINT fk_empjob_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 G   ALTER TABLE ONLY public."Emp_Job_table" DROP CONSTRAINT fk_empjob_emp;
       public          postgres    false    209    224    3244                       2606    16576    Emp_Job_table fk_empjob_job    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Job_table"
    ADD CONSTRAINT fk_empjob_job FOREIGN KEY ("Job_ID") REFERENCES public."Job_table"("Job_ID");
 G   ALTER TABLE ONLY public."Emp_Job_table" DROP CONSTRAINT fk_empjob_job;
       public          postgres    false    214    3268    224                       2606    16617 !   Emp_Location_table fk_emploc_coun    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_coun FOREIGN KEY ("Country_ID") REFERENCES public."Countries_table"("Country_ID	");
 M   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_coun;
       public          postgres    false    228    223    3296                       2606    16623     Emp_Location_table fk_emploc_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 L   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_emp;
       public          postgres    false    228    209    3244                       2606    16629 #   Emp_Location_table fk_emploc_empadd    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Location_table"
    ADD CONSTRAINT fk_emploc_empadd FOREIGN KEY ("Address_ID") REFERENCES public."Emp_address_table"("Address_ID");
 O   ALTER TABLE ONLY public."Emp_Location_table" DROP CONSTRAINT fk_emploc_empadd;
       public          postgres    false    211    3257    228            	           2606    16937 (   Emp_Timesheet_table fk_emptimesh_empleav    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT fk_emptimesh_empleav FOREIGN KEY ("Leave_code") REFERENCES public."Emp_Leaves_table"("Leave_code");
 T   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT fk_emptimesh_empleav;
       public          postgres    false    216    217    3282                       2606    16552 !   Emp_Equip_Info_table fk_equip_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Equip_Info_table"
    ADD CONSTRAINT fk_equip_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 M   ALTER TABLE ONLY public."Emp_Equip_Info_table" DROP CONSTRAINT fk_equip_emp;
       public          postgres    false    213    3244    209                       2606    16873    Job_table fk_job_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Job_table"
    ADD CONSTRAINT fk_job_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 A   ALTER TABLE ONLY public."Job_table" DROP CONSTRAINT fk_job_dept;
       public          postgres    false    222    3294    214                       2606    16863 2   Job_Postings_Recruitment_table fk_jobpostrecr_dept    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Job_Postings_Recruitment_table"
    ADD CONSTRAINT fk_jobpostrecr_dept FOREIGN KEY ("Dept_no.") REFERENCES public."Department_table"("Dept_no.");
 ^   ALTER TABLE ONLY public."Job_Postings_Recruitment_table" DROP CONSTRAINT fk_jobpostrecr_dept;
       public          postgres    false    222    3294    220            
           2606    16558 (   Employee_Performance_table fk_perfor_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Performance_table"
    ADD CONSTRAINT fk_perfor_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 T   ALTER TABLE ONLY public."Employee_Performance_table" DROP CONSTRAINT fk_perfor_emp;
       public          postgres    false    218    3244    209                       2606    16534 '   Employee_Personal_table fk_personal_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Employee_Personal_table"
    ADD CONSTRAINT fk_personal_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 S   ALTER TABLE ONLY public."Employee_Personal_table" DROP CONSTRAINT fk_personal_emp;
       public          postgres    false    210    3244    209                       2606    16582    Emp_Salary_table fk_sal_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Salary_table"
    ADD CONSTRAINT fk_sal_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 G   ALTER TABLE ONLY public."Emp_Salary_table" DROP CONSTRAINT fk_sal_emp;
       public          postgres    false    209    215    3244                       2606    16564 $   Emp_Timesheet_table fk_timesheet_emp    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Emp_Timesheet_table"
    ADD CONSTRAINT fk_timesheet_emp FOREIGN KEY ("Employee_ID") REFERENCES public."Employee_table"("Employee_ID");
 P   ALTER TABLE ONLY public."Emp_Timesheet_table" DROP CONSTRAINT fk_timesheet_emp;
       public          postgres    false    216    3244    209           