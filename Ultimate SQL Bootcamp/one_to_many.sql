# DATA RELATIONSHIPS
/*
ONE TO MANY
- Customers and Orders
    - One customer can have many orders. One order can NOT have multiple customers
- Customers         Orders
    - customer_id       - order_id
    - first_name        - order_date
    - last_name         - amount
    - email             - customer_id
- customer_id is our PRIMARY KEY - ALWAYS unique
- FOREIGN KEY is a reference to another table within a given table
    - Orders.customer_id is a FK, since it refers to Customers.customer_id
*/

# WORKING WITH FKs
-- CREATE DATABASE logistics;
-- USE logistics;
-- CREATE TABLE customers (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(100),
--     last_name VARCHAR(100),
--     email VARCHAR(100)
-- );

-- CREATE TABLE orders (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY(customer_id) REFERENCES customers(id)
-- );

-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
       
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);


# CROSS JOINS (or Cartesian join)
# Joins all records together
-- SELECT *
-- FROM customers, orders;


# INNER JOIN
# Show first name, last name and email of all customers who placed orders
# IMPLICIT INNER JOIN
-- SELECT *
-- FROM customers, orders
-- WHERE customers.id = orders.customer_id;

# EXPLICIT INNER JOIN (common practice)
-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- JOIN orders
--     ON customers.id = orders.customer_id;


# LEFT JOIN
# Find orders for all customers (even if they did not place any orders)
-- SELECT first_name, last_name, order_date, amount
-- FROM customers
-- LEFT JOIN orders
--     ON customers.id = orders.customer_id;

# IFNULL(expr, value)
# Replace NULLs with a specified value
# Find total spent by each customer
-- SELECT
--     customers.id,
--     first_name,
--     last_name,
--     IFNULL(SUM(amount), 0) AS 'total_spent'
-- FROM customers
-- LEFT JOIN orders
--     ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY total_spent DESC;


# RIGHT JOIN
# No difference from orders table since all orders have a customer!
-- SELECT *
-- FROM customers
-- RIGHT JOIN orders
--     ON customers.id = orders.customer_id;


# ON DELETE CASCADE
# Delete foreign keys associated with any records you wish to delete
# When defining the table
-- customer_id INT,
-- FOREIGN KEY(customer_id)
--     REFERENCES customers(id)
--     ON DELETE CASCADE

-- DELETE FROM customers
-- WHERE first_name = 'Bette';


# Exercises
# Create schema and populate with data
-- USE exercises;
-- CREATE TABLE students (
--     id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
--     first_name VARCHAR(100)
-- );

-- CREATE TABLE papers (
--     title VARCHAR(100),
--     grade DECIMAL(5,2),
--     student_id INT,
--     FOREIGN KEY(student_id) REFERENCES students(id)
-- );

-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);

# Show first name, title and grade of students with graded papers
SELECT students.first_name, papers.title, papers.grade
FROM students
JOIN papers
    ON students.id = papers.student_id;

# Show first name, title and grade of all students
SELECT students.first_name, papers.title, papers.grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

# Fill NULL grades with 0
SELECT
    students.first_name,
    IFNULL(papers.title, 'MISSING') AS title,
    IFNULL(papers.grade, 0) AS grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id;

# Print average grade of all students, assuming students without papers received a 0
SELECT
    students.first_name,
    CAST(AVG(IFNULL(papers.grade, 0)) AS DECIMAL(6,4)) AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;

# Print first name, average name and pass (average > 70) determination for all students
SELECT
    students.first_name,
    CAST(AVG(IFNULL(papers.grade, 0)) AS DECIMAL(6,4)) AS average,
    CASE
        WHEN AVG(IFNULL(papers.grade, 0)) > 70 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.first_name
ORDER BY average DESC;