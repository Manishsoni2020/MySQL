create database collage;
use collage;
show tables;

-- CREATE
create table student(roll_no int,student_name varchar(50),gender char,address varchar(50),contact int);
select * from student;
insert into student values
(1,"manish",'m',"jaipur",8888888),
(2,"suresh",'m',"jaipur",82188),
(3,"komal",'f',"jodhpur",874456888),
(4,"ginni",'f',"jaipur",8741358),
(55,"minni",'f',"jaipur",845328);
select * from student;

-- ALTER QUERIES 
alter table student add column father_name varchar(50);
alter table student rename column father_name to fathers_name;
alter table student modify column fathers_name int;
alter table student drop column fathers_name;

-- UPDATE QUERIES
update student set address="sikar" where roll_no=2;

-- DELETE QUERIE
delete from student 
where roll_no=55;


