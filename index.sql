create database joinss;
use joinss;
show tables;

select * from employees;
-- Index
-- retrieval easy

-- types of indexes
-- 1 single column index
select * from customer;
create index rakesh on customer(customer_name);
-- 2. multi column index
create index akshay on customer(customer_id,customer_name);
-- 3 full text index
select *from departments;
create fulltext index aarush on  departments(dept_name);
-- 4 unique index
create unique index manish on departments(dept_id);
-- 5 clustered index
create clustered  index  shela on customer(customer_name);
-- 6 non clustered index
create non-clustered index shela on customer(customer_name);


