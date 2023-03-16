--create table with constraints
CREATE table tasks
( tname varchar(20),
id int,
age int check(age>=18),
course varchar(20) default 'full stack ')
insert into tasks values('yamini',101,20,'front end' )
insert into tasks values('meenu',102,26,'credit analyst' )
insert into tasks values('ammu',103,50,'taxing' )
--create schema
create schema cgvak
--create table
CREATE table  cgvak.tasks
( tname varchar(20),
id int,
age int check(age>=18),
course varchar(20) default 'full stack ')
--inserting values
insert into cgvak.tasks values('yamini',101,20,'front end' )
insert into cgvak.tasks values('meenu',102,26,'credit analyst' )
insert into cgvak.tasks values('ammu',103,50,'taxing' )
--create schema
create schema cgvak1

--rename a schema 
alter schema  cgvak1 transfer cgvak.tasks
--delete schema
drop schema cgvak

--rename table
EXEC sp_rename 'tasks2', 'tasks3'
--table with identity 
select * from tasks3
create table sqltask2
(
id int identity(100,1),
name  varchar(20) unique,
salary int ,
increment int,
)
insert into sqltask2(name,salary,increment) values('yamini',50000,2500)
insert into sqltask2(name,salary,increment) values('meenu',70000,5000)
insert into sqltask2(name,salary,increment) values('ammu',90000,2000)
insert into sqltask2(name,salary,increment) values('appu',80000,2500)

--rename database
alter database [sqltask] modify name = [task2]

--computed column
alter table sqltask2 add revisedsalary as (salary + ' ' + increment)
select * from sqltask2

--moving multiple rows into new table
select * into highersalaries from sqltask2 where revisedsalary>20000
select * from highersalaries