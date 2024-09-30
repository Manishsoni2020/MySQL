create database joins;
use joins;

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);
INSERT INTO category (category_id, category_name) VALUES (1, 'Electronics');
INSERT INTO category (category_id, category_name) VALUES (2, 'Clothing');
INSERT INTO category (category_id, category_name) VALUES (3, 'Home & Kitchen');
INSERT INTO category (category_id, category_name) VALUES (4, 'Books');
INSERT INTO category (category_id, category_name) VALUES (5, 'Sports');

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (1, 'Laptop', 1, 1200);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (2, 'Smartphone', 1, 800);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (3, 'T-shirt', 2, 25);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (4, 'Blender', 3, 150);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (5, 'Novel', 4, 15);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (6, 'Soccer Ball', 5, 30);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (7, 'Headphones', 1, 100);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (8, 'Jacket', 2, 60);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (9, 'Coffee Maker', 3, 80);
INSERT INTO product (product_id, product_name, category_id, price) VALUES (10, 'Cookbook', 4, 25);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    referrer_id INT,
    FOREIGN KEY (referrer_id) REFERENCES customer(customer_id)
);
INSERT INTO customer (customer_id, customer_name, referrer_id) VALUES (1, 'Alice', NULL);
INSERT INTO customer (customer_id, customer_name, referrer_id) VALUES (2, 'Bob', 1);
INSERT INTO customer (customer_id, customer_name, referrer_id) VALUES (3, 'Charlie', 1);
INSERT INTO customer (customer_id, customer_name, referrer_id) VALUES (4, 'David', NULL);
INSERT INTO customer (customer_id, customer_name, referrer_id) VALUES (5, 'Eva', 2);
CREATE TABLE customer_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (1, 1, '2023-01-01');
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (2, 1, '2023-01-02');
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (3, 2, '2023-01-03');
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (4, 3, '2023-01-04');
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (5, 2, '2023-01-05');
INSERT INTO customer_order (order_id, customer_id, order_date) VALUES (6, 4, '2023-01-06');
CREATE TABLE order_item (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (1, 1, 1, 1);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (2, 1, 2, 2);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (3, 2, 3, 1);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (4, 3, 4, 1);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (5, 4, 5, 1);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (6, 5, 6, 2);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (7, 6, 7, 1);
INSERT INTO order_item (order_item_id, order_id, product_id, quantity) VALUES (8, 1, 8, 1);
select * from  order_item;

-- 1.
select product.product_name,category.category_name
from product inner join category
on product.category_id=category.category_id;

-- 2.
select category.category_id,category.category_name,product.product_name
from category left join product
on category.category_id=product.category_id;

-- 3.
select a.customer_name,b.customer_name
from customer as a left join customer as b
on a.referrer_id=b.customer_id;

-- 4.
select a.customer_name,o.order_id 
from customer as a left join customer_order as o
on a.customer_id=o.customer_id
where order_id is null; 

-- 5.
select product.product_name,category.category_name
from product inner join category
on product.category_id=category.category_id
order by category_name;

-- 6.
select count(product.product_id),category.category_name
from product inner join category
on product.category_id=category.category_id
group by category_name;

-- 7.
select category.category_name,product.product_name
from category left join product
on category.category_id=product.category_id
where product_id is null;

-- 8.
select max(product.price),category.category_name
from product inner join category
on product.category_id = category.category_id
group by category_name;

-- 9.
select order_item.order_id,count(product.product_id) as no_of_item
from order_item left join product
on order_item.product_id=product.product_id
group by order_id;

-- 10.
select product.product_name,count(order_item.order_id) as total_order
from product inner join order_item
on product.product_id=order_item.product_id
group by product_name
having total_order>5;

-- 11.
select product.product_name,category.category_name
from product inner join category
on product.category_id=category.category_id
where category_name="electronics";

-- 12.
select avg(product.price) as avg_price,category.category_name
from product inner join category
on product.category_id=category.category_id
group by category_name;

-- 13.
select customer.customer_name,customer_order.order_id
from customer left join customer_order
on customer.customer_id=customer_order.customer_id
where order_id is null;

-- 14.
select a.customer_name,b.referrer_id
from customer as a left join customer as b
on a.customer_id=b.customer_id
where b.referrer_id is null;

-- 15.
select count(product.product_id) as total_pro,category.category_name
from product inner join category
on product.category_id=category.category_id
group by category_name;

-- 16.
select sum(order_item.quantity*product.price) as total_sale,category.category_name
from product inner join category
on order_item.product_id=product.product_id
inner join category 
on category.category_id=product.product_id;