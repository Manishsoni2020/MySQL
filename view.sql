create database joinss;
use joinss;
show tables;

select * from employees;

-- VIEW CREATING
create view employee as 
select emp_id,emp_name,salary from employees;

-- shortcut
-- simplification
-- restricting access
-- easy to understand the databse

-- update 
update employee set emp_name="manish"
where salary=70000;
select * from employee;

-- retrieve
-- 1.
select salary from employee 
where emp_id=4;
-- 2.
select emp_id from employee
where emp_name like "john%";

-- Drop
drop view employee;
