/*

GROUP_CONCAT()
    - Returns row values in comma separated fashion

col1    col2    ->      col1    col2
X       'A'             X       'A','B'
X       'B'             Y       'A'
Y       'A'


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
    ex. 
    SELECT ID, COALESCE(fname, sname, lname) as Name
    FROM employees;


VIEWS
    - A virtual table based on a result-set of an SQL statement

    CREATE VIEW <vw_name> AS (
        SELECT *
        FROM <tbl>
        WHERE <conditions>
    );

*/