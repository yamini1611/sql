create database task15

CREATE TABLE Students (
    student_id INT  PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255)  UNIQUE,
    phone VARCHAR(15) ,
    address VARCHAR(255) 
);

--auto-commit ->Commands completed successfully.

insert into Students values(1,'yamini','abc@gmail.com',9944050247,'12,vsk'),(1,'priya','abc@gmail.com',9944050247,'12,vsk')

--auto-rollback ->error message bcoz of primary key violation

--implicit transaction

set IMPLICIT_TRANSACTIONS on
insert into Students values(1,'yamini','abc@gmail.com',9944050247,'12,vsk'),(2,'priya','abc1@gmail.com',9944050247,'12,vsk')
SELECT IIF(@@OPTIONS & 2 = 2,'IMPLICIT ON','IMPLICIT OFF') AS ISIMPLICITON

SELECT
	@@TRANCOUNT AS TRANSACTION_COUNT -- RETURNS 1 BECAUSE TRANSACTION IS ACTIVE

COMMIT

SELECT
	@@TRANCOUNT AS AFTER_TRANSACTION_COUNT	--RETURNS 0 BECAUSE TRANSACTION IS COMMITTED

SET IMPLICIT_TRANSACTIONS OFF

--explicit transaction
--only commit -insert statement

begin tran

insert into Students values(3,'meena','abc2@gmail.com',9944050247,'12,vsk'),(4,'lochini','abc3@gmail.com',9944050247,'12,vsk')

SELECT
	@@TRANCOUNT AS TRANSACTION_COUNT -- RETURNS 1 BECAUSE TRANSACTION IS ACTIVE

COMMIT

SELECT
	@@TRANCOUNT AS AFTER_TRANSACTION_COUNT	--RETURNS 0 BECAUSE TRANSACTION IS COMMITTED

--rollback -

begin tran

select * from Students

update Students set  student_id=6 where  student_id=2

SELECT * FROM Students -- CHANGES WILL BE APPILIED BUT

ROLLBACK TRAN --THIS WILL ROLL BACK THE TRANSACTION

SELECT * FROm Students

--savepoint -update , delete , insert

begin tran

update Students

set  name='amutha' where name='yamini'

insert into Students values(5,'jawahar','abs@gmail.com',8885525555,'12, vsk nagar')

SAVE TRANSACTION UPDATE_INSERT --UNTILL THIS TRANSACTIONS WILL BE SAVED

delete students where student_id=1

select * from Students

ROLLBACK TRAN UPDATE_INSERT

COMMIT

select * from Students