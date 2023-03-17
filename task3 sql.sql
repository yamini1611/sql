--create database task3

create database task3
use task3

--create table department

create table department
(
deptid int primary key,
deptname varchar(20)
)

--create table address

create table Address
(
address_id  int primary key,
city varchar(20),
state varchar(20),
pincode int
)

--create table employee

create table employee
(id int primary key not null ,
name varchar(20) unique not null,
designation varchar(20) ,
mobile1 bigint ,
mobile2 bigint ,
street_address varchar(20),
deptid int references department(deptid),
address_id int  references Address(address_id)
)

--insert department values

insert into department values(100,'developer'),(101,'UI/UX')
select * from department

--insert address values

insert into Address values (1,'mannford','okalahoma(OK)',74044),(2,'sidney','ohio(OH)',45365)
select * from Address

--insert employee values

insert into employee values(1,'John','Developer',9944050247,8870795332,'234 Hinton Rd',100,1 )
insert into employee (id,name,designation,mobile1,street_address,deptid,address_id)values(2,'Jamie','Designer',8885858585,'214 doorley Rd',101,2 )
insert into employee values(3,'Jack','Developer',1234567890,2525147485,'236 Hinton Rd',100,1 )

select * from employee