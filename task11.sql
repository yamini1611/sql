create database task10
use task10
--create table employees
CREATE TABLE employees (
    EMPLOYEE_ID   INT,
    FIRST_NAME    VARCHAR(50),
    LAST_NAME     VARCHAR(50),
    EMAIL         VARCHAR(100),
    PHONE_NUMBER  VARCHAR(20),
    HIRE_DATE     DATE,
    JOB_ID        int,
    SALARY        DECIMAL(10, 2)
);

INSERT INTO employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY)
VALUES
    (100, 'yamini', 'priya', 'yaminipriya@gmail.com', '555-123-4567', '2023-01-15', 1, 80000.00),
    (101, 'ranita', 'nagarajan', 'ranitan@gmail.com', '555-234-5678', '2023-02-20',2 , 75000.00),
    (102, 'harishmitha', 'saran', 'harishmithasaran@gmail.com', '555-345-6789', '2023-03-05',3, 65000.00),
    (103, 'harita', 'nagarajan', 'haritan@gmail.com', '555-456-7890', '2023-04-10',4, 80000.00),
    (104, 'vignesh', 'R', 'vicky@example.com', '555-567-8901', '2023-05-15',5, 75000.00),
    (105, 'dhana', 'prakash', 'dhanaprakash@example.com', '555-678-9012', '2023-06-20', 6, 70000.00),
    (106, 'arjun', 'venket', 'arjunvenket@example.com', '555-789-0123', '2023-07-25', 7, 80000.00),
    (107, 'arun', 'joseph', 'arunjoseph@example.com', '555-890-1234', '2023-08-30',8, 60000.00),
    (108, 'selva', 'ganapathy', 'selva@example.com', '555-901-2345', '2023-09-05',9, 58000.00),
    (109, 'srikanth', 'K', 'srikanth@example.com', '555-012-3456', '2023-10-10', 10, 70000.00),
    (110, 'priya', 'dharshan', 'priyadharshan@example.com', '555-123-4567', '2023-11-15',11, 35000.00),
    (111, 'karthikeyan', 'N', 'karen.white@example.com', '555-234-5678', '2023-12-20', 12, 40000.00),
    (112, 'siva', 'bharath', 'siva@example.com', '555-345-6789', '2023-01-15', 13,56000.00),
	(113, 'hari', 'karthik', 'hari@example.com', '555-345-6789', '2023-01-17', 14,46000.00),
    (114, 'vikram', 'M', 'vikram@example.com', '555-345-6789', '2023-01-19', 15,80000.00),
    (115, 'vasanth', 'H', 'vasanth@example.com', '555-345-6789', '2023-01-23', 16,26000.00),
    (116, 'sharon', 'David', 'sharon@example.com', '555-345-6789', '2023-01-25',17,76000.00),
    (117, 'divya', 'prakash', 'divyaprakash@example.com', '555-345-6789', '2023-01-12',18,36000.00),
    (118, 'hemanth', 'J', 'hemanth@example.com', '555-345-6789', '2023-01-15',19,66000.00),
    (119, 'harshan', 'K', 'harshan@example.com', '555-345-6789', '2023-01-15', 20,56000.00)
    
--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

SELECT first_name , last_name , salary
    FROM employees
   WHERE salary>(select salary from employees where job_id=16); 

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
select FIRST_NAME , LAST_NAME , JOB_ID from employees
where HIRE_DATE =(select HIRE_DATE from employees where EMPLOYEE_ID=11)

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select EMPLOYEE_ID ,FIRST_NAME,LAST_NAME  from  (select avg(salary) as average_salary from employees) as a , employees e
where e.SALARY>a.average_salary

--4. Write a SQL query to find those employees who report to that manager whose first name is "Yamini".
-- Return first name, last name, employee ID and salary.

select  FIRST_NAME,  LAST_NAME , EMPLOYEE_ID , SALARY from employees where first_name=
(select FIRST_NAME from employees where FIRST_NAME='yamini')

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500.
--Return all the fields.

select * from employees where salary >=(select MIN(salary) from employees ) and SALARY<=50000


