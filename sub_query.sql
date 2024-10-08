create database if not exists subquery;
use subquery;
show tables;

create table employee(emp_id int, emp_name varchar(50),salary int,dept_id int);
insert into employee values
(1,"john",50000,101),
(2,"jane",60000,102),
(3,"michael",70000,101),
(4,"emily",55000,103),
(5,"daniel",80000,101);
select * from employee;

create table departments(dept_id int,dept_name varchar(50));
insert into departments values
(101,"HR"),
(102,"sales"),
(103,"IT");
select * from departments;

-- 1. Simple Subquery in WHERE Clause
-- Task: Find the employees who have a salary greater than the average salary of all employees.
select emp_name from employee
where salary>(select avg(salary) as avg_salary 
from employee); 

-- 2. Subquery with IN Clause
-- Task: Find the names of employees who work in departments with department_id 101 or 102.
select emp_name from employee
where dept_id in (select dept_id 
from departments
where dept_id in (101,102)); 

-- 3. Subquery with EXISTS Clause
-- Task: Find employees who belong to departments that have at least one employee with a salary
-- greater than 60000.
SELECT emp_name
FROM Employee e
WHERE EXISTS (SELECT 1 FROM Employee WHERE dept_id = e.dept_id AND salary >
60000);
