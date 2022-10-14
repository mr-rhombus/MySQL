-- Sample data

-- USE window_funcs;

-- CREATE TABLE sales(
--     sales_employee VARCHAR(50) NOT NULL,
--     fiscal_year INT NOT NULL,
--     sale DECIMAL(14,2) NOT NULL,
--     PRIMARY KEY(sales_employee,fiscal_year)
-- );

-- INSERT INTO sales(sales_employee,fiscal_year,sale)
-- VALUES('Bob',2016,100),
--       ('Bob',2017,150),
--       ('Bob',2018,200),
--       ('Alice',2016,150),
--       ('Alice',2017,100),
--       ('Alice',2018,200),
--        ('John',2016,200),
--       ('John',2017,150),
--       ('John',2018,250);

/*

Use case
--------
    - Think of aggregate functions and GROUP BY. The aggregate function is applied to a subset of rows. The aggregate function also reduces the # of rows returned by a query
    - Window functions similarly operate on a subset of rows, but do NOT reduce the # of rows returned by a query

*/

-- SUM() with GROUP BY
SELECT
    fiscal_year,
    SUM(sale)
FROM sales
GROUP BY fiscal_year;

-- SUM() as a window function
SELECT
    fiscal_year,
    sales_employee,
    sale,
    SUM(sale) OVER (PARTITION BY fiscal_year) AS total_sales
FROM sales;


/*

General syntax
--------------

window_function_name(expr) OVER (
    [partition_definition]
    [order definition]
    [frame definition]
)

1. PARTITION BY <expression>[{, <expression> ...}]
2. ORDER BY <expression> [ASC|DESC], [{, <expression> ...}]
3. frame_unit {<frame_start>|<frame_between>}

    - frame_start contains one of the following:
        - UNBOUNDED PRECEDING
            Frame starts at the first row of the partition
        - N PRECEDING
            N rows from the first row. Can be a # or an expression
        - CURRENT ROW
            Row of the current calculation

    - frame_between is as follows
        BETWEEN frame_bound_1 AND frame_bound_2
        - frame_bound_1/2 can each contain one of the following:
            - frame_start
                See above
            - UNBOUNDED FOLLOWING
                Frame ends at the final row in the partition
            - N FOLLOWING
                N rows after current row

*/