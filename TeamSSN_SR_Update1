--PROJECT PHASE 3
--TEAM SSN


select * from available_plans;
select * from department;
select * from employee_details;
select * from transactions;
select * from user_details;
select * from user_plans;
select * from payments;

 
 
--(1)	DDL SCRIPT:
--(a)	Creating the users and granting them rights respectively



CREATE USER user_sr IDENTIFIED BY SSN_dmdd2022;                    -- create a root user 

Commit; 

CREATE USER user_accounts IDENTIFIED BY Accounts1234;   -- create a read only user for Accounts team                 

Commit; 

CREATE USER user_marketing IDENTIFIED BY Marketing1234;   -- create a user for marketing team 

Commit; 

CREATE USER rduser_customer IDENTIFIED BY Readcusts1234; -- create a read user for customer service team 

Commit; 

CREATE USER CS_team IDENTIFIED BY CService1234; -- create a write user for customer service team 

Commit; 

CREATE USER rduser_tech IDENTIFIED BY Readtech1234; -- create a read user for technical team 

Commit; 

CREATE USER user_tech IDENTIFIED BY Technical1234; -- create a write user for technical team 

Commit; 

 

GRANT CONNECT TO user_sr; 

Commit; 

GRANT CONNECT TO user_marketing; 

Commit; 

GRANT CONNECT TO rduser_customer;  

Commit; 

GRANT CONNECT TO rduser_tech; 

Commit; 

GRANT CONNECT TO user_accounts;  

Commit; 

GRANT CONNECT TO user_tech ; 

Commit; 

GRANT CONNECT TO CS_team; 

Commit; 

 

GRANT CREATE SESSION to user_sr; 

GRANT CREATE SESSION to user_marketing; 

GRANT CREATE SESSION to user_marketing; 

GRANT CREATE SESSION TO rduser_customer;  

GRANT CREATE SESSION TO rduser_tech; 

GRANT CREATE SESSION TO user_accounts;  

GRANT CREATE SESSION TO user_tech ; 

GRANT CREATE SESSION TO CS_team; 

Commit; 

 
 

GRANT UNLIMITED TABLESPACE TO user_sr; 

GRANT UNLIMITED TABLESPACE TO user_marketing; 

GRANT UNLIMITED TABLESPACE TO user_tech; 

GRANT UNLIMITED TABLESPACE TO CS_team; 

Commit; 

 
 

GRANT ALL on USER_SR.USERS TO user_sr; 

GRANT ALL on USER_SR.USER_plans TO user_sr; 

GRANT ALL on USER_SR.available_plans TO user_sr; 

GRANT ALL on USER_SR.department TO user_sr; 

GRANT ALL on USER_SR.employee_details TO user_sr; 

GRANT ALL on USER_SR.payments TO user_sr; 

GRANT ALL on USER_SR.transactions TO user_sr; 

commit; 

 
 

GRANT SELECT ON   user_sr.payments TO user_accounts ; 

GRANT SELECT ON   user_sr.users TO user_accounts ; 

GRANT SELECT ON user_sr.user_plans TO user_marketing; 

GRANT SELECT, INSERT, UPDATE, DELETE ON user_sr.available_plans TO user_marketing; 

GRANT SELECT ON   user_sr.users TO    rduser_customer ; 

GRANT SELECT ON   user_sr.user_plans TO rduser_customer; 

GRANT SELECT ON   user_sr.available_plans TO     rduser_customer ; 

GRANT SELECT ON   user_sr.payments  TO     rduser_customer ; 

GRANT SELECT, INSERT, UPDATE, DELETE ON user_sr.users TO CS_team; 

GRANT SELECT ON   user_sr.users  TO     rduser_tech ; 

GRANT SELECT ON   user_sr.user_plans  TO     rduser_tech ; 

GRANT SELECT ON   user_sr.available_plans  TO     rduser_tech ; 

GRANT SELECT ON   user_sr.transactions  TO     rduser_tech ; 

GRANT SELECT, INSERT, UPDATE, DELETE ON   user_sr.users  TO     user_tech ; 

GRANT SELECT, INSERT, UPDATE, DELETE ON   user_sr.user_plans  TO     user_tech ; 

GRANT SELECT, INSERT, UPDATE, DELETE ON   user_sr.available_plans  TO     user_tech ; 

GRANT SELECT, INSERT, UPDATE, DELETE ON   user_sr.transactions  TO     user_tech ; 

Commit; 

 

--(2) Creating the sequences: 

CREATE SEQUENCE userid_seq      -- creating sequences for users table 

  MINVALUE 10000

  MAXVALUE 19999

  START WITH 10000

  INCREMENT BY 1 

  CACHE 20; 

 

CREATE SEQUENCE avail_plans_seq      -- creating sequences for available_plans table 

  MINVALUE 1

  MAXVALUE 50

  START WITH 1

  INCREMENT BY 1 

  CACHE 20; 
 
 

CREATE SEQUENCE deptid_seq  -- creating sequences for department table 

  MINVALUE 10 

  MAXVALUE 100 

  START WITH 10 

  INCREMENT BY 10

  CACHE 20; 

 

CREATE SEQUENCE empid_seq       -- creating sequences for employee_details table 

  MINVALUE 50000 

  MAXVALUE 59999 

  START WITH 50000 

  INCREMENT BY 1 

  CACHE 20; 


  CREATE SEQUENCE payment_seq             -- creating sequences for payments table 

  MINVALUE 70000 

  MAXVALUE 79999 

  START WITH 70000 

  INCREMENT BY 1 

  CACHE 20; 

 

CREATE SEQUENCE transaction_seq         -- creating sequences for transactions table 

  MINVALUE 1 

  MAXVALUE 10000 

  START WITH 1 

  INCREMENT BY 1 

  CACHE 20; 

 

--Creating the Tables using sequences: 

--USERS TABLE: 


CREATE TABLE user_details ( 

USER_ID NUMBER(5,0) default userid_seq.nextval primary key, 

USER_FIRST_NAME VARCHAR2(20 BYTE) not null,  

USER_LAST_NAME VARCHAR2(20 BYTE) not null,  

USER_STREET VARCHAR2(20 BYTE) not null,  

USER_CITY VARCHAR2(20 BYTE) not null,  

USER_STATE VARCHAR2(20 BYTE) not null,  

USER_ZIPCODE VARCHAR2(5 BYTE) not null,  

IDENTIFICATION_TYPE VARCHAR2(20 BYTE) null,  

IDENTIFICATION_NUMBER  VARCHAR2(20 BYTE) null,  

USER_PHONE NUMBER(10,0) not null unique,  

MIN_BALANCE FLOAT not null,  

USER_STATUS VARCHAR2(20 BYTE) not null  

); 



--Creating available_plans table: 

create table available_plans( 

PLAN_ID NUMBER(10) primary key, 

PLAN_TYPE VARCHAR2(30)NOT NULL, 

PLAN_COST FLOAT(126) NOT NULL, 

AVAILABLE_SMS NUMBER(10),  

AVAILABLE_CALLS NUMBER(30), 

AVAILABLE_DATA FLOAT(126), 

VALIDITY NUMBER(10) NOT NULL 

); 


--Creating user_plans table: 

 

create table user_plans( 

user_id number(5) references user_details(user_id), 

plan_id number(10) references available_plans(plan_id), 

plan_start_date date NOT NULL, 

plan_feedback varchar2(30) 

); 

 


--Creating Department Table: 

create table department(  

dept_id number default deptid_seq.nextval primary key ,   

dept_name varchar2(20) not null,  

dept_email varchar2(25) not null, 

dept_phone_number number unique  

); 


--Creating employee details table: 


create table employee_details( 

emp_id number default empid_seq.nextval primary key , 

--dept_id number references department(dept_id),

emp_first_name varchar2(20) not null, 

emp_last_name varchar2(20) not null, 

emp_street varchar2(20) not null, 

emp_city varchar2(20) not null, 

emp_state varchar2(20) not null, 

emp_zipcode varchar2(5) not null, 

emp_title varchar2(20), 

--emp_level varchar2(20), 

emp_phone number(10) unique, 

emp_email varchar2(35)unique 

); 

 


--Creating Payments Table: 

 

create table payments( 

payment_id number default payment_seq.nextval  primary key, 

user_id number(5) references user_details(user_id), 

account_number number not null, 

routing_number number not null, 

bank_name varchar2(30) not null, 

payment_status varchar2(20), 

payment_date_time timestamp not null

); 

 

--Creating Transactions Table: 

 

create table transactions( 

transaction_id number default transaction_seq.nextval primary key, 

user_id number references user_details(user_id), 

transaction_type varchar2(20) not null, 

date_time timestamp not null, 

usage float not null, 

destination_number number(10) 

); 

 

 

 

--Adding sample data into the Tables: 

--Creating Procedures to enter the sample data: 

 
--Creating the procedure for Users Table:
 
 

create or replace procedure users_insert 

(p_user_id IN USER_DETAILS.USER_ID%TYPE, 

p_user_fname IN USER_DETAILS.USER_FIRST_NAME%TYPE, 

p_user_lname IN USER_DETAILS.USER_LAST_NAME%TYPE, 

p_street IN USER_DETAILS.USER_STREET%TYPE,

p_city IN USER_DETAILS.USER_CITY%TYPE, 

p_state IN USER_DETAILS.USER_STATE%TYPE, 

p_zipcode IN USER_DETAILS.USER_ZIPCODE%TYPE,

p_iden_type IN USER_DETAILS.IDENTIFICATION_TYPE%TYPE, 

p_iden_num IN USER_DETAILS.IDENTIFICATION_NUMBER%TYPE, 

p_user_phone IN USER_DETAILS.USER_PHONE%TYPE,

p_min_bal IN USER_DETAILS.MIN_BALANCE%TYPE, 

p_user_status IN USER_DETAILS.USER_STATUS%TYPE

) 

IS 

BEGIN 

INSERT INTO  USER_DETAILS VALUES (p_user_id, p_user_fname, p_user_lname, p_street, p_city, p_state, p_zipcode, p_iden_type, p_iden_num, p_user_phone, p_min_bal, p_user_status); 

DBMS_OUTPUT.PUT_LINE('User added.'); 

END; 

 

--Creating procedure for AVAILABLE_PLANS Table: 


create or replace procedure available_plans_insert 

(p_plan_id IN AVAILABLE_PLANS.PLAN_ID%TYPE, 

p_plan_type IN AVAILABLE_PLANS.PLAN_TYPE%TYPE, 

p_plan_cost IN AVAILABLE_PLANS.PLAN_COST%TYPE, 

p_avail_sms IN AVAILABLE_PLANS.AVAILABLE_SMS%TYPE,

p_avail_calls IN AVAILABLE_PLANS.AVAILABLE_CALLS%TYPE,

p_avail_data IN AVAILABLE_PLANS.AVAILABLE_DATA%TYPE,

p_validity IN AVAILABLE_PLANS.VALIDITY%TYPE) 

IS 

BEGIN 

INSERT INTO  AVAILABLE_PLANS VALUES (p_plan_id, p_plan_type, p_plan_cost, p_avail_sms, p_avail_calls, p_avail_data, p_validity); 

DBMS_OUTPUT.PUT_LINE('PLAN added.'); 

END; 

  
 


--Creating procedure for USER_PLANS Table: 

 

create or replace procedure userplans_insert 

(puser_id IN USER_PLANS.USER_ID%TYPE, 

pplan_id IN USER_PLANS.PLAN_ID%TYPE, 

pstart IN USER_PLANS.PLAN_START_DATE%TYPE, 

pfeedback IN USER_PLANS.PLAN_FEEDBACK%TYPE) 

IS 

BEGIN 

INSERT INTO  USER_PLANS VALUES (puser_id,pplan_id,pstart,pfeedback); 

DBMS_OUTPUT.PUT_LINE('USER_PLANS added.'); 

END; 

 
 

--Creating the procedure for Department Table :  


create or replace procedure department_insert 

(p_dept_id IN DEPARTMENT.DEPT_ID%TYPE, 

p_dept_name IN DEPARTMENT.DEPT_NAME%TYPE, 

p_dept_email IN DEPARTMENT.DEPT_EMAIL%TYPE, 

p_dept_phone IN DEPARTMENT.DEPT_PHONE_NUMBER%TYPE) 

IS 

BEGIN 

INSERT INTO  department VALUES (p_dept_id, p_dept_name, p_dept_email, p_dept_phone); 

DBMS_OUTPUT.PUT_LINE('Department added.'); 

END; 

 

 
--Creating the procedure for Employee Table 


create or replace procedure employees_insert 

(p_emp_id IN EMPLOYEE_DETAILS.EMP_ID%TYPE, 

--p_dept_id IN EMPLOYEE_DETAILS.DEPT_ID%TYPE, 

p_emp_fname IN EMPLOYEE_DETAILS.EMP_FIRST_NAME%TYPE, 

p_emp_lname IN EMPLOYEE_DETAILS.EMP_LAST_NAME%TYPE, 

p_emp_street IN EMPLOYEE_DETAILS.EMP_STREET%TYPE,

p_emp_city IN EMPLOYEE_DETAILS.EMP_CITY%TYPE, 

p_emp_state IN EMPLOYEE_DETAILS.EMP_STATE%TYPE, 

p_emp_zipcode IN EMPLOYEE_DETAILS.EMP_ZIPCODE%TYPE,

p_emp_title IN EMPLOYEE_DETAILS.EMP_TITLE%TYPE, 

--p_emp_level IN EMPLOYEE_DETAILS.EMP_LEVEL%TYPE, 

p_emp_phone IN EMPLOYEE_DETAILS.EMP_PHONE%TYPE,

p_emp_email IN EMPLOYEE_DETAILS.EMP_EMAIL%TYPE

) 

IS 

BEGIN 

INSERT INTO  EMPLOYEE_DETAILS VALUES (p_emp_id, p_emp_fname, p_emp_lname, p_emp_street, p_emp_city, p_emp_state, p_emp_zipcode, p_emp_title, p_emp_phone, p_emp_email); 

DBMS_OUTPUT.PUT_LINE('Employee added.'); 

END; 

 


 

 
 

--Creating the procedure for Payments Table: 

 

create or replace procedure payments_insert 

(p_id IN payments.PAYMENT_ID%TYPE, 

p_userid IN payments.USER_ID%TYPE, 

paccount IN payments.ACCOUNT_NUMBER%TYPE, 

prouting IN payments.ROUTING_NUMBER%TYPE, 

pbank IN payments.BANK_NAME%TYPE, 

pstatus IN payments.PAYMENT_STATUS%TYPE, 

pdate IN payments.PAYMENT_DATE_TIME%TYPE) 

IS 

BEGIN 

INSERT INTO  PAYMENTS VALUES (p_id,p_userid,paccount,prouting,pbank,pstatus,pdate); 

DBMS_OUTPUT.PUT_LINE('Payment added'); 

END; 

 

--Creating the procedure for Transactions Table :  



create or replace procedure transaction_insert 

(pt_id IN TRANSACTIONS.TRANSACTION_ID%TYPE, 

puser_id IN TRANSACTIONS.USER_ID%TYPE, 

ptype IN TRANSACTIONS.TRANSACTION_TYPE%TYPE, 

p_tdate IN TRANSACTIONS.DATE_TIME%TYPE,

pusage IN TRANSACTIONS.USAGE%TYPE, 

pdest IN TRANSACTIONS.DESTINATION_NUMBER%TYPE) 

IS 

BEGIN 

INSERT INTO  transactions VALUES (pt_id,puser_id,ptype,p_tdate,pusage,pdest); 

DBMS_OUTPUT.PUT_LINE('Transaction added.'); 

END; 

 


 
--Inserting the data into USERS Table: 

execute users_insert(userid_seq.NEXTVAL, 'elizabeth', 'rachel', '56 victoria street', 'hurley', 'mississippi', '02178', 'SSN',799400669,9635383643, 1, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Brian', 'Carlson', '137 Coal Road', 'Philadelphia', 'Pennsylvania', '28716', 'SSN',975974574,5363926482, 2.3, 'active'); 

execute users_insert(userid_seq.NEXTVAL, 'MIKE', 'ROSS', '46 WILSON LANE', 'DALLAS', 'TEXAS', '53829', 'SSN',712591346,4385640576, 32.2, 'active');   

execute users_insert(userid_seq.NEXTVAL, 'Adam', 'Sandler', '257 Otter Avenue', 'Houstan', 'Texas', '43672', 'SSN',237904321,9045385530, 34.7, 'active'); 

execute users_insert(userid_seq.NEXTVAL, 'tessa', 'thompson', '75 fleming way', 'delaware', 'ohio', '02384', 'SSN',393890269,8452956338, 0.0, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'andrew', 'garfield', '825 lucy lane', 'boston', 'massachusetts', '56227','SSN',708601148, 4385638359, 12.64, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'EMMA', 'STONE', '973 ESSEX LANE', 'TUCSON', 'ARIZONA', '73584','SSN',613921592 ,5392547606, 9.23, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Taylor', 'Swift', '13 Oak Way', 'Burlington', 'Vermont', '15372','SSN', 225194478,6784668354, 0.0, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'TOM', 'HOLLAND', '96 COLLEGE AVENUE', 'PITTSBURGH', 'PENNSYLVANIA', '43672','SSN',226749374, 8564739254, 19.43, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Zendaya', 'Thomas', '867 Clarklent Street', 'Highland', 'Kansas', '34527','SSN',166147527 ,3345604563, 0.0, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Cole', 'Sprouse', '12 Shadow Drive', 'Columbus', 'Ohio', '57893', 'SSN',824244928,6443856398, 42.3, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'CHANDLER', 'BING', '8786 EDINGTON LANE', 'SPRINGFIELD', 'MASSACHUSETTS', '36642','SSN', 159380974,3495540648, 53.42, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'monica', 'geller', '86 marine drive', 'Portersville', 'Pennsylvania', '56278','SSN',599373475 ,7659335473, 13.54, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Rachel', 'Green', '890 Patch Road', 'Washington', 'Washington DC', '97923', 'SSN',691359918,7583695638, 0.0, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'HARVEY', 'SPECTRE', '972 VITERO WAY', 'SACRAMENTO', 'CALIFORNIA', '96483', 'SSN',771857266,5374749547, 22.78, 'active');    

execute users_insert(userid_seq.NEXTVAL, 'michael', 'scott', '57 terry lane', 'miami', 'florida', '65723', 'SSN',281099656,4874538563, 67.43, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'JIM', 'PARSON', '90 BARNES STREET', 'INDIANAPOLIS', 'INDIANA', '76742', 'SSN',853200975,6479479025, 44.94, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Pam', 'Beasly', '123 Jett Lane', 'Seattle', 'Washington', '34878', 'SSN',378868816,5382945638, 0.0, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'selena', 'thomas', '6538 woodrow way', 'weston', 'nebraska', '09953','SSN',506388146, 4372846672, 57.42, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'LANA', 'SCOTT', '994 VIRGIL STREET', 'BANGOR', 'MAINE', '19808', 'SSN',974391272,8564365788, 17.45, 'active'); 

 

--Inserting the data into Available_plans: 


execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 5, 100, 100, 2, 1); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 10, 100, 175, 3, 7); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 20, 100, -1, 5, 30); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 50, 200, -1, 10, 90); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 100, 300, -1, 20, 180); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 175, 400, -1, 40, 240); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 250, 800, -1, 80, 360); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'prepaid', 275, -1, -1, 100, 360); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 6, 100, 110, 2, 1); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 12, 100, 185, 3, 7); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 23, 100, -1, 5, 30); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 55, 200, -1, 10, 90); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 110, 300, -1, 20, 180); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 180, 400, -1, 40, 240); 

execute available_plans_insert(avail_plans_seq.NEXTVAL, 'postpaid', 270, 800, -1, 80, 360); 



--Inserting the data into User_plans: 



execute userplans_insert(10000,	15, TIMESTAMP '2021-12-22 00:08:53', 'plan is good'); 

execute userplans_insert(10014,	14, TIMESTAMP '2021-12-30 01:18:21', 'insufficient data limit'); 

execute userplans_insert(10011,	9, TIMESTAMP '2022-01-12 02:36:12', 'best plan'); 

execute userplans_insert(10001,	6, TIMESTAMP '2022-01-17 03:43:31', 'average'); 

execute userplans_insert(10010,	3, TIMESTAMP '2022-02-02 04:32:32', 'could extend the validity'); 

execute userplans_insert(10004,	4, TIMESTAMP '2022-03-13 05:12:45', 'data insifficient'); 

execute userplans_insert(10003,	2, TIMESTAMP '2022-03-20 06:56:49', 'call minutes were insufficient'); 

execute userplans_insert(10013,	5, TIMESTAMP '2022-04-15 07:32:12', 'very good'); 

execute userplans_insert(10002,	1, TIMESTAMP '2022-05-27 08:01:09', 'data limit can be increased'); 

execute userplans_insert(10012,	7, TIMESTAMP '2022-06-04 09:02:11', 'cost to be reduced'); 

execute userplans_insert(10006,	12, TIMESTAMP '2022-06-09 10:23:13', 'not happy'); 

execute userplans_insert(10009,	14, TIMESTAMP '2022-07-01 11:42:27', 'good plan'); 

execute userplans_insert(10005,	3, TIMESTAMP '2022-08-16 12:52:57', 'good'); 

execute userplans_insert(10007,	11, TIMESTAMP '2022-09-03 13:13:16', 'satisfied'); 

execute userplans_insert(10016,	10, TIMESTAMP '2022-09-17 14:16:02', 'dissatisfied'); 

execute userplans_insert(10008,	6, TIMESTAMP '2022-09-21 15:08:25', 'excellent plan'); 

execute userplans_insert(10015,	3, TIMESTAMP '2022-10-11 16:26:00', 'cost efficient'); 

execute userplans_insert(10018,	8, TIMESTAMP '2022-10-15 17:23:16', 'plan cost is expensive'); 

execute userplans_insert(10019,	13, TIMESTAMP '2022-11-09 18:15:56', 'good amount of data'); 

execute userplans_insert(10017,	7, TIMESTAMP '2022-11-19 19:05:37', 'extra data was available'); 

 

--newly added
 
 
execute userplans_insert(10014,	15, TIMESTAMP '2022-08-30 11:20:47', 'good data limit');

execute userplans_insert(10011,	12, TIMESTAMP '2022-01-14 21:32:32', 'good');

execute userplans_insert(10001,	6, TIMESTAMP '2022-09-17 03:43:31', 'average');

execute userplans_insert(10010,	4, TIMESTAMP '2022-03-02 12:21:53', 'nice');

execute userplans_insert(10010,	4, TIMESTAMP '2022-06-02 23:45:33', 'nice');

execute userplans_insert(10010,	4, TIMESTAMP '2022-09-03 23:59:56', 'nice');

execute userplans_insert(10003,	5, TIMESTAMP '2022-03-27 11:10:02', 'expensive');

execute userplans_insert(10006,	10, TIMESTAMP '2022-09-10 12:14:31', 'good plan');

execute userplans_insert(10007,	11, TIMESTAMP '2022-10-03 21:56:21', 'satisfied');

execute userplans_insert(10007,	12, TIMESTAMP '2022-11-04 04:32:40', 'satisfied');



--Inserting the data into Department Table: 

 
execute department_insert(deptid_seq.NEXTVAL, 'Accounting', 'accounting@gmail.com', 8754444111); 

execute department_insert(deptid_seq.NEXTVAL, 'Marketing', 'marketing@gmail.com', 8754444222); 

execute department_insert(deptid_seq.NEXTVAL, 'Technical', 'technical@gmail.com', 8754444333); 

execute department_insert(deptid_seq.NEXTVAL, 'Customer Service', 'customerservice@gmail.com', 8754444444); 

execute department_insert(deptid_seq.NEXTVAL, 'Management', 'management@gmail.com', 8754444555); 



--Inserting the data into Employee details Table: 


execute employees_insert(empid_seq.nextval,10, 'Kevin', 'Swan', '38 Elm Street', 'Boston', 'Massachusets', '02160', 'Accountant', 8575274528, 'swan.ke@gmail.com');

execute employees_insert(empid_seq.NEXTVAL,10, 'andrew', 'stone', '73 main street', 'chicago', 'illinois', '60457', 'Senior Accountant', 3127352828, 'stone.an@gmail.com'); 

execute employees_insert(empid_seq.NEXTVAL,20, 'MARK', 'ROBERT', '483 OAK STREET', 'SAN JOSE', 'CALIFORNIA', '21723', 'Marketing Lead', 4082181183, 'robert.ma@yahoo.com'); 

execute employees_insert(empid_seq.NEXTVAL,20, 'karen', 'matthews', '87 washington street', 'dallas', 'texas', '42749', 'Marketing Intern', 8572945188, 'matthews.ka@outlook.com'); 

execute employees_insert(empid_seq.NEXTVAL,30, 'Johnny', 'hill', '83 park street', 'manhattan', 'New York', '83683', 'Project Manager', 3327517900, 'hill.jo@gmail.com'); 

execute employees_insert(empid_seq.NEXTVAL,30, 'ISABELLA', 'MARK', '652 KOOTER LANE', 'CHARLOTTLE', 'NORTH CAROLINA', '32772', 'Senior Engineer', 2525682993, 'mark.is@yahoo.com'); 

execute employees_insert(empid_seq.NEXTVAL,30, 'jennifer', 'shule', '12 ersel street', 'reisterstown', 'maryland', '30028', 'Engineer', 3018992457, 'shule.je@gmail.com'); 

execute employees_insert(empid_seq.NEXTVAL,40, 'Andrew', 'Wilson', '3411 Cambridge Place', 'Dallas', 'Texas', '13831', 'Customer Service Representative', 7912835297, 'wilson.an@outlook.com'); 

execute employees_insert(empid_seq.NEXTVAL,40,'SHAWN', 'HILL', '1367 FLYNN STREET', 'ROCKY RIVER', 'OHIO', '63929', 'Customer Service Intern', 2569235739, 'hill.sh@yahoo.com'); 

execute employees_insert(empid_seq.NEXTVAL,50,'Lisa', 'Kudrow', '1468 Warner Street', 'Kinston', 'North Carolina', '32581', 'Director', 7893568255, 'kudrow.li@gmail.com'); 

commit;

 
--Inserting the data into Payments Table: 

 

 

execute payments_insert(1029,	12673,	618148198322,	877349343,	'JPMorgan Chase',	'Success',TIMESTAMP '2022-08-30 11:20:47'); 

execute payments_insert(1020,	10327,	126764622433,	879692164,	'Bank of America',	'Success',TIMESTAMP '2022-01-14 21:32:32'); 

execute payments_insert(1021,	19873,	713360228687,	288523104,	'Capital One',	'Success',TIMESTAMP '2022-09-17 03:43:31'); 

execute payments_insert(1022,	15572,	216224302122,	611802939,	'Bank of America',	'Success',TIMESTAMP '2022-03-02 12:21:53'); 

execute payments_insert(1023,	15572,	431832400139,	951531102,	'Capital One',	'Success',TIMESTAMP '2022-06-02 23:45:33'); 

execute payments_insert(1024,	15572,	607021983867,	594370977,	'JPMorgan Chase',	'Success',TIMESTAMP '2022-09-03 23:55:56'); 

execute payments_insert(1025,	17644,	126764622433,	326799525,	'Capital One',	'Success',TIMESTAMP '2022-03-27 11:10:02'); 

execute payments_insert(1026,	14278,	142013825466,	999102179,	'Bank of America',	'Success',TIMESTAMP '2022-09-10 12:14:31'); 

execute payments_insert(1027,	15723,	704752642195,	511838562,	'JPMorgan Chase',	'Success',TIMESTAMP '2022-10-03 21:56:21'); 

execute payments_insert(1028,	15723,	801276425953,	675442235,	'Bank of America',	'Success',TIMESTAMP '2022-11-04 04:32:40'); 

execute payments_insert(1001,	15382,	1371971315883530,	799400669,	'Bank of America',	'Success',TIMESTAMP '2022-07-02 00:20:00'); 

execute payments_insert(1002,	19873,	7108664375894540,	799400669,	'JPMorgan Chase',	'Success',TIMESTAMP	'2022-01-28 06:13:17'); 

execute payments_insert(1003,	10034,	5315383400606400,	975974574,	'PNC Financial Services', 'Success',TIMESTAMP '2022-09-01 18:48:34'); 

execute payments_insert(1004,	17644,	3690859741294280,	712591346,	'Bank of America','Success', TIMESTAMP '2020-05-15 04:19:36'); 

execute payments_insert(1005,	13572,	3753066656896610,	237904321,	'Capital One',	'Success'	,TIMESTAMP '2021-03-01 04:45:22'); 

execute payments_insert(1006,	15380,	7004884170021630,	393890269,	'PNC Financial Services','Success',TIMESTAMP '2021-10-28 03:25:01'); 

execute payments_insert(1007,	14278,	8913576738049940,	708601148,	'Citigroup',	'Success',	TIMESTAMP '2022-08-08 04:37:25'); 

execute payments_insert(1008,	15723,	1249498014817310,	613921592,	'JPMorgan Chase',	'Success',TIMESTAMP '2020-10-20 16:36:56'); 

execute payments_insert(1009,	17936,	8744336085399580,	225194478,	'Bank of America',	'Success',TIMESTAMP '2020-04-25 11:17:17'); 

execute payments_insert(1010,	10238,	6428948984576800,	166147527,	'JPMorgan Chase',	'Success',TIMESTAMP '2021-11-02 22:59:54'); 

execute payments_insert(1011,	15572,	7014934083554950,	824244928,	'JPMorgan Chase',	'Success',TIMESTAMP '2020-02-29 13:40:29'); 

execute payments_insert(1012,	10327,	111304518288,	159380974,	'Capital One',	'Success',TIMESTAMP '2021-11-16 15:21:32'); 

execute payments_insert(1013,	13827,	405181052647,	599373475,	'Citigroup',	'Success',TIMESTAMP '2020-08-10 01:41:26'); 

execute payments_insert(1014,	14217,	381936111489,	691359918,	'Bank of America',	'Success',TIMESTAMP '2022-05-30 10:12:41'); 

execute payments_insert(1015,	12673,	870860633793,	771857266,	'Citigroup','Success',TIMESTAMP '2022-11-16 17:41:24'); 

execute payments_insert(1016,	12983,	174709887052,	281099656,	'PNC Financial Services',	'Success',TIMESTAMP '2022-03-12 06:51:51'); 

execute payments_insert(1017,	13083,	250911367507,	378868816,	'Citigroup',	'Failed',TIMESTAMP '2020-01-07 12:09:05'); 

execute payments_insert(1018,	13934,	331781750185,	506388146,	'Bank of America','Failed',TIMESTAMP '2021-03-22 22:08:53'); 

execute payments_insert(1019,	13826,	168050160781,	853200975,	'Capital One',	'Success',TIMESTAMP '2021-12-08 03:18:21'); 

commit; 

 


 

--Inserting the data into Transactions Table: 

 select * from transactions
--2 userid
execute transaction_insert(transaction_seq.NEXTVAL,10034,'SMS',TIMESTAMP '2022-05-27 10:07:10',1,9875632100); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10034,'Call',TIMESTAMP '2022-05-27 20:21:05',10,876345901); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10034,'data',TIMESTAMP '2022-05-27 20:25:43',100,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,17644,'SMS',TIMESTAMP '2022-03-21 20:22:10',1,8793456279); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,17644,'Call',TIMESTAMP '2022-03-22 12:06:05',30,9873648528); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,17644,'data',TIMESTAMP '2022-03-24 10:22:10',20,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,15572,'SMS',TIMESTAMP '2022-02-13 15:01:06',1,8736368491); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,12983,'data',TIMESTAMP '2022-10-24 15:20:00',8,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13572,'SMS',TIMESTAMP '2022-04-28 20:00:00',1,7859768013); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,15572,'data',TIMESTAMP '2022-05-11 14:07:10',300,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,14217,'SMS',TIMESTAMP '2022-08-06 11:10:12',1,9856489032); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,17644,'data',TIMESTAMP '2022-04-12 19:20:02',20,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,19873,'SMS',TIMESTAMP '2022-04-26 10:11:12',1,8378769981); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,19873,'data',TIMESTAMP '2022-05-15 09:25:22',45,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13827,'SMS',TIMESTAMP '2022-07-07 15:20:10',1,9564389989); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13934,'data',TIMESTAMP '2022-11-20 07:28:30',67,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13826,'data',TIMESTAMP '2022-11-18 22:28:10',300,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10327,'SMS',TIMESTAMP '2022-01-12 18:22:11',1,8861780690); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10327,'Call',TIMESTAMP '2022-01-12 20:05:20',10,9978997883); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10327,'data',TIMESTAMP '2022-01-12 20:20:11',20,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,14278,'SMS',TIMESTAMP '2022-09-23 12:23:20',1,9247668933); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13083,'Call',TIMESTAMP '2022-09-18 20:04:10',15,8864907456); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,13083,'data',TIMESTAMP '2022-09-20 23:10:00',400,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,15723,'SMS',TIMESTAMP '2022-09-23 12:23:20',1,8765439088); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,15723,'data',TIMESTAMP '2022-10-06 20:10:00',4,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,14278,'SMS',TIMESTAMP '2022-07-17 03:20:10',1,9987664597); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,14278,'data',TIMESTAMP '2022-09-29 08:11:08',60,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,19874,'SMS',TIMESTAMP '2022-11-10 17:22:11',1,9876453214); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,19874,'data',TIMESTAMP '2022-11-12 19:10:00',500,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,12673,'SMS',TIMESTAMP '2022-03-12 22:22:11',1,8976787894); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,10238,'data',TIMESTAMP '2022-08-15 20:16:08',50,NULL); 

commit; 

  

execute transaction_insert(transaction_seq.NEXTVAL,15382,'SMS',TIMESTAMP '2021-12-23 23:12:09',1,8578642237); 

commit; 

 

--CREATING  TRIGGERS: 

 

create or replace TRIGGER Plan_start_update_check 

Before update of PLAN_START_DATE on USER_PLANS 

FOR EACH ROW 

BEGIN 

IF :NEW.PLAN_START_DATE < :OLD.PLAN_START_DATE THEN 

RAISE_APPLICATION_ERROR(-20125,'Updated Plan start date cannot be lesser than current plan start date'); 

END IF; 

END; 

/ 

 

 

--(3) MASKING: 

--Masking the first 5 digits of SSN’s of users from users Table usinf dbms_redact.add_policy. 

 

 

begin 

  sys.dbms_redact.add_policy( 

  object_schema => 'USER_SR', 

  object_name => 'USERS', 

  column_name => 'Identification_number', 

  policy_name => 'Identification_number policy', 

  function_type => DBMS_REDACT.PARTIAL, 

  FUNCTION_PARAMETERS => DBMS_REDACT.REDACT_US_SSN_F5, 

  expression    => '1=1' 

); 

end; 

/   

 

--Replacing the first 5 digits of the routing number to 1 in the PAYMENTS Table: 

--routing number and accounting number not masked


begin 

  dbms_redact.add_policy( 

  object_schema => 'USER_SR', 

  object_name => 'PAYMENTS', 

  column_name => 'ROUTING_NUMBER', 

  policy_name => 'ROUTING_number policy', 

  function_type => DBMS_REDACT.PARTIAL, 

  FUNCTION_PARAMETERS => '1,1,5', 

  expression    => '1=1' 

); 

end; 

/   


--(4) REPORTS/VIEWS : 

 

 

 

--1ST VIEW :  PLAN_WISE REVENUE: Creating the report for plan_wise revenue: 
 

CREATE OR REPLACE VIEW PLAN_WISE_REVENUE(PLAN_ID,PLAN_COST,COUNT_OF_PLAN_ID,PLAN_WISE_REVENUE) 

AS select u.plan_id, a.plan_cost, count(u.plan_id), (count(u.plan_id))*a.plan_cost as plan_wise_revenue  

from user_plans u, available_plans a  

where u.plan_id=a.plan_id group by u.plan_id, a.plan_cost; 

 

select * from plan_wise_revenue; 

 

--2nd  VIEW : monthwise revenue report : This view gives the monthly revenue report: 

 

CREATE OR REPLACE VIEW MONTH_WISE_REVENUE_view(Month, Monthly_revenue) 

as select extract (month from plan_start_date) as month, sum(a.plan_cost) as monthly_revenue

from user_plans u, available_plans a 

where a.plan_id=u.plan_id 

group by extract (month from plan_start_date)

order by extract (month from plan_start_date); 
 

select * from MONTH_WISE_REVENUE_view; 

 

--3rd VIEW: PREPAID_REVENUE_REPORT: This view gives the revenue report about the prepaid subscribers. 

 

CREATE OR REPLACE VIEW Prepaid_revenue_view(Total_Revenue_Prepaid) 

as select sum(count(u.plan_id)*a.plan_cost) as TOTAL_REVENUE_prepaid  

from user_plans u, available_plans a  

WHERE  a.plan_type = 'prepaid' and u.plan_id=a.plan_id group by a.plan_type,a.plan_cost; 

 
 

select * from Prepaid_revenue_view; 

 

--4th VIEW:  POSTPAID_REVENUE_REPORT - This view gives the revenue report about the postpaid subscribers. 

 

CREATE OR REPLACE VIEW Postpaid_revenue_view(Total_Revenue_Postpaid) 

as select sum(count(u.plan_id)*a.plan_cost) as TOTAL_REVENUE_postpaid  

from user_plans u, available_plans a  

WHERE  a.plan_type = 'postpaid' and u.plan_id=a.plan_id group by a.plan_type,a.plan_cost; 

 

select * from Postpaid_revenue_view; 

 

--5th VIEW : REGION_WISE_REVENUE:  This view will give the revenue based on the user's location. 

 

CREATE OR REPLACE VIEW Region_based_revenue_view(REGION, REVENUE) 

as select lower(u.user_state), sum(a.plan_cost)

from user_details u, available_plans a, user_plans up 

where a.plan_id=up.plan_id and up.user_id=u.user_id 

group by lower(u.user_state); 

 
 

select * from Region_based_revenue_view; 

--change this according to the latest plan of the user
--6th VIEW : User_transaction_history:  This view will give the history of all the transactions made by a particular user.
 

CREATE OR REPLACE VIEW User_transaction_history(user_id, transaction_type, usage, destination_number, transaction_date) 

as select user_id, transaction_type, usage, destination_number, date_time from transactions;



select * from User_transaction_history where user_id=17644; 


--7th VIEW : plan_end_date : This view will give the plan's end date for a particular user
--change based on the latest plan - ithink its already done. check it


CREATE OR REPLACE VIEW plan_end_date(user_id, plan_id, plan_start_date, plan_end_date) 

as select u.user_id, u.plan_id, u.plan_start_date, u.plan_start_date+a.validity as plan_end_date
from user_plans u inner join available_plans a 
on a.plan_id=u.plan_id
order by u.plan_start_date desc;


select * from plan_end_date where user_id=17644
fetch next 1 rows only; 
 

 
--dropping tables not working
--(5) Dropping the tables


PURGE RECYCLEBIN; 
SET SERVEROUTPUT ON; 

BEGIN 

  DBMS_REDACT.drop_policy ( 

    object_schema => 'user_sr', 

    object_name   => 'users', 

    policy_name   => 'User_identification policy' 

  ); 

EXCEPTION 

   WHEN OTHERS 

   THEN NULL; 

END; 

/ 

 
 
 

BEGIN 

  DBMS_REDACT.drop_policy ( 

    object_schema => 'user_sr', 

    object_name   => 'PAYMENTS', 

    policy_name   => 'ROUTING_number policy' 

  ); 

EXCEPTION 

   WHEN OTHERS 

   THEN NULL; 

END; 

/ 


 

-- dropping sequences 

BEGIN 
  EXECUTE IMMEDIATE 'DROP SEQUENCE  userid_seq '; 

EXECUTE IMMEDIATE 'DROP SEQUENCE  deptid_seq '; 

EXECUTE IMMEDIATE 'DROP SEQUENCE  empid_seq '; 

EXECUTE IMMEDIATE 'DROP SEQUENCE  payment_seq '  ; 

EXECUTE IMMEDIATE 'DROP SEQUENCE transaction_seq ' ; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -2289 THEN 
      RAISE; 
    END IF; 
END; 

 

 

-- dropping Tables: 

 

BEGIN 
   EXECUTE IMMEDIATE 'DROP TABLE  TRANSACTIONS' ; 

EXECUTE IMMEDIATE 'DROP TABLE  PAYMENTS' ; 

EXECUTE IMMEDIATE 'DROP TABLE DEPARTMENT' ; 

EXECUTE IMMEDIATE 'DROP TABLE  EMPLOYEE_DETAILS' ; 

EXECUTE IMMEDIATE 'DROP TABLE  USER_PLANS' ; 

EXECUTE IMMEDIATE 'DROP TABLE  AVAILABLE_PLANS' ; 

EXECUTE IMMEDIATE 'DROP TABLE  USER_DETAILS' ; 
EXCEPTION 
   WHEN OTHERS THEN 
      IF SQLCODE != -942 THEN 
         RAISE; 
      END IF; 
END; 

commit;

--DROPPING USERS 

BEGIN 
  EXECUTE IMMEDIATE 'DROP USER user_accounts'; 

EXECUTE IMMEDIATE 'DROP USER  user_marketing  '; 

EXECUTE IMMEDIATE 'DROP USER   rduser_customer '; 

EXECUTE IMMEDIATE 'DROP USER rduser_tech   '; 

EXECUTE IMMEDIATE 'DROP USER  user_tech  '; 

EXECUTE IMMEDIATE 'DROP USER  CS_team '; 

EXECUTE IMMEDIATE 'DROP USER USER_SR  '; 
EXCEPTION 
  WHEN OTHERS THEN 
    IF SQLCODE != -1918 THEN 
      RAISE; 
    END IF; 
END;









#####################################

select * from transactions
select * from available_plans
select * from user_plans order by user_id

select user_id, usage from transactions where transaction_type='SMS' order by user_id


--plan balance not done

select u.user_id, u.plan_id, 
count(t.usage)
from transactions t inner join user_plans u
on u.user_id=t.user_id
inner join available_plans a
on a.plan_id=u.plan_id
where t.transaction_type='SMS'
and a.plan_id=u.plan_id
group by u.user_id, u.plan_id
order by user_id;







--user_transaction history done

CREATE OR REPLACE VIEW User_transaction_history(user_id, transaction_type, usage, destination_number, transaction_date) 

as select user_id, transaction_type, usage, destination_number, date_time from transactions;



select * from User_transaction_history where user_id=17644; 

 


--plan end date
--need to change this according to the latest plan chosen by the user

CREATE OR REPLACE VIEW plan_end_date(user_id, plan_id, plan_start_date, plan_end_date) 

as select u.user_id, u.plan_id, u.plan_start_date, u.plan_start_date+a.validity as plan_end_date
from user_plans u inner join available_plans a 
on a.plan_id=u.plan_id
order by u.plan_start_date desc;


select * from plan_end_date where user_id=17644
fetch next 1 rows only; 

 