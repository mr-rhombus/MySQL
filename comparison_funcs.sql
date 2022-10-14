/*

ISNULL(expr)
    - Allows for easy handling of NULL values

Ex.
    SELECT ISNULL(NULL); -- 1
    SELECT ISNULL(1); -- 0

*/

/*

COALESCE(val1, val2, val3, ...)
    - Substitute NULL values

Ex.
    SELECT COALESCE(NULL, 1); -- 1
    SELECT COALESCE(NULL, NULL); -- NULL

*/

/*

GREATEST/LEAST(val1, val2, ...)
    - Return the greatest/smallest values

Ex.
    SELECT LEAST(5,3,1,7,2); -- 1
    SELECT GREATEST(1,4,2,NULL); -- NULL
        SELECT GREATEST(IFNULL(1,0), IFNULL(4,0), ...); -- 4

*/