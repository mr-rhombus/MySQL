/*

ROW_NUMBER() OVER (<partition definition> <order_definition>)

    - Generate a sequential number for each row in the result set

*/


-- Examples
USE classicmodels;

-- Assign sequential numbers to each row
SELECT
    productName,
    MSRP,
    ROW_NUMBER() OVER (
        ORDER BY MSRP DESC
    ) AS row_no
FROM products
LIMIT 10;

-- Find top 3 sales employees by sales channels
-- Total sales by employee and productLine
WITH cte AS (
    SELECT
        employees.firstName,
        employees.lastName,
        products.productLine,
        SUM(orderdetails.quantityOrdered*orderdetails.priceEach) AS total_sales
    FROM employees
    INNER JOIN customers
        ON employees.employeeNumber = customers.salesRepEmployeeNumber
    INNER JOIN orders USING (customerNumber)
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    GROUP BY employees.firstName, employees.lastName, products.productLine
),
-- Rank employees by total sales across each productLine
cte2 AS (SELECT
    *,
    ROW_NUMBER() OVER (
        PARTITION BY cte.productLine
        ORDER BY cte.total_sales DESC
    ) AS sales_rank
FROM cte)
-- Limit to top 3 employees per productLine
SELECT *
FROM cte2
WHERE cte2.sales_rank <= 3;


-- Find the top 3 products by product line with the highest inventory
WITH cte AS (
    SELECT
        productName,
        productLine,
        quantityInStock,    
        ROW_NUMBER() OVER (
            PARTITION BY productLine
            ORDER BY quantityInStock DESC
        ) AS inventory_rank
    FROM products
)
SELECT *
FROM cte
WHERE cte.inventory_rank <= 3;


-- Suppose you display a list of products and their corresponding MSRP with 10 per page. Write a query that displays the products for the second page
WITH cte AS (
    SELECT
        productName,
        MSRP,
        ROW_NUMBER() OVER (
            ORDER BY MSRP DESC
        ) AS msrp_rank
    FROM products)
SELECT *
FROM cte
WHERE msrp_rank BETWEEN 11 and 20;