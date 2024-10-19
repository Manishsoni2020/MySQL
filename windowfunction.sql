create database if not exists company;
use company;
show tables;
create table employees (emp_id int unique,emp_name varchar(50),salary decimal,dept_id int,hire_date date);
insert into employees values
(1,"Alice",60000,101,"2021-01-10"),
(2,"Bob",75000,102,"2020-05-22"),
(3,"Charlie",50000,101,"2022-03-14"),
(4,"Diana",90000,103,"2019-07-19"),
(5,"Edward",85000,102,"2020-09-01");
create table department(dept_id int unique,dept_name varchar(50));
insert into department values
(101,"engineering"),
(102,"sales"),
(103,"marketing");
create table salaries(emp_id int,salary decimal,salary_date date);
insert into salaries values
(1,60000,"2021-01-10"),
(2,75000,"2020-05-22"),
(3,50000,"2022-03-14"),
(4,90000,"2019-07-19"),
(5,85000,"2020-09-01");

-- 1. 
-- Write a query to display employee IDs and their salaries along with
-- the total salary of all employees using a window function.
select emp_id,sum(salary) 
over(order by salary) 
from employees;

-- 2. 
-- Display each employee's ID, name, and a rank based on their 
-- salary using the RANK() function.
select emp_id,emp_name,rank() 
over(order by salary desc) 
from employees;

-- 3. 
-- Write a query to display each employee’s name, salary, and the 
-- total salary in their department using a window function.
select emp_name,salary,sum(salary)
over(partition by dept_id order by salary desc)
from employees;

-- 4. 
-- Assign a row number to each employee ordered by their hire date.
select * ,row_number() over(order by hire_date)
from employees;

-- 5. 
-- Calculate a simple moving average of the last 3 salaries for each employee.
select avg(salary) 
over(order by salary desc ) as avg_salary
from employees
where emp_id>=3;
-- 6.
-- Retrieve the first three employees hired in each department using the ROW_NUMBER() function.

-- 7. 
-- Write a query to calculate the cumulative sum of the salaries of employees.
select emp_name,salary,sum(salary) 
over(order by salary desc) as cumulative_sum
from employees;

-- 1. Display each employee's name, department, and rank within their 
-- department based on salary using DENSE_RANK().
select e.emp_name,d.dept_name,e.salary,
row_number() over(partition by d.dept_name order by e.salary desc)
from employees e left join depart d
on e.dept_id = d.dept_id;

-- 2. Calculate the percent rank of each employee’s salary in their department.
select emp_name,salary,ntile(4) over(partition by dept_id order by salary desc)
from employees;

-- 3. Write a query to display each employee’s salary along with the first and 
-- last salary in their department using window functions.
select emp_name,dept_id,salary,first_value(salary) over(partition by dept_id),
last_value(salary) over(partition by dept_id)
from employees;

-- 4. Display each employee’s salary along with the previous salary and the 
-- next salary in the sorted list using LAG() and LEAD().
select emp_name,salary,lag(salary) over(order by salary),lead(salary) over(order by salary)
from employees;



