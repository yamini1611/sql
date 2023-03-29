create database task12
use task12

--create table employee

create table employee 
(id int primary key,
first_name varchar(20),
last_name varchar(20))

--create table country

create table country(
c_id int primary key ,
country_name varchar(20),
country_name_eng varchar(20),
country_code varchar(20))

--create table city
create table city(
city_id int primary key,
cname char(20),
lat decimal,
long decimal,
c_id int  references  country(c_id) 

)

create table customer
(
cus_id int primary key,
name varchar(20),
city_id int references city(city_id),
cus_address varchar(20),
next_call_date date not null,
ts_inserted datetime)


create table call(
call_id int primary key,
id int  references employee(id),
cus_id int references customer(cus_id),
start_time datetime,
end_time datetime not null,
call_outcome_id int not null references call_outcome(id))

create table call_outcome(
id int primary key,
outcome_text varchar(20))

