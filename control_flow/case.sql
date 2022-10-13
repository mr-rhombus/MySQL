-- Add if-then-else logic to SQL queries

# CASE
/*
Usage:
    CASE value
        WHEN value1 THEN result1
        WHEN value2 THEN result2
        ...
        [ELSE else_result]
    END
*/

# Example
Return the type of customers based on the number of orders
SELECT
    orders.customerNumber,
    customers.customerName,
    COUNT(orders.orderNumber) AS total_orders,
    CASE
        WHEN COUNT(orders.orderNumber) > 5 THEN 'High Volume'
        WHEN COUNT(orders.orderNumber) BETWEEN 2 AND 4 THEN 'Medium Volume'
        ELSE 'Low Volume'
    END AS customer_class
FROM orders
INNER JOIN customers
    USING (customerNumber)
GROUP BY orders.customerNumber;

# Alternate solution
WITH cte AS (
    SELECT
        customers.customerName,
        COUNT(orders.orderNumber) AS orderCount
    FROM orders
    INNER JOIN customers
        USING (customerNumber)
    GROUP BY orders.customerNumber
)
SELECT
    *,
    CASE
        WHEN cte.orderCount > 4 THEN 'Loyal Customer'
        WHEN cte.orderCount BETWEEN 2 and 4 THEN 'Repeat Customer'
        WHEN cte.orderCount = 1 THEN 'One-time Customer'
        ELSE 'Not a Customer'
    END AS customerType
FROM cte;


# Example
-- Sort customers by state if state is not NULL, otherwise sort by country
SELECT
    CustomerName,
    city,
    state,
    country
FROM customers
ORDER BY state, (
    CASE
        WHEN state IS NULL THEN country
        ELSE state
    END);


# Example
-- Calculate total sales orders by order status
SELECT
    status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Now pivot this to have each value in the status column as a column
SELECT
    SUM(CASE
            WHEN status LIKE 'Shipped' THEN 1
            ELSE 0
        END) AS Shipped,
    SUM(CASE
            WHEN status LIKE 'Resolved' THEN 1
            ELSE 0
        END) AS Resolved,
    SUM(CASE
            WHEN status LIKE 'Cancelled' THEN 1
            ELSE 0
        END) AS Cancelled,
    SUM(CASE
            WHEN status LIKE 'On Hold' THEN 1
            ELSE 0
        END) AS `On Hold`,
    SUM(CASE
            WHEN status LIKE 'Disputed' THEN 1
            ELSE 0
        END) AS Disputed,
    SUM(CASE
            WHEN status LIKE 'In Process' THEN 1
            ELSE 0
        END) AS `In Process`,
    COUNT(*) AS Total
FROM orders;