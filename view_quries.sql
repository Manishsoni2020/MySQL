use joinss;
show tables;
select * from employees;
select * from departments;
select * from emp_data;

-- 1.
-- Write a SQL statement to create a view named EmployeeSalary that contains the
-- EmployeeID, EmployeeName, and Salary from the Employees table.
create view emp_data as
select emp_id,emp_name,salary from employees;

-- 2.
-- Create a view called EmployeeDepartment that shows the EmployeeName and
-- DepartmentName by joining the Employees table and the Departments table on
-- DepartmentID.
create view employeedept as
select employees.emp_name,departments.dept_name
from employees inner join departments
on employees.dept_id=departments.dept_id;

-- 3.
-- Write a SQL query to create a view named DepartmentAverageSalary that shows the
-- DepartmentID and the average salary of employees in each department from the
-- Employees table.
create view departmentaveragesalary as
select employees.dept_id,avg(employees.salary) as avg_salary,departments.dept_name
from employees inner join departments
on employees.dept_id=departments.dept_id;

-- 4.
-- Create a view named HighEarners that displays the EmployeeName, Salary, and
-- HireDate for all employees earning more than $100,000.
create view highearners as
select emp_name,salary,hire_date from employees
where salary>100000;

-- 5.
-- Is it possible to update data in a view? If yes, explain when and how updates can be
-- performed on a view. If not, provide a valid reason.
-- Ans=> if there is not a valid resion then we should not update data in a view

-- 6.
-- Write a view that displays the EmployeeID, EmployeeName, and the Salary of
-- employees whose salaries are above 70000
create view employee_data as
select emp_id,emp_name,salary
from employees
where salary>70000;

-- 7.
-- Write the SQL query to drop the view named EmployeeSalary that was previously
-- created.
drop view employeesalary;

-- 8.
-- Create a view named EmployeeDetails that includes the following columns:
--  EmployeeID
--  EmployeeName
--  DepartmentName
--  ManagerName Use the Employees, Departments, and Managers tables.
create table managers(dept_id int ,manager_name varchar(50));
insert into managers values
(1,"yash"),
(2,"sunil"),
(3,"anita"),
(4,"karishma");
create view employeedetails as
select employees.emp_id,employees.emp_name,departments.dept_name,managers.manager_name
from employees inner join departments
on employees.dept_id=departments.dept_id
inner join managers
on managers.dept_id =departments.dept_id;
