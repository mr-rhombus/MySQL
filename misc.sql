/*

UNION vs UNION ALL
    - UNION returns unique records from all tables
    - UNION ALL returns ALL records from all tables


FULL OUTER JOIN
    - MySQL doesn't natively support OUTER JOINs, but you can induce one by doing the following:

    SELECT
        t1.x, t1.y, t2.x, t2.y
    FROM table t1, table t2

    - Optionally eliminate the same record by specifying "WHERE t1.x != t2.x AND t1.y != t2.y"


GROUP_CONCAT()
    - Returns row values in comma separated fashion

col1    col2    ->      col1    col2
X       'A'             X       'A','B'
X       'B'             Y       'A'
Y       'A'


SPECIAL "WHERE"
    - You can specify groupings of values to compare in a "WHERE" clause

    ex. WHERE (p1.x, p1.y) != (p2.x, p2.y)
        - This makes the query a lot nicer to read, and ensures you don't have to use CONCAT


GREATEST/LEAST(val1, val2, ...)
    - Return the greatest/smallest values

Ex.
    SELECT LEAST(5,3,1,7,2); -- 1
    SELECT GREATEST(1,4,2,NULL); -- NULL
        SELECT GREATEST(IFNULL(1,0), IFNULL(4,0), ...); -- 4



USING
    - Join 2 tables that share the same column name, and only use that 1 column
    
    ...
    JOIN tbl2
        USING (shared_col)

col1    col2a     +     col1       col2b    ->      col1    col2a   col2b
1       Aa              2          Bb               1       ...     ...
2       Ba              3          Cb               ...
4       Da              4          Db


HAVING
    - Used to subquery aggregated data from a GROUP BY


COALESCE()
    - Returns first non-null values from a group of columns
    - Different than IFNULL(), which only checks if a single value is NULL
    ex. 
    SELECT ID, COALESCE(fname, sname, lname) as Name
    FROM employees;


ISNULL(expr)
    - Allows for easy handling of NULL values

Ex.
    SELECT ISNULL(NULL); -- 1
    SELECT ISNULL(1); -- 0


POWER(a, b)
    - Takes a to the power of b


ROUND(a, b)
    - Rounds a to b decimal places


SQRT(a)
    - Takes the square root of a


ABS(x)
    - Takes the absolute value of x


LEAST(a, b)
    - Returns the lesser value of a and b


GREATEST(a, b)
    - Returns the greater value of a and b


VIEWS
    - A virtual table based on a result-set of an SQL statement

    CREATE VIEW <vw_name> AS (
        SELECT *
        FROM <tbl>
        WHERE <conditions>
    );


TEMP TABLES
 - Temporary tables used to perform CRUD operations
 - They are dropped when the session is closed, or explicitly by the user.
 - Can be very useful when you need to transform or modify large datasets
    - Only insert required columns
    - Use SELECT INTO instead of INSERT INTO to populate
    - Only create indexes when they are needed


INDEXING

    CREATE INDEX <index_name>
    ON <table_name> (col1, col2, ...);

    - Used to retrieve data from the DB more quickly by speeding up searches/queries
    - Speeds up SELECT queries and WHERE clauses
    - Slows down data input with UPDATE and INSERT statements

    When to avoid indexes?
        - Small tables
        - Tables that have frequent, large batch updates or insert operations
        - Columns that have a high number of NULL values
        - Columns that are frequently manipulated

*/