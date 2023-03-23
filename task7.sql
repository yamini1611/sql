create database task7
use task7

CREATE TABLE students (
  studentid INT PRIMARY KEY,
  studentname VARCHAR(50),
  department VARCHAR(50),
  score INT
);

INSERT INTO students (studentid, studentname, department, score) VALUES
(1, 'yamini', 'bca', 85),
(2, 'meena', 'bcom', 92),
(3, 'amutha', 'bsc', 76),
(4, 'jawahar', 'bca', 89),
(5, 'praveen', 'bsc ct', 78),
(6, 'kumaran', 'BE ', 91),
(7, 'uma', 'bsc', 84),
(8, 'padhu', 'bca', 72),
(9, 'ragav', 'Bsc physcology', 87),
(10, 'viku', 'BE', 80),
(11, 'susmitha', 'bca', 93),
(12, 'sowgan', 'bcom', 75),
(13, 'pooja', 'bsc Sociology', 88),
(14, 'harishmitha', 'bsc Political Science', 82),
(15, 'ranita', 'bsc Anthropology', 79),
(16, 'harita', 'bsc Geography', 86),
(17, 'vicky', 'bsc Philosophy', 73),
(18, 'kadar', 'bsc Communications', 90),
(19, 'sangu', 'bcom  Marketing', 77),
(20, 'deeps', 'bcom Finance', 83),
(21, 'kavya', 'bcom Management', 81),
(22, 'aruna', 'bcom Accounting', 74),
(23, 'charishma', 'bcom Human Resources', 85),
(24, 'priya', 'bcom Supply Chain Management', 89),
(25, 'angel', 'bcom Operations Management', 76);

select * from students

--1. Create a non-clustered index for department.

CREATE INDEX dept_index ON students(department ASC)

--2. Create a filtered index for department='BCA'

CREATE NONCLUSTERED INDEX filtered_index ON students (department) WHERE  department='BCA'

--3. Create a view for students in BCA department.

create VIEW std_views AS Select * From students where department='bca';

select* from std_views
--4. Apply Rank() for all the students based on score.

SELECT studentid,studentname,department,score,
RANK () OVER (ORDER BY score desc) AS Rank_list   
FROM students; 

--5. Apply Dense_Rank() for students in each department based on score.

SELECT studentid,studentname,department,score,
DENSE_RANK() OVER (ORDER BY score desc) AS Rank_list   
FROM students; 

--2). Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).

CREATE TABLE Manager (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    mid INT ,
    department VARCHAR(50),
    CONSTRAINT fk_Manager FOREIGN KEY (mid)
        REFERENCES Manager(id)
        
);

-- Insert records into Manager table
INSERT INTO Manager (id, name)
VALUES
  (1, 'yamini'),
  (2, 'meena'),
  (3, 'amutha');

-- Insert records into Employee table
INSERT INTO Employee (eid, ename, mid, department)
VALUES
  (101, 'jawahar', 1, 'Sales'),
  (102, 'praveen', 2, 'Marketing'),
  (103, 'kumaran', 1, 'Accounting'),
  (104, 'uma', 3, 'HR'),
  (105, 'viku', 2, 'IT');

  select * from Manager
  select * from Employee

--1. Create a complex view by retrieving the records from Manager and Employee table.

  create view meview
as
SELECT m.id, m.name, e.ename, e.eid,e.department,e.mid
FROM Manager AS m
   FULL JOIN
   Employee AS e
   ON m.id =e.mid

select * from meview

--2. Show the working of 'on delete cascade on update set default' for the above tables

alter table employee drop constraint [fk_Manager]
alter table employee drop column mid
alter table employee  add mid int default 2 constraint fk_manag foreign key(mid) references manager(id) on update set default 

update employee set mid=1 where eid=101
update employee set mid=2 where eid=102
update employee set mid=3 where eid=103
update employee set mid=2 where eid=104
update employee set mid=3 where eid=105

update manager set id=4 where id=1