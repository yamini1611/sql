create database task10library

--create library table

create table library
(
library_id int primary key,
licence varchar(25),
book_id int foreign key references  Books(book_id),
student_id int foreign key references  Students(student_id)
 );

 --create books table

CREATE TABLE Books (
    book_id INT  PRIMARY KEY,
    title VARCHAR(255) ,
    author VARCHAR(255),
    publication_date DATE ,
    quantity INT NOT NULL DEFAULT 1
);

--create students table

CREATE TABLE Students (
    student_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)  UNIQUE,
    phone VARCHAR(15) ,
    address VARCHAR(255) 
);

--insert rows into tables

insert into Students values(101,'yamini','yamini@gmail.com',9944050247,'12 , vsk nagar ,cbe'),
(102,'meena','meena@example.com ',8858558556,'23,vsk nagar , vadamadurai')

insert into Books values(1,'holy spirit','amutha','2023-12-22',5),(2,'ps','kalki','2023-2-23',2)

insert into library values(11,'registered',1,101),(12,'government owned',2,102)

select * from library
select * from Students
select * from Books


--on update set default

alter table library drop [FK__library__student__47DBAE45]
alter table library drop column student_id
alter table library add student_id int default 101 constraint fk_libstd references  students(student_id) on update set default

update library set student_id=101 where library_id=11
update library set student_id=102 where library_id=12
insert into library values(13,'registered',1,102)

update Students set student_id=104 where student_id=102