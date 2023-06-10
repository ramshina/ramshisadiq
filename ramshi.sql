create database flipkart;

use flipkart;

create table branch (branch_no int primary key ,manager_id int ,branch_address varchar (50) ,contact_no int);

insert into branch(branch_no,manager_id,branch_address,contact_no)values
(1,101,'sm street,calicut',213456789),
(2,102,'panampalli nagar,kochi',819445612),
(3,103,'perinthalmanna road ,malappuram',21316549),
(4,104,'koyilandy ,calicut',416213987),
(5,105,'vithura street,trivantram',819564123);

create table employee (emp_id int primary key , emp_name varchar (50),position varchar(20),salary decimal(10,2));

insert into employee (emp_id ,emp_name, position, salary)values
(101,'pranav','manager',20000),
(102,'kiran','incharge',8000),
(103,'anandu','accountant',15000),
(104,'anu','cashier',10000),
(105,'varun','security',5000);

create table customer (customer_id int primary key,customer_name varchar(30),customer_address varchar(50),reg_date date);

insert into customer (customer_id,customer_name,customer_address,reg_date)values
(1,'saran','888street','2023-01-01'),
(2,'sara','919street','2023-02-01'),
(3,'aryan','second street','2023-03-01'),
(4,'anu','sm street','2023-04-01'),
(5,'nivin','1 street','2023-05-01');

create table books (isbn varchar(20)primary key ,book_title varchar (100),category varchar(50),
rental_price decimal (10,2),status enum ('yes','no'),author varchar (100) ,publisher varchar(100));

insert into books (isbn ,book_title,category ,
rental_price ,status,author,publisher ) values 
('isbn1','aladdin and magic lamp','kids book',55.00,'yes','hanna','express publishing'),
('isbn2',' wings of fire','autobiography',115.00,'yes','apj abdul kalam','universities press'),
('isbn3','khasakinte ithihasam','novel',105.00,'no','o v vijayan','current books '),
('isbn4','macbeth','novel',200.00,'yes','shakespeare',' edward publishing'),
('isbn5','kids story','kids book',20.00,'no','kiran','xy publishers');

create table issuestatus(issue_id int primary key,issued_cust int,issued_book_name varchar(100),
issue_date date, isbn_book varchar (20), foreign key(issued_cust)references customer(customer_id),
foreign key (isbn_book )references books (isbn));

insert into issuestatus(issue_id,issued_cust ,issued_book_name,issue_date, isbn_book)values
(1,1,'aladdin and magic lamp','2020-01-01','isbn1'),
(2,2,'wings of fire','2020-02-01','isbn2'),
(3,3,'khasakinte ithihasam','2020-03-01','isbn3'),
(4,4,'macbeth','2020-04-01','isbn4'),
(5,5,'kids story','2020-05-01','isbn5');

create table returnstate(return_id int primary key,return_cust int,return_book_name varchar(100),
return_date date, isbn_book2 varchar (20), foreign key(return_cust)references customer(customer_id),
foreign key (isbn_book2 )references books (isbn));

insert into returnstate(return_id ,return_cust ,return_book_name,return_date , isbn_book2)values
(1,1,'aladdin and magic lamp','2020-01-10','isbn1'),
(2,2,'wings of fire','2020-02-15','isbn2'),
(3,3,'khasakinte ithihasam','2020-03-20','isbn3'),
(4,4,'macbeth','2020-04-25','isbn4'),
(5,5,'kids story','2020-05-30','isbn5');

select book_title ,category,rental_price from books where status ='yes';

select emp_name,salary from employee order by salary desc;

select b.book_title,c.customer_name
from issuestatus i
join books b on i. isbn_book = b.isbn
join customer c on i.issued_cust= c.customer_id;

select category,count(*)as book_count
from books
group by category;

select emp_name,position from employee
where salary > 50000;

select customer_name from customer
where reg_date<'2022-01-01'
and customer_id not in (select issued_cust from issuestatus);

select b.branch_no ,count(*) as total_count
from employee e
join branch b on e.emp_id = b.manager_id = e.emp_id
group by b.branch_no;

select c.customer_name from customer c 
join issuestatus i on c.customer_id = i.issued_cust
where i.issue_date >='2023-06-01' and i.issue_date < '2023-07-01';

select book_title from books where category = 'history';

select b.branch_no,count(*) as empolyee_count
from employee e
join branch b  on e.emp_id = b.manager_id
group by b.branch_no
having empolyee_count > 5;











