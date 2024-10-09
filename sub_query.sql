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


-- 4. Subquery in SELECT Clause
-- Task: Display the name and salary of each employee, along with the average salary in their
-- department.
select a.emp_name,a.salary,(select avg(salary) as avg_salary 
from employee where dept_id=a.dept_id) as avg_dept_salary 
from employee as a;

-- 5. Subquery with JOIN Clause
-- Task: Find the names of employees and the names of their departments, where their salary is
-- greater than the average salary in their department. 
select employee.emp_name,departments.dept_name from 
employee inner join departments
on employee.dept_id=departments.dept_id
where employee.salary>(select avg(salary) as avg_salary from employee);

-- 6. Correlated Subquery
-- Task: Find employees whose salary is greater than the average salary of their own department.
select emp_name,salary from employee
where salary>(select avg(salary) as avg_salary from employee);

-- --------------------
-- Practice Exercises

-- 1. Subquery for Maximum Salary: 
-- Write a query that finds all employees who earn the highest
-- salary in the company.
select emp_name 
from employee
where salary= (select salary from employee order by salary desc limit 1);

-- 2. 
-- Subquery for Department with the Most Employees: 
-- Find the department with the highest number of employees.
-- select dept_name from departments
-- where (select count(emp_id) as No_emp from employee );

-- 3. 
-- Subquery with NOT IN: 
-- Find the employees who do not belong to department 102.
select emp_name 
from employee
where dept_id not in (select dept_id from departments where dept_id=102);

-- 4. 
-- Find Departments with Multiple Employees: 
-- Write a query to list all departments that have
-- more than one employee.
select dept_id,count(*) as all_emp from employee
group by dept_id
having count(*)>1;

-- 5.
-- Subquery with BETWEEN: 
-- Find employees whose salary is between the average salary and
-- the highest salary in the company.
select emp_name,salary from employee
where salary between (select avg(salary) from employee)
and (select max(salary) from employee);

-- 6. 
-- Retrieve the name and salary of employees who have a salary greater than the average salary in
-- the company.
select emp_name,salary
from employee
where salary>(select avg(salary) from employee);

-- 7. 
-- Find the employees who work in the department with the maximum number of employees.
select emp_name 
from employee
where dept_id = (select dept_id from employee group by dept_id order by count(*) desc limit 1);

-- 8. 
-- Find the average salary for each department from the employees table.
select departments.dept_name,avg(employee.salary) as avg_salary 
from employee inner join departments
on employee.dept_id=departments.dept_id
group by departments.dept_name;

-- 9. 
-- List the names of employees who have a salary greater than the salary of any employee in the
-- HR department.
select emp_name 
from employee
where salary>(select max(employee.salary) as max_salary 
from employee inner join departments 
on employee.dept_id=departments.dept_id 
where departments.dept_name="HR" );
