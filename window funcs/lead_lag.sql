/*

LAG/LEAD(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
)

    - Look back/forward a number of rows and access data of that row from the current row

*/


-- Examples
USE classicmodels;

-- Return the order value of every product line in a specific year and the previous year
WITH cte AS (
    SELECT
        products.productLine,
        YEAR(orders.orderDate) as order_year,
        SUM(orderDetails.quantityOrdered*orderDetails.priceEach) AS order_value
    FROM products
    INNER JOIN orderDetails
        USING (productCode)
    INNER JOIN orders
        USING (orderNumber)
    GROUP BY products.productLine, order_year)
SELECT
    *,
    IFNULL((LAG(cte.order_value, 1) OVER (
        PARTITION BY cte.productLine
        ORDER BY cte.order_year
    )), 'N/A') AS prev_yr_order_value
 FROM cte;


 -- Find the order date and next order date of each customer
 SELECT
    customers.customerName,
    orders.orderDate,
    IFNULL((LEAD(orders.orderDate) OVER (
        PARTITION BY customers.customerName
        ORDER BY orderDate
    )), 'N/A') AS next_orderDate
FROM customers
INNER JOIN orders USING (customerNumber)
LIMIT 10;