create database flipcart
use flipcart
create table user
(user_id int,
user_name varchar(50),
user_address varchar(50),
date_of_order date);
insert into user values 
(1,"akshay","jaipur","2024-09-11"),
(2,"arush","himachal","2024-09-10"),
(3,"manish","sikar","2024-08-15"),
(4,"rakesh","palsana","2023-03-30")
select * from user;

update user set user_id=10 where user_name="rakesh";
select * from user

alter table user add column course varchar(50);

select * from user
alter table user modify column course int;
alter table user rename column course to course123
alter table user drop column course123