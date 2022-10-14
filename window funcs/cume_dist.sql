/*

CUME_DIST() OVER (
        PARTITION BY expr, ...
        ORDER BY expr [ASC | DESC]
)

    - Returns the cumulative distribution of a value within a set of values
    - Represents (# of rows with vals <= that row's value)/(tot # of rows)
    - 0 < CUME_DIST() <= 1

*/

-- DATA
-- USE window_funcs;

-- CREATE TABLE scores (
--     name VARCHAR(20) PRIMARY KEY,
--     score INT NOT NULL
-- );

-- INSERT INTO
-- 	scores(name, score)
-- VALUES
-- 	('Smith',81),
-- 	('Jones',55),
-- 	('Williams',55),
-- 	('Taylor',62),
-- 	('Brown',62),
-- 	('Davies',84),
-- 	('Evans',87),
-- 	('Wilson',72),
-- 	('Thomas',72),
-- 	('Johnson',100);


-- Example
-- Find the cumulative distribution on the score in the result set
SELECT
    name,
    score,
    ROW_NUMBER() OVER (ORDER BY score) AS row_num,
    CUME_DIST() OVER (ORDER BY score) AS cume_dist_val
FROM scores;
