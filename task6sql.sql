--create database task6

create database task6
use task6

--create table salesman

create table salesman
(salesman_id int ,
name varchar(20),
city varchar(20),
commision float)

--insert values

insert into salesman values(5001,'yamini','cbe',0.15),(5002,'meena','chennai',0.13),(5005,'amutha','bangalore',0.11),(5006,'jawahar','chennai',0.14),(5007,'viku','hydrabad',0.13),(5003,'praveen','mumbai',0.12)

select * from salesman

--create customer table 

create table customer
(customer_id int,
cust_name varchar(20),
city varchar(20),
grade int ,
salesman_id int)

--insert values

insert into customer values(3002,'Nick Rimando','cbe',100,5001),(3007,'Brad Davis','cbe',200,5001),(3005,'Graham Zusi','madurai',200,5002),(3008,'Julian Green','banglore',300,5002),(3004,'Fabian Johnson','chennai',300,5006),(3009,'Geoff Cameron','trichy',100,5003),(3003,' Jozy Altidor','salem',200,5007)
insert into customer (customer_id ,cust_name ,city ,salesman_id)values(3001,' Brad Guzan','bangalore',5005)

select * from customer

--create table orders

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(8,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);

select * from orders

/*1. From the above tables write a SQL query to find the salesperson andcustomer who reside in the same city.
Return Salesman, cust_name and city.*/

SELECT s.name, c.cust_name, c.city , s.commision , s.salesman_id
FROM salesman s
inner JOIN customer c ON s.city = c.city and s.salesman_id=c.salesman_id

/*2. From the above tables write a SQL query to find salespeople who received commissions of
more than 12 percent from the company.
Return Customer Name, customer city, Salesman, commission.*/

select * from salesman
SELECT s.name , c.cust_name,c.city,s.commision 
from salesman s
INNER JOIN customer c  ON s.salesman_id = c.salesman_id where commision>0.12

/*3. From the above tables write a SQL query to find the details of an order.
Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman,
commission.*/

select o.ord_no , o.ord_date , o.purch_amt , c.cust_name , c.grade , s.name , s.commision ,o.customer_id , c.salesman_id
from orders o
inner join
customer c
ON o.customer_id =c.customer_id
inner join 
salesman s
ON s.salesman_id=c.salesman_id

/*4.From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000.
Return ord_no, purch_amt,cust_name, city.*/

select o.ord_no , o.purch_amt,c.cust_name , c.city
from orders o
inner join  
customer c 
ON o.customer_id=c.customer_id where purch_amt <2000 and purch_amt > 500

/*5. From the above tables write a SQL query to display the customer name,customer city, grade, salesman, salesman city. 
The results should be sorted by ascending customer_id.*/

select   c.customer_id , c.cust_name , c.city , c.grade , s.name , s.city 
from customer c 
inner join  
salesman s 
ON c.salesman_id=s.salesman_id order by customer_id 




