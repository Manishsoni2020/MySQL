-- -- constraints
-- -- 1.not null
-- -- 2.unique
-- -- 3.primary key
-- -- 4.default "2024-07-01" getdate();
-- -- 5.check
-- -- 6.foreign key
-- -- 7.auto_increment

-- create database hotel;
-- use hotel;
-- show tables;
-- create table oyo(cust_id int auto_increment primary key,cust_name varchar(50) not null, 
-- age int check(age>=18),contact_no int unique,date_of_booking date default "2024-09-23");
-- insert into oyo (cust_id,cust_name,age,contact_no) values (1,"aarush",25,82564782);
-- select * from oyo;
-- insert into oyo (cust_id,cust_name,age,contact_no) values (2,"rakesh",21,82564882);
-- insert into oyo (cust_id,cust_name,age,contact_no) values 
-- (3,"akshay",28,864882),
-- (4,"ankit",18,86482182),
-- (5,"smiksha",98,86477882),
-- (6,"suresh",28,8648252);

-- alter table oyo add column partner_name varchar(50) not null;
-- select * from oyo;
-- alter table oyo drop column partner_name;



-- alter table oyo add column nthcust_no int not null;
-- select * from oyo;