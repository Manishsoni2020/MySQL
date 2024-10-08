-- create database if not exists office;
-- use office;
-- show tables;
-- create table staff(staffid int,first_name varchar(50),
-- last_name varchar(50),job_title varchar(50),
-- salary int,hire_date date);
-- insert into staff values 
-- (201,"Alice","Green","Accountant",62000.00,"2020-04-12"),
-- (202,"Bob","Black","Team Leader",74000.00,"2019-08-23"),
-- (203,"Carol","White","Developer",56000.00,"2021-02-14"),
-- (204,"Dave","Brown","Intern",31000.00,"2023-03-30"),
-- (205,"Eve","Gray","Designer",54000.00,"2022-07-18"),
-- (206,"Frank","Clark","Developer",60000.00,"2021-11-10"),
-- (207,"Grace","Lewis","Manager",71000.00,"2018-09-05"),
-- (208,"Henry","Scott","Intern",30000.00,"2023-06-20"),
-- (209,"Irene","Adams","Designer",52000.00,"2020-12-12"),
-- (210,"Jack","Young","Developer",65000.00,"2022-05-01");
-- select * from staff;
-- -- ---------------------------------- 
-- -- 1. Show all FirstName and JobTitle pairs for staff members with salaries above 55000.
-- select first_name,job_title from staff
-- where salary>55000;
-- -- 2. Find the average Salary for staff members with the job title &#39;Developer&#39;.
-- select avg(salary) from staff
-- where job_title="developer";
-- -- 3. List the LastName and HireDate of staff who were hired in the year 2022.
-- select last_name,hire_date from staff
-- where hire_date>="2022-01-01" and hire_date<="2022-12-31";
-- -- 4. Identify the staff members whose FirstName starts with the letter &#39;A&#39;.
-- select * from staff
-- where first_name like "a%";
-- -- 5. Get the StaffID and Salary of the top 3 highest-paid staff members.
-- select staffid,salary from staff
-- order by salary desc limit 3;
-- -- 6. Display the count of staff members grouped by their JobTitle.
-- select job_title,count(*) from staff
-- group by job_title;
-- -- 7. Retrieve the FirstName, LastName, and Salary for staff hired between January 1, 2021, and
-- -- December 31, 2022.
-- select first_name,last_name,salary from staff
-- where hire_date between "2021-01-01" and "2022-12-31";
-- -- 8. Show the LastName and JobTitle of staff members with a salary between 50000 and
-- -- 60000, inclusive.
-- select last_name,job_title from staff
-- where salary>=50000 and salary<=60000;
-- -- 9. List staff members with the JobTitle of &#39;Intern&#39; and sort them by HireDate in descending
-- -- order.
-- select * from staff
-- where job_title="intern"
-- order by hire_date desc;
-- -- 10. Update the Salary to 10% more for all staff members whose JobTitle is &#39;Designer&#39;.
-- update staff set salary=salary*10/100+salary
-- where job_title="designer";
-- -- 11. Add a column ContractEndDate of type DATE to the Staff table.
-- alter table staff add column contractenddate date;
-- select *from staff;
-- -- 12. Set JobTitle to &#39;Senior Developer&#39; for all staff members with a salary greater than 60000.
-- update staff set job_title="senior developer"
-- where salary>60000;
-- -- 13. Remove the HireDate column from the Staff table.
-- alter table staff drop column hire_date;
-- -- 14. Find staff members who do not have the job title &#39;Intern&#39; 
-- select * from staff
-- where job_title!="intern";
-- -- 15. Change the data type of the Salary column to DECIMAL(12, 2) and verify the column
-- -- change.
-- alter table staff modify column salary decimal(12,2);
-- select * from staff;
-- -- 16. Rename the column JobTitle to Role.
-- alter table staff rename column job_title to role;
-- -- 17. Drop all records from the Staff table where the LastName is &#39;Scott&#39;.
-- delete from staff where last_name="scott";

 