 
--PROJECT PHASE 3
--TEAM SSN


select * from available_plans;
select * from department;
select * from employee_details;
select * from service_transactions;
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

 

CREATE SEQUENCE service_transactions_seq         -- creating sequences for transactions table 

  MINVALUE 1 

  MAXVALUE 10000 

  START WITH 1 

  INCREMENT BY 1 

  CACHE 20; 

 

--Creating the Tables using sequences: 

--USERS TABLE: 


CREATE TABLE user_details ( 

USER_ID NUMBER(5,0) primary key, 

EMP_ID NUMBER references employee_details(EMP_ID),

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

plan_feedback number check(plan_feedback>=0 and plan_feedback<=5) 

); 

 


--Creating Department Table: 

create table department(  

dept_id number primary key ,   

dept_name varchar2(20) not null,  

dept_email varchar2(25) not null, 

dept_phone_number number unique  

); 


--Creating employee details table: 


create table employee_details( 

emp_id number primary key , 

dept_id number references department(dept_id),

emp_first_name varchar2(20) not null, 

emp_last_name varchar2(20) not null, 

emp_street varchar2(20) not null, 

emp_city varchar2(20) not null, 

emp_state varchar2(20) not null, 

emp_zipcode varchar2(5) not null, 

emp_title varchar2(35),  

emp_phone number(10) unique, 

emp_email varchar2(35)unique 

); 

 

--Creating Payments Table: 

 

create table payments( 

payment_id number primary key, 

user_id number(5) references user_details(user_id), 

account_number number not null, 

routing_number number not null, 

bank_name varchar2(30) not null, 

payment_status varchar2(20), 

payment_date_time timestamp not null,

plan_id number references available_plans(plan_id)

); 

 

--Creating Transactions Table: 

 

create table service_transactions( 

service_transaction_id number primary key, 

user_id number references user_details(user_id), 

service_transaction_type varchar2(20) not null, 

date_time timestamp not null, 

usage float not null, 

destination_number number(10) 

); 

 

 

 

--Adding sample data into the Tables: 

--Creating Procedures to enter the sample data: 

 
--Creating the procedure for Users Table:
 
 

create or replace procedure users_insert 

(p_user_id IN USER_DETAILS.USER_ID%TYPE, 

p_emp_id IN USER_DETAILS.EMP_ID%TYPE, 

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

INSERT INTO  USER_DETAILS VALUES (p_user_id,p_emp_id, p_user_fname, p_user_lname, p_street, p_city, p_state, p_zipcode, p_iden_type, p_iden_num, p_user_phone, p_min_bal, p_user_status); 

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

p_dept_id IN EMPLOYEE_DETAILS.DEPT_ID%TYPE, 

p_emp_fname IN EMPLOYEE_DETAILS.EMP_FIRST_NAME%TYPE, 

p_emp_lname IN EMPLOYEE_DETAILS.EMP_LAST_NAME%TYPE, 

p_emp_street IN EMPLOYEE_DETAILS.EMP_STREET%TYPE,

p_emp_city IN EMPLOYEE_DETAILS.EMP_CITY%TYPE, 

p_emp_state IN EMPLOYEE_DETAILS.EMP_STATE%TYPE, 

p_emp_zipcode IN EMPLOYEE_DETAILS.EMP_ZIPCODE%TYPE,

p_emp_title IN EMPLOYEE_DETAILS.EMP_TITLE%TYPE,  

p_emp_phone IN EMPLOYEE_DETAILS.EMP_PHONE%TYPE,

p_emp_email IN EMPLOYEE_DETAILS.EMP_EMAIL%TYPE

) 

IS 

BEGIN 

INSERT INTO  EMPLOYEE_DETAILS VALUES (p_emp_id, p_dept_id, p_emp_fname, p_emp_lname, p_emp_street, p_emp_city, p_emp_state, p_emp_zipcode, p_emp_title, p_emp_phone, p_emp_email); 

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

pdate IN payments.PAYMENT_DATE_TIME%TYPE,

pplanId IN payments.PLAN_ID%TYPE
) 

IS 

BEGIN 

INSERT INTO  PAYMENTS VALUES (p_id,p_userid,paccount,prouting,pbank,pstatus,pdate,pplanId); 

DBMS_OUTPUT.PUT_LINE('Payment added'); 

END; 

 

--Creating the procedure for Transactions Table :  



create or replace procedure service_transactions_insert 

(pt_id IN SERVICE_TRANSACTIONS.SERVICE_TRANSACTIONS_ID%TYPE, 

puser_id IN SERVICE_TRANSACTIONS.USER_ID%TYPE, 

ptype IN SERVICE_TRANSACTIONS.SERVICE_TRANSACTIONS_TYPE%TYPE, 

p_tdate IN SERVICE_TRANSACTIONS.DATE_TIME%TYPE,

pusage IN SERVICE_TRANSACTIONS.USAGE%TYPE, 

pdest IN SERVICE_TRANSACTIONS.DESTINATION_NUMBER%TYPE) 

IS 

BEGIN 

INSERT INTO  service_transactions VALUES (pt_id,puser_id,ptype,p_tdate,pusage,pdest); 

DBMS_OUTPUT.PUT_LINE('Transaction added.'); 

END; 

 

-- Creating functions

--(1) check user existance while adding the records to user_plans table



CREATE OR REPLACE FUNCTION check_user_exist(
    p_user_id NUMBER
) 
RETURN NUMBER
IS
    l_count NUMBER := 0;
BEGIN
    
    SELECT count(*)
    INTO l_count
    FROM user_details
    WHERE user_id=p_user_id;
    
    IF l_count = 1
   THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;

 
--not needed
BEGIN
    IF check_user_exist (10036) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('User does not exist');
    END IF;
END;

/

check_user_exist(10036) from dual;







--(2) check user status while adding the records to user_plans table



CREATE OR REPLACE FUNCTION check_user_status(
    p_user_id NUMBER
) 
RETURN NUMBER
IS
    l_status VARCHAR2(15);
BEGIN
    
    SELECT user_status
    INTO l_status
    FROM user_details
    WHERE user_id=p_user_id;
    
    IF lower(l_status) = 'active'
   THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;

 
-------------
BEGIN
    IF check_user_status (10036) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('User does not exist');
    END IF;
END;

/
-----------

select check_user_status(10008) from dual;






--(3) check plan existance while adding the records to user_plans table



CREATE OR REPLACE FUNCTION check_plan_exist(
    p_plan_id NUMBER
) 
RETURN NUMBER
IS
    l_pcount NUMBER := 0;
BEGIN
    
    SELECT count(*)
    INTO l_pcount
    FROM available_plans
    WHERE plan_id=p_plan_id;
    
    IF l_pcount = 1
   THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;

/


select check_plan_exist(14) from dual;








--(4) check employee existance while adding the records to user_details table


CREATE OR REPLACE FUNCTION check_emp_exist(
    p_emp_id NUMBER
) 
RETURN NUMBER
IS
    l_ecount NUMBER := 0;
BEGIN
    
    SELECT count(*)
    INTO l_ecount
    FROM employee_details
    WHERE emp_id=p_emp_id;
    
    IF l_ecount = 1
   THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;

/


select check_emp_exist(50008) from dual;






--(5) check payment status while adding the records to user_plans table
--this can be used to add the records to user_plans table instaed of directly entering the values - needs to be modified



CREATE OR REPLACE FUNCTION check_payment_status(
    p_payment_id NUMBER
) 
RETURN NUMBER
IS
    l_pay_status VARCHAR2(15);
BEGIN
    
    SELECT payment_status
    INTO l_pay_status
    FROM payments
    WHERE payment_id=p_payment_id;
    
    IF lower(l_pay_status) = 'success'
   THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;

 
-------------
BEGIN
    IF check_payment_status (70004) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Payment failed');
    END IF;
END;

/
-----------

select check_payment_status(70004) from dual;




-- (6) Popular service type region wise
-- This can be used to improvise plan by the company

CREATE OR REPLACE FUNCTION popular_service(
    p_region VARCHAR2
) 
RETURN VARCHAR2
IS 
    popular_service_type VARCHAR2(20);
BEGIN
    SELECT service_transactions_type INTO popular_service_type FROM (
        SELECT s.service_transactions_type ,
        COUNT(s.service_transactions_id) AS Service_Used_Count 
        FROM user_details u join service_transactions s 
        ON u.user_id = s.user_id 
        WHERE LOWER(u.USER_STATE) = LOWER(p_region) 
        GROUP BY s.service_transactions_type 
        ORDER BY Service_Used_Count DESC )popular_service_region_wise
        WHERE ROWNUM=1;
    RETURN popular_service_type;
END;


select popular_service('Texas') from dual;


CREATE OR REPLACE FUNCTION high_rated_plan
RETURN NUMBER
IS 
    popular_plan NUMBER;
BEGIN
    SELECT Plan_id INTO popular_plan FROM (
        SELECT p.plan_id ,
        SUM(u.plan_feedback) AS TOTAL_FEEDBACK 
        FROM user_plans u JOIN user_details ud  
        ON u.user_id = ud.user_id
        JOIN available_plans p 
        ON u.plan_id = p.plan_id 
        GROUP BY p.plan_id 
        ORDER BY TOTAL_FEEDBACK DESC )popular_plan_by_feedback
        WHERE ROWNUM=1;
    RETURN popular_plan;
END;

select high_rated_plan from dual

-- USERS HANDLED BY EACH DEPARTMENT

CREATE OR REPLACE FUNCTION dept_handling_users(
    p_dept_name VARCHAR
)
RETURN 
IS 
BEGIN
    SELECT * FROM user_details u JOIN employee_details e 
    ON u.emp_id = e.emp_id 
    WHERE e.DEPT_ID = (SELECT dept_id FROM department WHERE LOWER(DEPT_NAME)=LOWER(p_dept_name))
END;


CREATE OR REPLACE FUNCTION employee_dept(
    emp_id NUMBER
)
RETURN VARCHAR
IS 
    emp_dept VARCHAR2(20);
BEGIN
    if check_emp_exist(emp_id) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee does not exist');
    ELSE
        SELECT dept_name INTO emp_dept  FROM department WHERE dept_id = (SELECT dept_id from employee_details WHERE emp_id = emp_id);
    END IF;
    RETURN emp_dept;
END;


-- CREATING STORED PROCEDURES

CREATE OR REPLACE
PROCEDURE support_request
( p_user_id NUMBER) IS
BEGIN
  IF check_user_exist(p_user_id) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('User does not exist.'); 
  ELSE 
    UPDATE user_details
    SET emp_id = (SELECT emp_id FROM
    ( SELECT e.emp_id FROM employee_details e JOIN department d ON e.dept_id = d.dept_id
    WHERE LOWER(d.dept_name) = 'customer service'
    ORDER BY dbms_random.value )
    WHERE rownum = 1 )
    WHERE user_id = p_user_id;
 END IF;
END support_request;


CREATE OR REPLACE
PROCEDURE technical_request
( p_user_id NUMBER) IS
BEGIN
  IF check_user_exist(p_user_id) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('User does not exist.'); 
  ELSE 
    UPDATE user_details
    SET emp_id = (SELECT emp_id FROM
    ( SELECT e.emp_id FROM employee_details e JOIN department d ON e.dept_id = d.dept_id
    WHERE LOWER(d.dept_name) = 'technical'
    ORDER BY dbms_random.value )
    WHERE rownum = 1 )
    WHERE user_id = p_user_id;
 END IF;
END technical_request;
  
CREATE OR REPLACE
PROCEDURE account_payment_issue_request
( p_user_id NUMBER) IS
BEGIN
  IF check_user_exist(p_user_id) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('User does not exist.'); 
  ELSE 
    UPDATE user_details
    SET emp_id = (SELECT emp_id FROM
    ( SELECT e.emp_id FROM employee_details e JOIN department d ON e.dept_id = d.dept_id
    WHERE LOWER(d.dept_name) = 'accounting'
    ORDER BY dbms_random.value )
    WHERE rownum = 1 )
    WHERE user_id = p_user_id;
 END IF;
END account_payment_issue_request;

--CREATING  TRIGGERS: 

--trigger logic is wrong, check it
create or replace TRIGGER Plan_start_update_check 

Before update of PLAN_START_DATE on USER_PLANS 

FOR EACH ROW 

BEGIN 

IF :NEW.PLAN_START_DATE < :OLD.PLAN_START_DATE THEN 

RAISE_APPLICATION_ERROR(-20125,'Updated Plan start date cannot be lesser than current plan start date'); 

END IF; 

END; 

/ 


CREATE OR REPLACE TRIGGER service_transactions_type
BEFORE INSERT ON service_transactions
FOR EACH ROW

--[WHEN condition]
--DECLARE
--    declaration statements
BEGIN
    if lower(:new.service_transactions_type) not in ('sms', 'call', 'data') then
        raise_application_error(-20000, 'Please enter a valid service_transactions_type - call, sms, or data ');
    end if;
--EXCEPTION
    --exception_handling statements
END;
/



CREATE OR REPLACE TRIGGER sms_usage
BEFORE INSERT ON service_transactions
FOR EACH ROW

WHEN (lower(new.service_transactions_type)='sms')
BEGIN
    if (:new.usage) != 1 then
        raise_application_error(-20000, 'Usage should always be 1 when the service_transactions_type is SMS');
    end if;
--EXCEPTION
    --exception_handling statements
END;
/




CREATE OR REPLACE TRIGGER dest_num
BEFORE INSERT ON service_transactions
FOR EACH ROW

WHEN (lower(new.service_transactions_type)='data')
BEGIN
    if (:new.destination_number) is not null then
        raise_application_error(-20000, 'Destination_number should always be NULL when the service_transactions_type is data');
    end if;
--EXCEPTION
    --exception_handling statements
END;
/




CREATE OR REPLACE TRIGGER plan_type_trig
BEFORE INSERT ON available_plans
FOR EACH ROW

BEGIN
    if lower(:new.plan_type) not in ('prepaid', 'postpaid') then
        raise_application_error(-20000, 'Please enter a valid plan_type - prepaid or postpaid ');
    end if;
--EXCEPTION
    --exception_handling statements
END;
/





CREATE OR REPLACE TRIGGER user_status_trig
BEFORE INSERT ON user_details
FOR EACH ROW

BEGIN
    if lower(:new.user_status) not in ('active', 'deactivated') then
        raise_application_error(-20000, 'Please enter a valid user_status - active or deactivated ');
    end if;
--EXCEPTION
    --exception_handling statements
END;
/



--------------------


 


CREATE OR REPLACE TRIGGER check_user_exist_trig
BEFORE INSERT ON user_plans
FOR EACH ROW

BEGIN
    IF check_user_exist (10036) = 0 THEN
    --not sure what to enter as the parameter
        DBMS_OUTPUT.PUT_LINE('User does not exist');
    END IF;
END;









CREATE OR REPLACE TRIGGER check_user_status_trig
BEFORE INSERT ON user_plans
FOR EACH ROW

BEGIN
    IF check_user_status (10036) = 0 THEN
    --not sure what to enter as the parameter
        DBMS_OUTPUT.PUT_LINE('User has been deactivated');
    END IF;
END;





CREATE OR REPLACE TRIGGER check_plan_exist_trig
BEFORE INSERT ON user_plans
FOR EACH ROW

BEGIN
    IF check_plan_exist (10036) = 0 THEN
    --not sure what to enter as the parameter
        DBMS_OUTPUT.PUT_LINE('Plan does not exist');
    END IF;
END;




CREATE OR REPLACE TRIGGER check_emp_exist_trig
BEFORE INSERT ON user_details
FOR EACH ROW

BEGIN
    IF check_emp_exist (10036) = 0 THEN
    --not sure what to enter as the parameter
        DBMS_OUTPUT.PUT_LINE('Employee does not exist');
    END IF;
END;




CREATE OR REPLACE TRIGGER check_payment_status_trig
BEFORE INSERT ON user_plans
FOR EACH ROW

BEGIN
    IF check_payment_status (70006) = 0 THEN
    --not sure what to enter as the parameter
        DBMS_OUTPUT.PUT_LINE('Payment failed');
    END IF;
END;



CREATE OR REPLACE TRIGGER user_insert_employee_check
BEFORE INSERT ON user_details
FOR EACH ROW

--[WHEN condition]
--DECLARE
--    declaration statements
BEGIN
    if LOWER(employee_dept(:new.emp_id)) != 'marketing' then
        raise_application_error(-20000, 'Please enter employee from marketing department ');
    end if;
--EXCEPTION
    --exception_handling statements
END;


-- Adding index

create index user_details_index on user_details ( user_id,emp_id,user_state );

create index employee_details_index on employee_details ( emp_id,dept_id );

create index service_transactions_index on service_transactions(user_id,plan_id)
 
--Inserting the data into USERS Table: 
--check the below code

execute users_insert(userid_seq.NEXTVAL,50002, 'elizabeth', 'rachel', '56 victoria street', 'hurley', 'mississippi', '02178', 'SSN',799400669,9635383643, 1.45, 'active');  

execute users_insert(userid_seq.NEXTVAL, 50003,'Brian', 'Carlson', '137 Coal Road', 'Philadelphia', 'Pennsylvania', '28716', 'SSN',975974574,5363926482, 2.3, 'active'); 

execute users_insert(userid_seq.NEXTVAL,50003, 'MIKE', 'ROSS', '46 WILSON LANE', 'DALLAS', 'TEXAS', '53829', 'SSN',712591346,4385640576, 32.2, 'active');   

execute users_insert(userid_seq.NEXTVAL,50002, 'Adam', 'Sandler', '257 Otter Avenue', 'Houstan', 'Texas', '43672', 'SSN',237904321,9045385530, 34.7, 'active'); 

execute users_insert(userid_seq.NEXTVAL,50002, 'tessa', 'thompson', '75 fleming way', 'delaware', 'ohio', '02384', 'SSN',393890269,8452956338, 2.43, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'andrew', 'garfield', '825 lucy lane', 'boston', 'massachusetts', '56227','SSN',708601148, 4385638359, 12.64, 'active');  

execute users_insert(userid_seq.NEXTVAL,50003, 'EMMA', 'STONE', '973 ESSEX LANE', 'TUCSON', 'ARIZONA', '73584','SSN',613921592 ,5392547606, 9.23, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'Taylor', 'Swift', '13 Oak Way', 'Burlington', 'Vermont', '15372','SSN', 225194478,6784668354, 52.6, 'active');  

execute users_insert(userid_seq.NEXTVAL,50003, 'TOM', 'HOLLAND', '96 COLLEGE AVENUE', 'PITTSBURGH', 'PENNSYLVANIA', '43672','SSN',226749374, 8564739254, 19.43, 'active');  

execute users_insert(userid_seq.NEXTVAL,50003, 'Zendaya', 'Thomas', '867 Clarklent Street', 'Highland', 'Kansas', '34527','SSN',166147527 ,3345604563, 18.32, 'active');  

execute users_insert(userid_seq.NEXTVAL,50003, 'Cole', 'Sprouse', '12 Shadow Drive', 'Columbus', 'Ohio', '57893', 'SSN',824244928,6443856398, 42.3, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'CHANDLER', 'BING', '8786 EDINGTON LANE', 'SPRINGFIELD', 'MASSACHUSETTS', '36642','SSN', 159380974,3495540648, 53.42, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'monica', 'geller', '86 marine drive', 'Portersville', 'Pennsylvania', '56278','SSN',599373475 ,7659335473, 13.54, 'active');  

execute users_insert(userid_seq.NEXTVAL,50003, 'Rachel', 'Green', '890 Patch Road', 'Washington', 'Washington DC', '97923', 'SSN',691359918,7583695638, 4.43, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'HARVEY', 'SPECTRE', '972 VITERO WAY', 'SACRAMENTO', 'CALIFORNIA', '96483', 'SSN',771857266,5374749547, 22.78, 'active');    

execute users_insert(userid_seq.NEXTVAL,50002, 'michael', 'scott', '57 terry lane', 'miami', 'florida', '65723', 'SSN',281099656,4874538563, 67.43, 'active');  

execute users_insert(userid_seq.NEXTVAL,50002, 'JIM', 'PARSON', '90 BARNES STREET', 'INDIANAPOLIS', 'INDIANA', '76742', 'SSN',853200975,6479479025, 44.94, 'active');  

execute users_insert(userid_seq.NEXTVAL, 'Pam', 'Beasly', '123 Jett Lane', 'Seattle', 'Washington', '34878', 'SSN',378868816,5382945638, 6.89, 'active');  

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



execute userplans_insert(10000,	15, TIMESTAMP '2021-12-22 00:08:53', 3); 

execute userplans_insert(10014,	14, TIMESTAMP '2021-12-30 01:18:21', 2); 

execute userplans_insert(10011,	9, TIMESTAMP '2022-01-12 02:36:12', 5); 

execute userplans_insert(10001,	6, TIMESTAMP '2022-01-17 03:43:31', 3); 

execute userplans_insert(10010,	3, TIMESTAMP '2022-02-02 04:32:32', 4); 

execute userplans_insert(10004,	4, TIMESTAMP '2022-03-13 05:12:45', 2); 

execute userplans_insert(10003,	2, TIMESTAMP '2022-03-20 06:56:49', 0); 

execute userplans_insert(10013,	5, TIMESTAMP '2022-04-15 07:32:12', 5); 

execute userplans_insert(10002,	1, TIMESTAMP '2022-05-27 08:01:09', 4); 

execute userplans_insert(10012,	7, TIMESTAMP '2022-06-04 09:02:11', 1); 

execute userplans_insert(10006,	12, TIMESTAMP '2022-06-09 10:23:13', 0); 

execute userplans_insert(10009,	14, TIMESTAMP '2022-07-01 11:42:27', 3); 

execute userplans_insert(10005,	3, TIMESTAMP '2022-08-16 12:52:57', 4); 

execute userplans_insert(10007,	11, TIMESTAMP '2022-09-03 13:13:16', 5); 

execute userplans_insert(10016,	10, TIMESTAMP '2022-09-17 14:16:02', 1); 

execute userplans_insert(10008,	6, TIMESTAMP '2022-09-21 15:08:25', 5); 

execute userplans_insert(10015,	3, TIMESTAMP '2022-10-11 16:26:00', 4); 

--check below

execute userplans_insert(10011,	8, TIMESTAMP '2022-10-15 17:23:16', 3); 

execute userplans_insert(10005,	13, TIMESTAMP '2022-11-09 18:15:56', 5); 

execute userplans_insert(10015,	7, TIMESTAMP '2022-11-19 19:05:37', 5); 

 

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

 
execute payments_insert(payment_seq.NEXTVAL, 10000, 618148198322, 877349343, 'JPMorgan Chase', 'Success', TIMESTAMP '2021-12-22 11:20:47',1); 

execute payments_insert(payment_seq.NEXTVAL, 10014 , 126764622433, 879692164, 'Bank of America', 'Success', TIMESTAMP '2021-12-30 21:32:32',2); 
 
execute payments_insert(payment_seq.NEXTVAL, 10011, 713360228687, 288523104, 'Capital One',	'Success', TIMESTAMP '2022-01-12 03:43:31',6); 

execute payments_insert(payment_seq.NEXTVAL, 10001 , 216224302122, 611802939, 'Bank of America', 'Success', TIMESTAMP '2022-01-17 12:21:53',4); 

execute payments_insert(payment_seq.NEXTVAL, 10010,	431832400139, 951531102, 'Capital One',	'Success', TIMESTAMP '2022-02-02 23:45:33',15); 

execute payments_insert(payment_seq.NEXTVAL, 10004,	607021983867, 594370977, 'JPMorgan Chase', 'Success', TIMESTAMP '2022-03-13 23:55:56',11); 

execute payments_insert(payment_seq.NEXTVAL, 10003,	126764622433, 326799525, 'Capital One', 'Success', TIMESTAMP '2022-03-20 11:10:02',12); 

execute payments_insert(payment_seq.NEXTVAL, 10013,	142013825466, 999102179, 'Bank of America', 'Success', TIMESTAMP '2022-04-15 12:14:31',1); 

execute payments_insert(payment_seq.NEXTVAL, 10002,	704752642195, 511838562, 'JPMorgan Chase', 'Success', TIMESTAMP '2022-05-27 21:56:21',7); 

execute payments_insert(payment_seq.NEXTVAL, 10012,	801276425953, 675442235, 'Bank of America', 'Success', TIMESTAMP '2022-06-04 04:32:40',8); 

execute payments_insert(payment_seq.NEXTVAL, 10006,	1371971315883530, 799400669, 'Bank of America',	'Success', TIMESTAMP '2022-06-09 00:20:00',9); 

execute payments_insert(payment_seq.NEXTVAL, 10009,	7108664375894540, 799400669, 'JPMorgan Chase', 'Success', TIMESTAMP	'2022-07-01 06:13:17',10); 

execute payments_insert(payment_seq.NEXTVAL, 10005,	5315383400606400, 975974574, 'PNC Financial Services', 'Success', TIMESTAMP '2022-08-16 18:48:34',10); 

execute payments_insert(payment_seq.NEXTVAL, 10007 , 3690859741294280, 712591346, 'Bank of America', 'Success', TIMESTAMP '2022-09-03 04:19:36',1); 

execute payments_insert(payment_seq.NEXTVAL, 10016,	3753066656896610, 237904321, 'Capital One',	'Success', TIMESTAMP '2022-09-17 04:45:22',4); 

execute payments_insert(payment_seq.NEXTVAL, 10008,	7004884170021630, 393890269, 'PNC Financial Services','Success', TIMESTAMP '2022-09-21 03:25:01',8); 

execute payments_insert(payment_seq.NEXTVAL, 10015,	8913576738049940, 708601148, 'Citigroup', 'Success', TIMESTAMP '2022-10-11 04:37:25',13); 

execute payments_insert(payment_seq.NEXTVAL, 10011,	1249498014817310, 613921592, 'JPMorgan Chase', 'Success', TIMESTAMP '2022-10-15 16:36:56',9); 

execute payments_insert(payment_seq.NEXTVAL, 10005,	8744336085399580, 225194478, 'Bank of America', 'Success', TIMESTAMP '2022-11-09 11:17:17',6); 

execute payments_insert(payment_seq.NEXTVAL, 10015,	6428948984576800, 166147527, 'JPMorgan Chase', 'Success', TIMESTAMP '2022-11-19 22:59:54',8); 

execute payments_insert(payment_seq.NEXTVAL, 10014,	126764622433, 879692164, 'Bank of America',	'Success', TIMESTAMP '2022-08-30 13:40:29',2); 

execute payments_insert(payment_seq.NEXTVAL, 10011,	713360228687, 288523104, 'Capital One',	'Success', TIMESTAMP '2022-01-14 15:21:32',13); 

execute payments_insert(payment_seq.NEXTVAL, 10001,	216224302122, 611802939, 'Bank of America', 'Success', TIMESTAMP '2022-09-17 01:41:26',7); 

execute payments_insert(payment_seq.NEXTVAL, 10010,	431832400139, 951531102, 'Capital One', 'Success', TIMESTAMP '2022-03-02 10:12:41',15); 

execute payments_insert(payment_seq.NEXTVAL, 10010,	431832400139, 951531102, 'Capital One', 'Success', TIMESTAMP '2022-06-02 17:41:24',1); 

execute payments_insert(payment_seq.NEXTVAL, 10010,	431832400139, 951531102, 'Capital One',	'Success', TIMESTAMP '2022-09-03 06:51:51',12); 

execute payments_insert(payment_seq.NEXTVAL, 10003,	126764622433, 326799525, 'Capital One',	'Success', TIMESTAMP '2022-03-27 12:09:05',14); 

execute payments_insert(payment_seq.NEXTVAL, 10006,	1371971315883530, 799400669, 'Bank of America', 'Success', TIMESTAMP '2022-09-10 22:08:53',14); 

execute payments_insert(payment_seq.NEXTVAL, 10007,	3690859741294280, 712591346, 'Bank of America',	'Success', TIMESTAMP '2022-10-03 03:18:21',7); 

execute payments_insert(payment_seq.NEXTVAL, 10007,	3690859741294280, 712591346, 'Bank of America',	'Success', TIMESTAMP '2022-11-04 03:18:21',9); 

execute payments_insert(payment_seq.NEXTVAL, 10001,	216224302122, 611802939, 'Bank of America',	'Failed', TIMESTAMP '2021-12-16 03:18:21',5); 

execute payments_insert(payment_seq.NEXTVAL, 10008,	1249498014817310, 613921592, 'JPMorgan Chase',	'Failed', TIMESTAMP '2022-08-22 03:18:21',8); 

execute payments_insert(payment_seq.NEXTVAL, 10011,	713360228687, 288523104, 'Capital One',	'Failed', TIMESTAMP '2021-09-05 03:18:21',11);

execute payments_insert(payment_seq.NEXTVAL, 10016,	3753066656896610, 237904321, 'Capital One',	'Failed', TIMESTAMP '2022-08-20 03:18:21',7);
 
execute payments_insert(payment_seq.NEXTVAL, 10013,	8744336085399580, 225194478, 'Bank of America',	'Failed', TIMESTAMP '2022-08-10 03:18:21',4);

commit;

 

--Inserting the data into Transactions Table: 


execute service_transactions_insert(transaction_seq.NEXTVAL,10002,'SMS',TIMESTAMP '2022-05-27 10:07:10',1,9875632100); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10002,'Call',TIMESTAMP '2022-05-27 20:21:05',10,876345901); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10002,'data',TIMESTAMP '2022-05-27 20:25:43',100,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10003,'SMS',TIMESTAMP '2022-03-21 20:22:10',1,8793456279); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10003,'Call',TIMESTAMP '2022-03-22 12:06:05',30,9873648528); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10003,'data',TIMESTAMP '2022-03-24 10:22:10',20,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10010,'SMS',TIMESTAMP '2022-02-13 15:01:06',1,8736368491); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10015,'data',TIMESTAMP '2022-10-24 15:20:00',8,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10004,'SMS',TIMESTAMP '2022-04-28 20:00:00',1,7859768013); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10010,'data',TIMESTAMP '2022-05-11 14:07:10',300,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10013,'SMS',TIMESTAMP '2022-08-06 11:10:12',1,9856489032); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10003,'data',TIMESTAMP '2022-04-12 19:20:02',20,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10001,'SMS',TIMESTAMP '2022-04-26 10:11:12',1,8378769981); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10001,'data',TIMESTAMP '2022-05-15 09:25:22',45,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10012,'SMS',TIMESTAMP '2022-07-07 15:20:10',1,9564389989); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10017,'data',TIMESTAMP '2022-11-20 07:28:30',67,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10018,'data',TIMESTAMP '2022-11-18 22:28:10',300,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'SMS',TIMESTAMP '2022-01-12 18:22:11',1,8861780690); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'Call',TIMESTAMP '2022-01-12 20:05:20',10,9978997883); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'data',TIMESTAMP '2022-01-12 20:20:11',20,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10006,'SMS',TIMESTAMP '2022-09-23 12:23:20',1,9247668933); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10016,'Call',TIMESTAMP '2022-09-18 20:04:10',15,8864907456); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10016,'data',TIMESTAMP '2022-09-20 23:10:00',400,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10007,'SMS',TIMESTAMP '2022-09-23 12:23:20',1,8765439088); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10007,'data',TIMESTAMP '2022-10-06 20:10:00',4,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10006,'SMS',TIMESTAMP '2022-07-17 03:20:10',1,9987664597); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10006,'data',TIMESTAMP '2022-09-29 08:11:08',60,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10019,'SMS',TIMESTAMP '2022-11-10 17:22:11',1,9876453214); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10019,'data',TIMESTAMP '2022-11-12 19:10:00',500,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10014,'SMS',TIMESTAMP '2022-03-12 22:22:11',1,8976787894); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10009,'data',TIMESTAMP '2022-08-15 20:16:08',50,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10000,'SMS',TIMESTAMP '2021-12-23 23:12:09',1,8578642237); 

commit; 


--newly added

execute service_transactions_insert(transaction_seq.NEXTVAL,10014,'data',TIMESTAMP '2022-09-10 12:32:21',23.64,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10014,'SMS',TIMESTAMP '2021-10-30 14:43:42',1,8578642237); 

commit;

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'SMS',TIMESTAMP '2022-02-10 12:32:21',1,7327452755); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'call',TIMESTAMP '2022-04-11 20:53:32',89,3427455527); 

commit;

execute service_transactions_insert(transaction_seq.NEXTVAL,10011,'call',TIMESTAMP '2022-04-11 20:56:55',120,3427455527); 

commit;

execute service_transactions_insert(transaction_seq.NEXTVAL,10001,'data',TIMESTAMP '2022-11-29 10:32:42',32.54,9835384427); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10010,'Call',TIMESTAMP '2022-07-07 12:13:00',235,5262899360); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10010,'data',TIMESTAMP '2022-08-03 03:31:54',12.53,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10010,'SMS',TIMESTAMP '2022-10-01 23:12:54',1,5628993001); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10007,'Call',TIMESTAMP '2022-12-03 01:32:43',63,8946382561); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10008,'data',TIMESTAMP '2022-10-01 21:31:43',32.54,NULL); 

commit; 

execute service_transactions_insert(transaction_seq.NEXTVAL,10008,'SMS',TIMESTAMP '2022-11-05 15:43:54',1,8358368243); 

commit; 


--------------------
--execute service_transactions_insert(transaction_seq.NEXTVAL,10000,'test',TIMESTAMP '2021-12-23 23:12:09',1,8578642237); 
--execute service_transactions_insert(transaction_seq.NEXTVAL,10008,'sms',TIMESTAMP '2022-11-05 15:43:54',2,8358368243); 
--execute service_transactions_insert(transaction_seq.NEXTVAL,10008,'data',TIMESTAMP '2022-11-05 15:43:54',2,8358368243); 




--(3) MASKING: 

--Masking the first 5 digits of SSN’s of users from users Table usinf dbms_redact.add_policy. 

 

 

begin 

  sys.dbms_redact.add_policy( 

  object_schema => 'USER_SR', 

  object_name => 'USER_DETAILS', 

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



select * from User_transaction_history where user_id=10006; 
--select * from user_plans where user_id=10006


--7th VIEW : plan_end_date : This view will give the plan's end date for a particular user
--change based on the latest plan - ithink its already done. check it


CREATE OR REPLACE VIEW plan_end_date(user_id, plan_id, plan_start_date, plan_end_date) 

as select u.user_id, u.plan_id, u.plan_start_date, u.plan_start_date+a.validity as plan_end_date
from user_plans u inner join available_plans a 
on a.plan_id=u.plan_id
order by u.plan_start_date desc;


select * from plan_end_date where user_id=10007
fetch next 1 rows only; 
 

 
--dropping tables not working
--(5) Dropping the tables


PURGE RECYCLEBIN; 
SET SERVEROUTPUT ON; 

BEGIN 

  DBMS_REDACT.drop_policy ( 

    object_schema => 'user_sr', 

    object_name   => 'user_details', 

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

EXECUTE IMMEDIATE 'DROP SEQUENCE  empid_seq '; 

EXECUTE IMMEDIATE 'DROP SEQUENCE  deptid_seq ';

EXECUTE IMMEDIATE 'DROP SEQUENCE  payment_seq '  ; 

EXECUTE IMMEDIATE 'DROP SEQUENCE transaction_seq ' ; 

EXECUTE IMMEDIATE 'DROP SEQUENCE  userid_seq ';

EXECUTE IMMEDIATE 'DROP SEQUENCE  avail_plans_seq '  ; 

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

EXECUTE IMMEDIATE 'DROP TABLE  EMPLOYEE_DETAILS' ;

EXECUTE IMMEDIATE 'DROP TABLE DEPARTMENT' ; 

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

select * from transactions;
select * from available_plans;
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




--transactions based on a certain plan

select * from transactions order by user_id

select * from transactions where user_id=10010
select * from user_plans where user_id=10010








 