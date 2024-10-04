use joinss;
show tables;
select * from employees;
-- 1.
-- Write a SQL statement to create an index named idx_employee_name on the
-- EmployeeName column of the Employees table.
create index idx_employee_name on employees(emp_name);

-- 2.
-- Create a composite index named idx_employee_department on the EmployeeID and
-- DepartmentID columns of the Employees table.
create index idx_employee_department on employees(emp_id,dept_id);

-- 3.
-- Create a unique index named idx_unique_employee_email on the Email column of
-- the Employees table to ensure that no two employees have the same email address.
create unique index idx_unique_employee_email on employees(email);

-- 4.
-- Explain how indexes can improve the performance of SELECT queries. Provide an
-- example of a query that would benefit from indexing.
-- Ans=> if there is a table and in this table have 100 columns then it help us to retrieval easy
-- Exp=>
create unique index u_i on employees(emp_name,salary);

-- 5.
-- Write the SQL query to drop the index named idx_employee_name.
drop index idx_employee_name;

-- 6.
-- Can an index be created on a view? If so, provide a scenario where it might be
-- useful.
-- Ans. No.

-- 7.
-- What is the difference between a clustered and a non-clustered index? Provide
-- examples of when each might be used.
-- Ans.A clustered index determines the physical order of data in a table, 
-- while a non-clustered index creates a separate structure to point to the 
-- data without altering its physical order.
-- create clustered  index c1 on customer(customer_name);
-- create non-clustered index c2 on customer(customer_name);


