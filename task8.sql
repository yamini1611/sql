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
then update set b.studentname = s.studentname
when not matched by target
then insert (studentname, semester, securedmarks, totalmarks)
values(s.studentname,s.semester,s.securedmarks,s.totalmarks)
when not matched by source
then delete;

