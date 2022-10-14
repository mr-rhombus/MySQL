/*

FIRST_VALUE/LAST_VALUE (expression) OVER (
    [partition_clause]
    [order_clause]
    [frame_clause]
)

    - Allows you to select the first/last row of a window frame, partition or result set
    - These are interchangeable, as FIRST_VALUE = LAST VALUE ... ORDER BY ___ DESC

NTH_VALUE(expression, N) OVER (
    partition_clause
    order_clause
    frame_clause
)

*/


-- DATA
-- CREATE TABLE overtime (
--     employee_name VARCHAR(50) NOT NULL,
--     department VARCHAR(50) NOT NULL,
--     hours INT NOT NULL,
--     PRIMARY KEY (employee_name , department)
-- );
-- INSERT INTO overtime(employee_name, department, hours)
-- VALUES('Diane Murphy','Accounting',37),
-- ('Mary Patterson','Accounting',74),
-- ('Jeff Firrelli','Accounting',40),
-- ('William Patterson','Finance',58),
-- ('Gerard Bondur','Finance',47),
-- ('Anthony Bow','Finance',66),
-- ('Leslie Jennings','IT',90),
-- ('Leslie Thompson','IT',88),
-- ('Julie Firrelli','Sales',81),
-- ('Steve Patterson','Sales',29),
-- ('Foon Yue Tseng','Sales',65),
-- ('George Vanauf','Marketing',89),
-- ('Loui Bondur','Marketing',49),
-- ('Gerard Hernandez','Marketing',66),
-- ('Pamela Castillo','SCM',96),
-- ('Larry Bott','SCM',100),
-- ('Barry Jones','SCM',65);


-- Example
-- Find the employee name and overtime for the employee with the least overtime hrs
SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (
        ORDER BY hours
    ) AS least_overtime
FROM overtime;


-- Find the employee who had the least overtime in each department
SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
    ) AS least_overtime
FROM overtime;