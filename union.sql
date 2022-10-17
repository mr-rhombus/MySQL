/*

SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...

    - Combine two or more result sets from multiple SELECT statements into a single result set
        - # and orders of cols that appear in all SELECT statements must be the same
        - Data types of cols must be the same or compatible
    - Nearly synonymous with a CONCATENATE operation

*/

-- Example data
-- DROP TABLE IF EXISTS t1;
-- DROP TABLE IF EXISTS t2;

-- CREATE TABLE t1 (
--     id INT PRIMARY KEY
-- );

-- CREATE TABLE t2 (
--     id INT PRIMARY KEY
-- );

-- INSERT INTO t1 VALUES (1),(2),(3);
-- INSERT INTO t2 VALUES (2),(3),(4);


-- Examples

-- Combine the result sets returned from t1 and t2
-- NOTICE that this drops extra shared vals
SELECT * FROM t1
UNION
SELECT * FROM t2;

-- This returns all values from both tables
SELECT * FROM t1
UNION ALL
SELECT * FROM t2;

-- Combine all first and last names of employees and customers
USE classicmodels;
SELECT employees.firstName, employees.lastName
FROM employees
UNION
SELECT customers.contactFirstName, customers.contactLastName
FROM customers;