# DISTINCT
-- SELECT DISTINCT author_lname
-- FROM books;


# ORDER BY
-- SELECT *
-- FROM books
-- ORDER BY stock_quantity;


# LIMIT
-- SELECT *
-- FROM books
-- ORDER BY released_year
-- LIMIT 1;


# LIKE
# Do not forget about your friendly WILDCARD, %!!!
-- SELECT *
-- FROM books
-- WHERE author_fname LIKE '%David%';

# MORE WILDCARDS
# Match stock_quantity with length of 4
-- SELECT stock_quantity
-- FROM books
-- WHERE stock_quantity LIKE '____';


# Exercises
SELECT title
FROM books
WHERE title LIKE '%stories%';

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) as summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

SELECT title, author_lname
FROM books
WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity
LIMIT 3;

SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

SELECT UPPER(CONCAT('my favorite author is ', author_fname, ' ', author_lname, '!')) as yell
FROM books
ORDER BY author_lname;

