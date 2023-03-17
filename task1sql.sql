CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
select * from Trainees

insert into Trainees values(1001,'yamini','priya',85000,2023/01/22,'full stack ')
insert into Trainees values(1002,'meenu','priya',95000,2017/07/22,'credit analyst '),
(1003,'viku','kupusamy',85000,2024/07/22,'mechanical engineer '),
(1004,'ranita','nagarajan',75000,2023/01/22,'front end'),
(1005,'harishmitha','saran',85000,2023/01/22,'back end '),
(1006,'harita','nagarajan',85000,2023/01/22,'full stack '),
(1007,'ammu','jawahar',95000,1995/05/22,'taxing '),
(1008,'jawahar','ramachandran',105000,1990/04/22,'auditor'),
(1009,'uma','ps',75000,2000/03/12,'professor'),
(1010,'sandhya','mano',105000,2016/07/22,'tester'),
(1011,'ramya','mano',95000,2015/07/22,'software engineer '),
(1012,'praveen','narayansamy',85000,2025/07/12,'software engineer '),
(1013,'kumaran','ramesh',85000,2018/07/22,'technical engineer '),
(1014,'ragav','narayansamy',75000,2019/07/20,'safety engineer '),
(1015,'sowgan','suresh',75000,2022/07/22,'credit analyst '),
(1016,'aravind','swamy',95000,2003/07/28,'software engineer '),
(1017,'deepak','swamy',65000,2010/07/22,'quality engineer '),
(1018,'babisha','murali',65000,2023/07/02,'software engineer '),
(1019,'swetha','krishnan',55000,2023/07/22,'tester'),
(1020,'pooja','mk',45000,2023/07/23,'developer')

select * from  Trainees where FIRST_NAME LIKE '%[j-t]'  COLLATE SQL_Latin1_General_CP1_CS_AS;

SELECT *  from  Trainees where SALARY between 20000 and 50000;
select * from Trainees where FIRST_NAME like '%i';
select  distinct salary from Trainees;
select * from Trainees 
update Trainees set DEPARTMENT='designer' where Trainee_ID=1013;
select * from  Trainees where Department =  'designer' or  Department =   'developer';
select top 5 with ties SALARY, FIRST_NAME from Trainees order by SALARY
select * from Trainees order by DEPARTMENT desc 
select * from Trainees  where LAST_NAME like '__a%'
 select * from Trainees where FIRST_NAME like '%[J-T]' COLLATE SQL_Latin1_General_CP1_CS_AS;