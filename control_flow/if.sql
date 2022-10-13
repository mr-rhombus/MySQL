/*

IF(expr, if_true_expr, if_false_expr)

*/

# Examples

# Basic use
SELECT IF(1=1, 'true', 'false');

# Determine how many orders have been shipped and cancelled (as columns)
SELECT
    SUM(IF(status='Shipped', 1, 0)) AS shipped,
    SUM(IF(status='Cancelled', 1, 0)) AS cancelled,
    SUM(IF(status NOT IN ('Shipped', 'Cancelled'), 1, 0)) AS other,
    COUNT(*) AS total
FROM orders;


/*

IFNULL(expr_1, expr_2)
- Returns expr_1 if not null, otherwise returns expr_2

*/

# Basic use
SELECT IFNULL(NULL, 'yes this is null');
SELECT IFNULL('nope', 'no this is not null');


/*

NULLIF(expr_1, expr_2)
- Returns NULL if expr_1 = expr_2
- Handy use case is to prevent div by 0

*/

# Basic use
SELECT NULLIF(0,0);