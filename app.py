from types import EllipsisType
from flask import jsonify
from flask_sqlalchemy import SQLAlchemy
from enum import unique
from threading import local
from flask import Flask,render_template,request,session,redirect,url_for,flash
from flask_login import  UserMixin
import psycopg2
from flask_login import LoginManager,login_manager
from sqlalchemy import Table, Column, Integer, ForeignKey, exists
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
import hashlib
import os

Base = declarative_base()
app = Flask(__name__)
app.secret_key = "super secret key"
login_manager=LoginManager(app)
login_manager.login_view='HRLogin'

@login_manager.user_loader
def load_user(user_userid):
    return HR_User.query.get(int(user_userid))


# postgresql://<username>:<userpassword>@localhost:5433/<databasename>
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://HR_SERVER:HR_SERVER@localhost:5432/HR_SERVER'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:shweta@localhost:5432/HR_Server'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db=SQLAlchemy(app)

# global functions
def DatabaseConnection():
      return psycopg2.connect(host="localhost", database ="HR_SERVER", user="HR_SERVER", password="HR_SERVER")

def HashFromPassword(password):
    salt = os.urandom(32) 
    hash_object = hashlib.sha256(password.encode('utf-8'))
    hex_dig = hash_object.hexdigest()
    return hex_dig

class HR_User(UserMixin, db.Model):
    __table__ = Table('HR_user', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class EmployeeLogin(db.Model):
    __table__ = Table('Employee_Login', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class Employee(db.Model):
    __table__ = Table('Employee_table', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class Employee_Type(db.Model):
    __table__ = Table('Emp_type', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class EmployeeLeaves(db.Model):
    __table__ = Table('Emp_Leaves', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class EmployeePersonal(db.Model):
    __table__ = Table('Employee_Personal_table', Base.metadata,
                    autoload=True, autoload_with=db.engine)

class Leaves(db.Model):
    __table__ = Table('Leaves_table', Base.metadata,
                    autoload=True, autoload_with=db.engine)



@app.route("/")
def index():
    return render_template("index.html")


@app.route("/HRLogin",methods=['POST','GET'])
def HRLog():
    if request.method == "POST":
        email=request.form.get('email')
        password=request.form.get('password')
        user=HR_User.query.filter_by(email=email).first()
        password_check=HR_User.query.filter_by(password=HashFromPassword(password)).first()
        if user and password_check:
            flash("Successful Login")
            return redirect(url_for("HRDashboard"))
        else:
            flash("Invalid email or password","danger")
            return render_template("HRLog.html")
    return render_template("HRLog.html")

@app.route("/EmployeeLogin",methods=['POST','GET'])
def EmployeeLog():
    if request.method == "POST":
        email=request.form.get('email')
        password=request.form.get('password')
        user= EmployeeLogin.query.filter_by(email=email).first()
        password_check=EmployeeLogin.query.filter_by(password=HashFromPassword(password)).first()
        if user and password_check:
            flash("Successful Login")
            session['EmployeeId'] = user.Employee_Id
            return redirect(url_for("EmployeeDashboard"))
        else:
            flash("Invalid email or password","danger")
            return render_template("EmployeeLogin.html")
    return render_template("EmployeeLogin.html")

@app.route("/HRReg",methods=['POST','GET'])
def HRReg():
    if request.method == "POST":
        username=request.form.get('username')
        email=request.form.get('email')
        password=request.form.get('password')
        user = HR_User.query.filter_by(email=email).first()
        if user:
            flash("Email Already exists")
            return render_template("HRReg.html")
        user = HR_User.query.filter_by(username=username).first()
        if user:
            flash("Email Already exists")
            return render_template("HRReg.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        hashpassword = HashFromPassword(password)
        print(hashpassword)
        cur.execute(f"Call public.sp_create_hruser('{username}', '{hashpassword}', '{email}')")
        conn.commit()
        flash("New user created")
        return render_template("HRLog.html")
    return render_template("HRReg.html")

@app.route("/main")
def main():
    return render_template("main.html")

@app.route("/EmployeeReg",methods=['POST','GET'])
def EmployeeReg():
    if request.method == "POST":
        username=request.form.get('username')
        email=request.form.get('email')
        password=request.form.get('password')
        employee = Employee.query.filter_by(Email=email).first()
        print(employee)
        if employee is None:
            flash("Not a registered employee")
            print("Not a registered employee")
            return render_template("EmployeeReg.html")
        print(employee)
        employeeId = employee.Employee_ID
        print(employeeId)
        user = EmployeeLogin.query.filter_by(email=email).first()
        if user:
            flash("Email Already exists")
            return render_template("EmployeeReg.html")
        user = EmployeeLogin.query.filter_by(username=username).first()
        if user:
            flash("Username Already exists")
            return render_template("EmployeeReg.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        hashpassword = HashFromPassword(password)
        print(hashpassword)
        cur.execute(f"Call public.sp_create_employeeuser('{username}', '{hashpassword}', '{email}','{employeeId}')")
        conn.commit()
        flash("New user created")
        return render_template("EmployeeLogin.html")
    return render_template("EmployeeReg.html")

# @app.route('/CreateEmpRecord')
# def create_employee1():
#     return render_template('CreateEmpRecord.html')

@app.route("/CreateEmpRecord", methods=['GET', 'POST'])
def create_employee():
    if request.method == 'POST':
        job_id=request.form.get('job_id')
        first_name=request.form.get('fname')
        middle_name=request.form.get('mname')
        last_name=request.form.get('lname')
        email=request.form.get('empemail')
        mobile=request.form.get('mobileno')
        date_of_joining=request.form.get('doj')
        manager_id=request.form.get('managerid')
        gender=request.form.get('gender')
        accrued_leaves=request.form.get("Accleaves")
        shift_code=request.form.get('shiftcd')
        dept_no=request.form.get('deptno')
        emp_type_id=request.form.get('emptypid')
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.cr_new_emp('{job_id}','{first_name}','{middle_name}','{last_name}','{email}','{mobile}','{date_of_joining}','{manager_id}','{gender}','{accrued_leaves}','{shift_code}','{dept_no}','{emp_type_id}')")
        conn.commit()
        flash("Employee Information created Successully")
        return redirect('/CreateEmpRecord')
    return render_template("CreateEmpRecord.html")


@app.route("/CreateEmpPersonaldata", methods=['GET', 'POST'])
def CreateEmpPersonaldata():
    if request.method == 'POST':
        empid=request.form.get('empid')
        marital_status=request.form.get('maritalstat')
        qualification=request.form.get('qualification')
        last_employer=request.form.get('lastemployer')
        last_employer_address=request.form.get('lastempadd')
        last_employer_contact=request.form.get('lastempcont')
        previous_role=request.form.get('prevrole')
        tax_id=request.form.get('taxid')
        date_of_birth=request.form.get("DOB")
        nationality=request.form.get("nationality")
        blood_group=request.form.get('bloodgrp')
        employee_id=request.form.get('empid')
        addr1_street_name=request.form.get('addr1sn')
        addr1_building_name=request.form.get('ad1bldname')
        addr1_house_no=request.form.get('ad1house')
        addr1_city=request.form.get('ad1city')
        addr1_postcode=request.form.get('ad1plz')
        addr1_country=request.form.get('ad1country')
        addr2_street_name=request.form.get('addr2sn')
        addr2_building_name=request.form.get('ad2bldname')
        addr2_house_no=request.form.get('ad2house')     
        addr2_city=request.form.get('ad2city')
        addr2_postcode=request.form.get('ad2plz')
        addr2_country=request.form.get('ad2country')
        conn = DatabaseConnection()
        cur = conn.cursor()    
        cur.execute(f"Call public.personal_data_emp (`{empid}`,`{marital_status}`,`{qualification}`,`{last_employer}`,`{last_employer_address}`,'{previous_role}',`{last_employer_contact}`,`{tax_id}`,'{date_of_birth}','{nationality}','{blood_group}','{addr1_street_name}','{addr1_building_name}','{addr1_house_no}','{addr1_city}','{addr1_postcode}','{addr1_country}','{addr2_street_name}','{addr2_building_name}','{addr2_house_no}','{addr2_city}','{addr2_postcode}','{addr2_country}')")
        conn.commit()
        flash("Employee personal Information created Successully")
        return redirect('/CreateEmpPersonaldata')
    return render_template("CreateEmpPersonaldata.html")

@app.route("/edit/<string:employee_id>", methods=['GET', 'POST'])
def edit(employee_id):
    employee = Employee.query.filter_by(Employee_ID = employee_id).first()
    # post=EmployeePersonal.query.filter_by(Employee_ID=employee_id).first()
    if request.method == 'POST':
         Employee_ID=request.form.get('empid')
         Job_ID=request.form.get('jobid')
         First_Name=request.form.get('fname')
         Middle_Name=request.form.get('mname')
         Last_Name=request.form.get('lname')
         Email=request.form.get('emailid')
         Mobile=request.form.get('mobile')
         Date_of_joining=request.form.get('doj')
         Manager_ID=request.form.get("managerid")
         Gender=request.form.get('gender')
         Accrued_leaves=request.form.get('accleaves')
         date_of_leaving=request.form.get('empdol')
         emp_type=request.form.get('emptypid')

         conn = DatabaseConnection()
         cur = conn.cursor()  
         cur.execute(f"Call public.hr_edit_employee ('{employee.Employee_ID}','{Job_ID}','{First_Name}','{Middle_Name}','{Last_Name}','{Email}','{Mobile}','{Date_of_joining}','{Manager_ID}','{Gender}','{Accrued_leaves}','1','1','{emp_type}','{date_of_leaving}')")
         conn.commit()  
         flash("Personal details updated successfully")
         return redirect('/DisplayEmpInfo')
    return render_template("edit.html", data = employee)
    
@app.route("/employeeddetailsedit", methods=['GET', 'POST'])
def employeedashboard():
    # Read Employee information from database on page render
    employee = Employee.query.filter_by(Employee_ID = session['EmployeeId']).first()
    Employee_ID=employee.Employee_ID
    First_Name= employee.First_Name
    Middle_Name = employee.Middle_Name
    Last_Name = employee.Last_Name
    Gender = employee.Gender
    Emp_Type=Employee_Type.query.with_entities(Employee_Type.Emp_Type_ID,Employee_Type.Type_of_employee)
    Emp_Type_ID = employee.Emp_Type_ID 
    if request.method == 'POST':
        # If a post request is made, update variables with code input on site
        Employee_ID=employee.Employee_ID
        Employee_ID_INT = int(Employee_ID)
        First_Name=request.form.get('First_Name')
        Middle_Name=request.form.get('Middle_Name')
        Last_Name=request.form.get('Last_Name')
        Gender=request.form.get('Gender')
        Emp_Type_ID=request.form.get('Emp_Type')
        
        # Execute stored procedure to update the database with new information
        conn = DatabaseConnection()
        cur = conn.cursor()    
        cur.execute(f"Call public.sp_edit_employee ({Employee_ID_INT},'{First_Name}','{Middle_Name}','{Last_Name}','{Gender}',{Emp_Type_ID})")
        conn.commit()
        flash("Successfully Updated User Information")
        return render_template("EmployeeDashboard.html")
    return render_template("Emp_Details_Editable.html", data=employee, typedata = Emp_Type)

@app.route("/contactdata", methods=['GET', 'POST'])
def contactdata():
    return render_template("contactdata.html")

@app.route("/EmployeeDashboard", methods=['GET'])
def EmployeeDashboard():
    return render_template("EmployeeDashboard.html")

@app.route("/HRDashboard", methods=['GET'])
def HRDashboard():
    return render_template("HRDashboard.html")

@app.route("/editaddress", methods=['GET', 'POST'])
def editaddress():
    return render_template("skills.html")

@app.route('/DisplayFinanceData')
def displayFinanceData():
    conn = DatabaseConnection()
    cur = conn.cursor()
    cur.execute(f"Call public.sp_emp_financeinfo_view()")
    financeData=cur.fetchall()
    conn.commit()
    return render_template("DisplayFinanceData.html", finance = financeData)

@app.route("/SearchFinanceData",methods=['POST','GET'])
def searchFinanceData():
    financeData=[('','','','','','','','','','','','','','','','','')]
    if request.method == "POST":
        employee_id=request.form.get('employee_id')
        if employee_id is not None:
            conn = DatabaseConnection()
            cur = conn.cursor()
            cur.execute(f"Call public.sp_emp_finance_search('{employee_id}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)")
            financeData = cur.fetchall()
            # print (db_data[0][0])
    return render_template("SearchFinanceData.html", fin = financeData)

@app.route("/CreateFinanceData", methods=['GET', 'POST'])
def createFinanceData():
    if request.method == 'POST':
        emp_bank_id=request.form.get('emp_bank_id')
        employee_id=request.form.get('employee_id')
        salary_id=request.form.get('salary_id')
        bank_acc_id=request.form.get('bank_acc_id')
        bank_name=request.form.get('bank_name')
        bank_acc_number=request.form.get('bank_acc_number')
        bank_iban=request.form.get('bank_iban')
        bank_location=request.form.get('bank_location')
        start_date=request.form.get('start_date')
        end_date=request.form.get('end_date')
        bonus=request.form.get('bonus')
        salary_band=request.form.get('salary_band')
        monthly_salary=request.form.get('monthly_salary')
        annual_salary=request.form.get('annual_salary')
        monthly_tax_deduction=request.form.get('monthly_tax_deduction')
        monthly_insurance_deduction=request.form.get('monthly_insurance_deduction')
        monthly_pension_deduction=request.form.get('monthly_pension_deduction')
        pf=request.form.get('pf')
        salary_creation_timestamp=request.form.get('salary_creation_timestamp')
        employee = Employee.query.filter_by(Employee_ID=employee_id).first()
        if employee is None:
            flash("Not a registered employee")
            return render_template("CreateFinanceData.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_finance_info('{emp_bank_id}', '{employee_id}', '{bank_acc_id}', '{bank_name}', '{bank_acc_number}', '{bank_iban}', '{bank_location}', '{start_date}', '{end_date}', '{salary_id}', '{bonus}', '{salary_band}', '{monthly_salary}', '{annual_salary}', '{monthly_tax_deduction}', '{monthly_insurance_deduction}', '{monthly_pension_deduction}', '{pf}', '{salary_creation_timestamp}')")
        conn.commit()
        flash("Employee finance Information created Successully")
        return redirect('/CreateFinanceData')
    return render_template("CreateFinanceData.html")

@app.route("/UpdateFinanceData", methods=['GET', 'POST'])
def updateFinanceData():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        start_date=request.form.get('start_date')
        end_date=request.form.get('end_date')
        bonus=request.form.get('bonus')
        salary_band=request.form.get('salary_band')
        monthly_salary=request.form.get('monthly_salary')
        annual_salary=request.form.get('annual_salary')
        monthly_tax_deduction=request.form.get('monthly_tax_deduction')
        monthly_insurance_deduction=request.form.get('monthly_insurance_deduction')
        monthly_pension_deduction=request.form.get('monthly_pension_deduction')
        pf=request.form.get('pf')
        salary_creation_timestamp=request.form.get('salary_creation_timestamp')
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_financeinfo_update('{employee_id}', '{start_date}', '{end_date}', '{bonus}', '{salary_band}', '{monthly_salary}', '{annual_salary}', '{monthly_tax_deduction}', '{monthly_insurance_deduction}', '{monthly_pension_deduction}', '{pf}', '{salary_creation_timestamp}')")
        conn.commit()
        flash("Employee finance Information Updated Successully")
        return redirect('/UpdateFinanceData')
    return render_template("UpdateFinanceData.html")

@app.route("/DeleteFinanceData", methods=['GET', 'POST'])
def deleteFinancedata():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        employee = Employee.query.filter_by(Employee_ID=employee_id).first()
        if employee is None:
            flash("Not a registered employee")
            return render_template("DeleteFinanceData.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_finance_delete('{employee_id}')")
        conn.commit()
        flash("Employee Finance Information Successfully Deleted")
        return redirect('/DeleteFinanceData')
    return render_template("DeleteFinanceData.html")

@app.route('/DisplayDeptData')
def displayDeptData():
    conn = DatabaseConnection()
    cur = conn.cursor()
    cur.execute(f"Call public.sp_emp_dept_view()")
    department=cur.fetchall()
    conn.commit()
    return render_template("DisplayDeptData.html", dept = department)

@app.route("/SearchDeptData",methods=['POST','GET'])
def searchDeptData():
    db_data=[('','','','','','')]
    if request.method == "POST":
        employee_id=request.form.get('employee_id')
        if employee_id is not None:
            conn = DatabaseConnection()
            cur = conn.cursor()
            cur.execute(f"Call public.sp_emp_dept_search('{employee_id}', NULL, NULL, NULL, NULL, NULL, NULL)")
            db_data = cur.fetchall()
            print (db_data[0][0])
    return render_template("SearchDeptData.html", dept_data = db_data)

@app.route("/CreateDeptData", methods=['GET', 'POST'])
def createDeptData():
    if request.method == 'POST':
        emp_dept_id=request.form.get('emp_dept_id')
        employee_id=request.form.get('employee_id')
        department_id=request.form.get('deptid')
        join_date=request.form.get('join_date')
        leave_date=request.form.get('leave_date')
        employee = Employee.query.filter_by(Employee_ID=employee_id).first()
        if employee is None:
            flash("Not a registered employee")
            return render_template("CreateDeptData.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_dept('{emp_dept_id}', '{department_id}', '{employee_id}', '{join_date}', '{leave_date}')")
        conn.commit()
        flash("Employee Department Information Successfully Created")
        return redirect('/CreateDeptData')
    return render_template("CreateDeptData.html")

@app.route("/UpdateDeptData", methods=['GET', 'POST'])
def updateDeptdata():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        department_id=request.form.get('deptid')
        join_date=request.form.get('join_date')
        leave_date=request.form.get('leave_date')
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_dept_update('{department_id}', '{employee_id}', '{join_date}', '{leave_date}')")
        conn.commit()
        flash("Employee Department Information Successfully Updated")
        return redirect('/UpdateDeptData')
    return render_template("UpdateDeptData.html")

@app.route("/DeleteDeptData", methods=['GET', 'POST'])
def deleteDeptdata():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        employee = Employee.query.filter_by(Employee_ID=employee_id).first()
        if employee is None:
            flash("Not a registered employee")
            return render_template("DeleteDeptData.html")
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_dept_delete('{employee_id}')")
        conn.commit()
        flash("Employee Department Information Successfully Deleted")
        return redirect('/DeleteDeptData')
    return render_template("DeleteDeptData.html")

@app.route('/DisplayJobData')
def displayJobData():
    conn = DatabaseConnection()
    cur = conn.cursor()
    cur.execute(f"Call public.sp_emp_job_view()")
    jobDetails=cur.fetchall()
    conn.commit()
    return render_template("DisplayJobData.html", jobs = jobDetails)

@app.route("/SearchJobData",methods=['POST','GET'])
def searchJobData():
    jobData=[('','','','','','','','')]
    if request.method == "POST":
        employee_id=request.form.get('employee_id')
        if employee_id is not None:
            conn = DatabaseConnection()
            cur = conn.cursor()
            cur.execute(f"Call public.sp_emp_job_search('{employee_id}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)")
            jobData = cur.fetchall()
            # print (db_data[0][0])
    return render_template("SearchJobData.html", job = jobData)


@app.route("/CreateJob", methods=['GET', 'POST'])
def createJob():
    if request.method == 'POST':
        job_emp_id=request.form.get('job_emp_id')
        employee_id=request.form.get('employee_id')
        job_id=request.form.get('job_id')
        job_creation_timestamp=request.form.get('job_creation_timestamp')
        job_update=request.form.get('job_update')
        job_description=request.form.get('job_description')
        dep_id=request.form.get('dep_id')
        activity_status=request.form.get('activity_status')
        start_date=request.form.get('start_date')
        end_date=request.form.get('end_date')        
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_job('{job_emp_id}', '{employee_id}', '{job_id}', '{job_creation_timestamp}', '{job_update}', '{job_description}', '{dep_id}', '{activity_status}', '{start_date}', '{end_date}')")
        conn.commit()
        flash("Job Details Successfully Added")
        return redirect('/CreateJob')
    return render_template("CreateJob.html")

@app.route("/UpdateJob", methods=['GET', 'POST'])
def updateJob():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        job_creation_timestamp=request.form.get('job_creation_timestamp')
        job_update=request.form.get('job_update')
        job_description=request.form.get('job_description')
        dep_id=request.form.get('dep_id')
        activity_status=request.form.get('activity_status')
        start_date=request.form.get('start_date')
        end_date=request.form.get('end_date')        
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_job_update('{employee_id}', '{job_creation_timestamp}', '{job_update}', '{job_description}', '{dep_id}', '{activity_status}', '{start_date}', '{end_date}')")
        conn.commit()
        flash("Job Details Successfully Updated")
        return redirect('/UpdateJob')
    return render_template("UpdateJob.html")

@app.route("/DeleteJobData", methods=['GET', 'POST'])
def deleteJob():
    if request.method == 'POST':
        employee_id=request.form.get('employee_id')
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_job_delete('{employee_id}')")
        conn.commit()
        flash("Employee Department Information Successfully Deleted")
        return redirect('/DeleteJobData')
    return render_template("DeleteJobData.html")

@app.route('/LeaveType', methods=['GET', 'POST'])
def LeaveType():
    if request.method == 'POST':
        leave_Code=request.form.get('leave_code')
        leaves_description=request.form.get('leaves_description')
        maximum_leaves_txt = request.form.get('maximum_leaves_txt')
        maximum_leaves=int(maximum_leaves_txt)
        leavetype = Leaves.query.filter_by(Leave_code=leave_Code).first()
        if leavetype:
            flash("type of leave already exist")
            return render_template("LeaveType.html")
        conn = DatabaseConnection()
        cur = conn.cursor()    
        cur.execute(f"Call public.add_leave_type('{leave_Code}','{leaves_description}', '{maximum_leaves}')")
        conn.commit()
        flash("Successfully created new leave type")
        return render_template("LeaveType.html")
    return render_template("LeaveType.html")

@app.route('/EmployeeLeaveApplication', methods=['GET', 'POST'])
def EmployeeLeaveApplication():
    leave_type=Leaves.query.with_entities(Leaves.Leave_code)
    if request.method == 'POST':
        leave_date=request.form.get('leave_date')
        leave_Type=request.form.get('leave_type')
        empId = session['EmployeeId']
        # TODO: Add check for whether the type of leaves aren't aready consumed.
        conn = DatabaseConnection()
        cur = conn.cursor()    
        cur.execute(f"Call public.apply_leave('{leave_date}','{leave_Type}','{empId}')")
        conn.commit()
        flash("Leave Successfully applied")
        return render_template("EmployeeLeaveApplication.html", data=leave_type)
    return render_template("EmployeeLeaveApplication.html", data=leave_type)

@app.route('/DisplayEmpInfo', methods=['GET', 'POST'])
def DisplayEmpInfo():
    if request.method == 'POST':
        empid=request.form.get('empid')
        exists = Employee.query.filter_by(Employee_ID=empid).first()
        if exists:
            employee_id = exists.Employee_ID
            return redirect("displayinfo/" + str(employee_id))
        else:
            flash("eid doesnot exist")
        return redirect('/DisplayEmpInfo') 
    return render_template("DisplayEmpInfo.html")

@app.route('/displayinfo/<string:employee_id>')
def displayinfo(employee_id):
    conn = DatabaseConnection()
    cur = conn.cursor()
    cur.execute(f"Call public.view_empinfo('{employee_id}')")
    employeelist=cur.fetchall()
    conn.commit()
    return render_template("displayinfo.html", emps = employeelist)
      


@app.route("/EmployeeAppraisal",methods=['POST','GET'])
def EmployeeAppraisal():
    if request.method == "POST":
        Emp_perfomance_id=request.form.get('Emp_perfomance_id')
        Employee_Id=request.form.get('Employee_id')
        Emp_rating=request.form.get('Emp_rating')
        Manager_rating=request.form.get('Manager_rating')
        Remarks=request.form.get('Remarks')
        conn = DatabaseConnection()
        cur = conn.cursor()
        cur.execute(f"Call public.sp_emp_appraisal('{Emp_perfomance_id}', '{Employee_Id}', '{Emp_rating}', '{Manager_rating}', '{Remarks}')")
        conn.commit()
        flash("Perfomrance Review recorded")
    return render_template("EmployeeAppraisal.html")

@app.route("/EmpAppraisalView",methods=['POST','GET'])
def EmpAppraisalView():
    db_data=[('None','None','None','None')]
    if request.method == "POST":
        Employee_Id=request.form.get('Employee_Id')
        print (Employee_Id)
        if Employee_Id is not None:
            conn = DatabaseConnection()
            cur = conn.cursor()
            cur.execute(f"Call public.sp_emp_appraisal_view('{Employee_Id}', NULL, NULL, NULL, NULL)")
            db_data = cur.fetchall()
            print (db_data[0][0])
            #conn.commit()
            flash("Performance Review recalled")
    return render_template("EmpAppraisalView.html", appraisal_data = db_data)

@app.route('/logout')
def logout():
    return render_template("index.html")

if __name__ == '__main__':
 app.run(debug=True)