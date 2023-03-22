create database task5

use task5

CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'yamini', 'priya', 80000, '2023-01-20', 'full stack '),
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--1. Write an SQL query to get the count of employees in each department.

SELECT COUNT(fullname) as 'No of Employees', DEPARTMENT FROM Trainees GROUP BY DEPARTMENT

--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

 SELECT DATEADD(DAY , 5,'2023-03-20')as induction_date

 --3. Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.

 SELECT TRAINEE_ID,FIRST_NAME,
      CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
      'July','August','September','October','November','December') AS MONTH
  FROM Trainees;

--4. Write an SQL query to perform the total and subtotal of salary in each department.

  SELECT coalesce (department, 'All Departments') AS Department,
  sum(salary) as Total_salary
  FROM Trainees
  GROUP BY ROLLUP (department)

--5. Write an SQL query to retrieve first 3 records randomly.

SELECT TOP 3 *
FROM Trainees
ORDER BY NEWID()

--6. Show the working of composite key with any example.

CREATE TABLE student
(rollNumber INT, 
name VARCHAR(30), 
designation VARCHAR(30), 
 
mobile VARCHAR(10),
salary INT,
PRIMARY KEY (rollNumber, mobile));

INSERT INTO student  VALUES (1, 'yamini','full stack developer', 9988774455,85000);
INSERT INTO student  VALUES (2, 'meenu','credit analyst', 9988112233,95000);
INSERT INTO student  VALUES (3, 'appu','auditor', 9988777755,125000);
INSERT INTO student  VALUES (4, 'amutha','taxing',  9955663322,125000);

--7. Show the working of IIF and CASE for the above table.

--CASE

select * from student
SELECT name,designation, salary,
CASE designation 
    WHEN 'taxing ' THEN 'EIFCO TAXING DEPARTMENT'  
    WHEN 'credit analyst' THEN 'FORD  ACCOUNTS DEPARTMENT'  
    WHEN 'auditor' THEN 'AQUASUB AUDIT  DEPARTMENT'  
    ELSE 'CGVAK DEVELOPER DEPARTMENT'  
END AS Department
FROM student;  

--IIF

select *, iif(designation ='auditor', 'experienced' ,'fresher') from student 

--8. Show the working of Sequence.

CREATE SEQUENCE [dbo].[SequenceObject]
AS INT
START WITH 1 
INCREMENT BY 1 

CREATE TABLE Employees
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);

INSERT INTO Employees VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'YAMINI', 'FEMALE');
INSERT INTO Employees VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'MEENU', 'Female');

select * from employees;

--9. Show the working of creation of Synonym for a table in DB1 from DB2.

USE TASK4
create schema db
CREATE TABLE db.Employees1
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);

INSERT INTO db.Employees1 VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'YAMINI', 'FEMALE');
INSERT INTO db.Employees1 VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'MEENU', 'Female');

select * from db.Employees1;

CREATE SYNONYM T FOR task5.db.Employees1

select * from T

--10. Show the working of IDENTITY_INSERT.

create table Departments
(
id int IDENTITY (1,1) primary key,
Dept_id int,
Dept_name varchar(25)
)

insert into Departments(Dept_id,Dept_name) values(101,'full stack '),(102,'backend'),(103,'database'),(104,'Testing'),(105,'HR')
SET IDENTITY_INSERT Departments off 
insert into Departments(Dept_id,Dept_name) values(106,'frontend')
select * from Departments
SET IDENTITY_INSERT Departments on
insert into Departments(id,Dept_id,Dept_name) values(7,107,'frontend')
