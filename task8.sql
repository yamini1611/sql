create database task8
use task8

--create table
create table std (studentid int identity(1,1), studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)

--insert rows 
insert into std values('yamini','sem 5',457,500),('meenu','sem 3',485,500),('amutha','sem 1',456,500),('jawahar','sem 1',425,500),('praveen','sem 2',412,500)

--Create User-define Scalar function to calculate percentage of all students after creating the following table.
create  function calpercent(@mark int,@totalmarks int)
returns int
as
begin
declare @per int
set @per=((@mark * 100)/@totalmarks)
return @per
end

--function call
select   dbo.calpercent(securedmarks,totalmarks)  as percentage  from  std;

-- Create user-defined function to generate a table that contains result of Sem 1 students
create function sem1res(@sem varchar(20))
returns table 
as
return (select * from dbo.std where semester = @sem)
--function call 
select * from sem1res('sem 1');

--. Write SQL stored procedure to retrieve all students details. (No parameters)

create procedure sp_std_details
as
begin
select * from std;
end
--procedure execution 
exec sp_std_details

--Write SQL store procedure to display Sem 1 students details.

create procedure sp_std_details2(@semresult varchar(20))
as 
begin 
select * from std where (semester = @semresult )
end

exec sp_std_details2'sem 2';

--Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure sp_stud_details3(@semres varchar(20) output) 
AS
BEGIN
select COUNT(STUDENTID)AS TOTAL_STUDENTS FROM std
end

declare @total int
exec sp_stud_details3 @total output
print @total

-- Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--TARGET TABLE
select*into backup_std from std

select * from backup_std
select * from std

insert into std values('ranita','sem 1',400,500)
insert into backup_std values('viku','sem 3 ',450,500)

--merge statement
merge backup_std b using (select * from std where semester = 'sem 1')as s
on (s.studentid =b.studentid)
when matched 
then update set
b.studentname = s.studentname,
b.semester = s.semester,
b.securedmarks = s.securedmarks,
b.totalmarks = s.totalmarks
when not matched by target
then insert (studentname, semester, securedmarks, totalmarks)
values(s.studentname,s.semester,s.securedmarks,s.totalmarks)
when not matched by source
then delete;

drop table backup_std

--task9

--Write a Stored Procedure in SQL using conditional statements to search for a record from the students table
--(created in SQL Task 8) based on studentname column.

create procedure sp_conditional1(@name varchar(20))
as
begin
if((select studentname from std where studentname = @name)=@name)
begin
 print 'student name is ' + @name;
 end
else 
begin
print 'student name' + @name +'is not found';
end
end
exec sp_conditional1'meenu'

--Write a Stored procedure in SQL to give remarks for the secured marks column in the students table
--(created in SQL Task 8) using CASE statement.

create procedure sp_remarks5
as
begin 
 SELECT studentid, studentname , securedmarks ,
CASE
    WHEN securedmarks > 490  then 'great job'
    WHEN securedmarks > 470 and securedmarks<490 then 'good job aim higher'
	when securedmarks <470  and securedmarks <450  then 'concentrate on concepts'
	when securedmarks <450then 'need more improvement'
    ELSE 'need more efforts'
END AS remarks
FROM std
end

exec sp_remarks5

-- Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--local table

CREATE TABLE #localtable(
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
insert into #localtable values (101,'yamini','priya','vsk nagar','cbe')

--global table

CREATE TABLE ##globaltable(
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
insert into ##globaltable values(101,'yamini','priya','vsk nagar','cbe')
select * from #localtable
select * from ##globaltable

--local procedure
create procedure #sp_local_procedure
as
begin
print 'hello local procedure'
end

exec #sp_local_procedure

--global procedure
create procedure ##sp_global_procedure
as
begin
print 'hello global procedure'
end

exec ##sp_global_procedure

--local temporary variables

Declare @studen table (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into @studen values(1,'yamini','sem 5',457,500),(2,'meenu','sem 3',485,500),(3,'ammu','sem 1',456,500),(4,'jawahar','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from @studen

--global temporary variables

Declare @@studen table (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into @@studen values(1,'yamini','sem 5',457,500),(2,'meenu','sem 3',485,500),(3,'ammu','sem 1',456,500),(4,'jawahar','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from @@studen
