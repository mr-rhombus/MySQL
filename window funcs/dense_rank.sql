/*

DENSE_RANK() OVER (
    PARTITION BY <expression>[{,<expression>...}]
    ORDER BY <expression> [ASC|DESC], [{,<expression>...}]
)

    - Assigns a rank to each row within a partition or result set
    - ALWAYS produces consecutive rank values (1, 1, 2) instead of (1, 1, 3)

*/

-- Example
-- Rank employees by sales totals in each year
SELECT
    sales_employee,
    fiscal_year,
    sale,
    DENSE_RANK() OVER (
        PARTITION BY fiscal_year
        ORDER BY sale DESC
    ) AS sales_rank
FROM sales;

/*

- PARTITION BY divides result sets into partitions using fiscal_year
- ORDER BY specifies order in which sales should be ranked

*/