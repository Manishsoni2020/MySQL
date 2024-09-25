create database joins;
use joins;
show tables;
create table product(product_name varchar(50),supplier_id int);
insert into product values
("planet oat oatmilk",1),
("Honey nut frosted flakes",2),
("magnum bouble tub",5),
("sour patch marshmallows",3),
("ferrero eggs",4);
select * from product;
create table supplier(supplier_id int,supplier_name varchar(50));
insert into supplier values
(1,"john"),
(2,"anne"),
(3,"robert"),
(4,"jerry"),
(5,"tim");
select * from supplier;
update supplier set supplier_id =6 where supplier_name="robert";
update supplier set supplier_id =7 where supplier_name="jerry";
select * from supplier;

-- inner join
select product.product_name, supplier.supplier_name
from product inner join supplier
on product.supplier_id=supplier.supplier_id;

-- left join
select product.product_name,supplier.supplier_name
from product left join supplier
on product.supplier_id=supplier.supplier_id;

-- right join
select product.product_name,supplier.supplier_name
from product right join supplier
on product.supplier_id=supplier.supplier_id;

-- full outer join
select product.product_name,supplier.supplier_name
from product right join supplier
on product.supplier_id=supplier.supplier_id 
union
select product.product_name,supplier.supplier_name
from product left join supplier
on product.supplier_id=supplier.supplier_id;

-- cross join
select product.product_name,supplier.supplier_name
from product cross join supplier;

-- natural join
select product.product_name,supplier.supplier_name
from product natural join supplier;

-- self join
select a.product_name,b.supplier_id 
from product a,product b
where a.supplier_id=b.supplier_id;