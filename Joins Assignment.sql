-- Practical SQL Join Questions
-- 1. Employee and Department
-- o Question: Write a query to retrieve all employees along with their department
-- names.
-- o Tables: employees (id, name, department_id), departments (id, department_name)

-- 2. Customers and Orders
-- o Question: List all customers and the orders they have placed, including customers
-- who have not placed any orders.
-- o Tables: customers (id, customer_name), orders (id, customer_id, order_date)

-- 3. Products and Categories
-- o Question: Get a list of all products along with their category names.
-- o Tables: products (id, product_name, category_id), categories (id, category_name)

-- 4. Students and Courses
-- o Question: Retrieve a list of all students and the courses they are enrolled in, even if
-- they are not enrolled in any courses.
-- o Tables: students (id, student_name), enrollments (student_id, course_id), courses
-- (id, course_name)

-- 5. Sales and Customers
-- o Question: Write a query to find all sales transactions along with customer names,
-- including transactions where the customer is not known.
-- o Tables: sales (id, customer_id, amount), customers (id, customer_name)

-- 6. Orders and Products
-- o Question: List all orders along with the product names for each order.
-- o Tables: orders (id, order_date), order_items (order_id, product_id, quantity),
-- products (id, product_name)

-- 7. Books and Authors
-- o Question: Retrieve a list of all books and their authors, including books that do not
-- have an associated author.
-- o Tables: books (id, title, author_id), authors (id, name)

-- 8. Project and Employees
-- o Question: Get a list of all projects and the employees assigned to them, including
-- projects with no employees assigned.
-- o Tables: projects (id, project_name), project_assignments (project_id, employee_id),
-- employees (id, name)

-- 9. Orders by Date
-- o Question: Find all orders placed in the last month, along with the customer names.
-- o Tables: orders (id, customer_id, order_date), customers (id, customer_name)

-- 10. Products Not Sold
-- o Question: Write a query to find all products that have never been sold.
-- o Tables: products (id, product_name), order_items (product_id, order_id)