create database office;
use office;
show tables;
create table employee(emp_id int, emp_name varchar(50));
insert into employee values
(1,"manish"),
(2,"rakesh"),
(3,"suresh"),
(4,"nikita"),
(5,"ankita");
create table department(dep_id int, dep_name varchar(50));
insert into department values
(101,"developer"),
(2,"manager"),
(103,"web developer"),
(4,"designer"),
(105,"intern");

-- Q.1 write a query to retrive all employees and their corresponding department names using inner join
select employee.emp_id,employee.emp_name,department.dep_name
from employee inner join department 
where employee.emp_id=department.dep_id;

-- Q.2 Write a query to get all deartments and 
-- the employees in them,including departments with no employees using left join
select department.dep_name,employee.emp_name
from department left join employee
on (department.dep_id=employee.emp_id);

-- Q.3 Write a query to retrieve all records from employee and their department names
-- using full outer join.
select employee.emp_name,department.dep_name
from department left join employee
on department.dep_id=employee.emp_id
union
select employee.emp_name,department.dep_name
from department right join employee
on department.dep_id=employee.emp_id;

-- Q.4 Write a query to count the number of employees in each department using group by with inner join
select department.dep_name,count(employee.emp_id)
from department inner join employee
on department.dep_id=employee.emp_id
group by department.dep_name;


