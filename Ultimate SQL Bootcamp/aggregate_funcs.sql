# COUNT
# Find total books in library
-- SELECT COUNT(*)
-- FROM books;

# Distinct author first names
-- SELECT COUNT(DISTINCT author_fname)
-- FROM books;

# Unique first and last name
-- SELECT COUNT(DISTINCT author_fname, author_lname)
-- FROM books;

# How many titles contain the word "the"?
-- SELECT COUNT(DISTINCT title) 'Titles containing "the"'
-- FROM books
-- WHERE title LIKE '%the%';


# GROUP BY
# Find total book count per author
-- SELECT author_fname, author_lname, COUNT(*)
-- FROM books
-- GROUP BY author_lname, author_fname;


 # MIN/MAX
 # Find oldest book
--  SELECT MIN(released_year)
--  FROM books;

# Find oldest book for each release year
-- SELECT title, author_lname, MIN(released_year) as min_release
-- FROM books
-- GROUP BY released_year
-- ORDER BY min_release;


# SUBQUERIES
# Runs slowly since we are running 2 separate queries
# Find book with lowest page count
-- SELECT *
-- FROM books
-- WHERE pages = (SELECT MIN(pages) FROM books)

# Can accomplish the same result as follows
# Find book with lowest page count
-- SELECT *
-- FROM books
-- ORDER BY pages
-- LIMIT 1;


# SUM
# Sum all pages in table
-- SELECT SUM(pages)
-- FROM books;

# Sum all pages each author has written
SELECT author_fname, author_lname, SUM(pages) as total_pages
FROM books
GROUP BY author_fname, author_lname;


# AVG
# Find average release year for all books
-- SELECT AVG(released_year)
-- FROM books;

# Find average stock qty for books released in the same year
SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;


# Exercises
# Number of books in the DB
SELECT COUNT(DISTINCT title)
FROM books;

# How many books are released in each year
SELECT released_year, COUNT(title) book_total
FROM books
GROUP BY released_year;

# Total number of books in stock
SELECT SUM(stock_quantity) as in_stock
FROM books;

# Average release year for each author
SELECT author_fname, author_lname, AVG(released_year)
FROM books
GROUP BY author_fname, author_lname;

# Full name of author who wrote the longest book
SELECT CONCAT(author_fname, ' ', author_lname) as full_name, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

# Release year, total books released, and average pages in that year
SELECT released_year, SUM(DISTINCT title) AS '# books', AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;