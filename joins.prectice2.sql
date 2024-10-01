create database joinss;
use joinss;
show tables;
create table customer(customer_id int,customer_name varchar(50),email varchar(50));
insert into customer values
(1,"John Doe","john@example.com"),
(2,"Jane Smith","jane@example.com"),
(3,"Alice Johnson","alice@example.com"),
(4,"Bob Brown","bob@example.com");

create table orders(order_id int,customer_id int,order_date date, total_amount int,shiping_date date);
insert into orders values
(101,1,"2023-09-01",150.00,"2023-09-02"),
(102,2,"2023-09-05",200.00,null),
(103,1,"2023-09-10",75.00,"2023-09-12"),
(104,3,"2023-09-15",100.00,"2023-09-16");

create table products(product_id int,product_name varchar(50),price int,category_id int);
insert into products values
(1,"Laptop",1000.00,1),
(1,"Smartphone",500.00,1),
(1,"Desk Chair",150.00,2),
(1,"Monitor",300.00,1);

create table sales(sale_id int,product_id int,sale_date date,quantity int);
insert into sales values
(1,1,"2023-09-05",2),
(2,2,"2023-09-07",5),
(3,3,"2023-09-08",10),
(4,4,"2023-09-10",3);

create table employees(emp_id int,emp_name varchar(50),salary int,dept_id int,manager_id int);
insert into employees values
(1,"Sarah Connor",70000,1,null),
(2,"Kyle Reese",60000,1,1),
(3,"John Connor",80000,2,null),
(4,"Linda Hamilton",55000,2,3);

create table departments(dept_id int,dept_name varchar(50));
insert into departments values
(1,"IT"),
(2,"HR");

create table productreviews(product_id int,rating decimal);
insert into productreviews values 
(1,4.5),
(2,4.0),
(3,null),
(4,5.0);
select * from productreviews;

-- 1. 
-- Total Sales by Product:
-- Find the total sales amount for each product in the Sales table.
select sum(sales.quantity*products.price) as total_sale,products.product_name
from sales inner join products
on sales.product_id=products.product_id
group by product_name;

-- 2. Average Salary by Department:
-- Find the average salary of employees in each department from the Employees
-- table.
select avg(employees.salary) as avg_salary,departments.dept_name
from employees inner join departments
on employees.dept_id=departments.dept_id
group by dept_name;

-- 3. Count of Unshipped Orders:
-- Count the number of orders in the Orders table where the ShippingDate is NULL.
select count(order_id)as total_order
from orders 
where shiping_date is null;

-- 4. Minimum Price by Category:
-- Find the minimum price of products in the Products table for each category.
select min(a.price) as mini_price,b.category_id
from products as a inner join products as b
on  a.product_id=b.product_id
group by b.category_id;

-- 5. Top 5 Highest-Paid Employees:
-- List the top 5 highest-paid employees from the Employees table.
select emp_name,salary from employees
order by salary desc limit 5;

-- 6. Total Customers and Average Order Value:
-- Find the total number of customers and the average order value from the
-- Orders table.
select count(customer.customer_id) as total_customer,avg(orders.total_amount) as Avg_order
from customer inner join orders
on customer.customer_id=orders.customer_id;

-- 7. Average Rating Excluding NULLs:
-- Calculate the average rating of products from the ProductReviews table,
-- excluding NULL ratings.
select avg(productreviews.rating) as avg_rating,products.product_name
from productreviews inner join products
on productreviews.product_id=products.product_id
group by products.product_name;

-- 8. Department with Highest Average Salary:
-- Find the department with the highest average salary from the Employees table.
select departments.dept_name,avg(employees.salary)as avg_salary
from departments inner join employees
on departments.dept_id=employees.dept_id
group by departments.dept_name
order by avg_salary desc limit 1;
