/*

RANK() OVER (
    PARTITION BY <expression>[{,<expression>...}]
    ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
)

    - Assigns a rank to each row within a partition or result set
    - Does not always produce consecutive rank values
        ex. (1,1,3) instead of (1,1,2)

*/

-- Example
-- Rank employees by sales amount in each year
USE window_funcs;
SELECT
    *,
    RANK() OVER (
        PARTITION BY fiscal_year
        ORDER BY sale DESC
    ) AS yearly_sales_rank
FROM sales;


-- Example
-- Find top 3 highest valued orders in each year
USE classicmodels;
WITH cte AS (
    SELECT
        orders.orderNumber,
        YEAR(orders.orderDate) AS orderYear,
        orderdetails.quantityOrdered*orderdetails.priceEach AS orderValue
    FROM orders
    INNER JOIN orderdetails
        USING (orderNumber)
),

cte2 AS (
    SELECT
        *,
        RANK() OVER (
            PARTITION BY cte.orderYear
            ORDER BY cte.orderValue DESC
        ) AS orderValueRank
    FROM cte
)

SELECT *
FROM cte2
WHERE cte2.orderValueRank <= 3
ORDER BY cte2.orderYear DESC;


-- Example
-- Rank student scores and the percentile they scored in
USE window_funcs;
SELECT
    name,
    score,
    RANK() OVER (
        ORDER BY score
    ) AS score_rank,
    (RANK() OVER (
        ORDER BY score
    )-1)/(SELECT COUNT(*)-1 FROM scores) AS score_percent_rank
FROM scores;