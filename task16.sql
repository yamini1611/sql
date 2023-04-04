create database task16

CREATE TABLE Students (
    student_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)  UNIQUE,
    phone VARCHAR(15) ,
    address VARCHAR(255) 
);

insert into Students values(1,'yamini','abc@gmail.com',9944050247,'12,vsk'),(2,'priya','abc1@gmail.com',9944050247,'12,vsk')
insert into Students values(3,'meena','abc2@gmail.com',9944050247,'12,vsk'),(4,'lochini','abc3@gmail.com',9944050247,'12,vsk')

select * from Students

truncate table  Students

--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.
alter  trigger res1
on students
for update , insert , delete
as
begin
if datepart(dw,GETDATE()) in (1,7)

begin

print 'DML operations are restricted on saturday and sunday'
ROLLBACK TRANSACTION
end

end

drop trigger res1
insert into students values (11,'meena1','abcdjf2@gmail.com',9944050247,'12,vsk'),(10,'lodfchini','abrgrjc3@gmail.com',9944050247,'12,vsk')

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM
alter TRIGGER  re
ON students
FOR DELETE
AS
BEGIN
  IF DATEPART(HH,GETDATE()) > 11 and  DATEPART(HH,GETDATE()) < 15
  BEGIN
    PRINT 'CANNOT PERFORM DELETE OPERATION BETWEEN 11AM AND 15PM'
    ROLLBACK TRANSACTION
  END 
END

DELETE FROM STUDENTS WHERE student_id = 1
drop trigger re

--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

create trigger ddl_trigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE,RENAME
as
begin
print 'you are performing a ddl command'
end
create table dep1(emp_id int,emp_name varchar(19))
exec sp_rename 'dep1','yaminiii';
drop table yamini;

