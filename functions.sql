use joins;
show tables;
select * from customer;
select substr(customer_name,2) from customer;
select customer_name,left(customer_name,1) from customer;
select customer_name,right(customer_name,3) from customer;
select length(trim("   manish  ")) from dual;
select customer_name,instr(customer_name,"a") from customer;
select customer_name,rpad(customer_name,4,"@") from customer;

use joinss;
show tables;
select * from employees;
select round(8.639,2) from dual;
select truncate(51.2545,-1) from dual;
select mod(15,4) from dual;
select floor(725.1588)from dual;
select ceil(54.8368)from dual;



   