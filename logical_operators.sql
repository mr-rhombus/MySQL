# NOT EQUAL
# Find books not released in 2017
-- SELECT title, released_year
-- FROM books
-- WHERE released_year != 2017;


# NOT LIKE
# Find books without the word "the" in the title
-- SELECT title
-- FROM books
-- WHERE title NOT LIKE '%the%';


# GREATER THAN
# Find books released after 2000
-- SELECT title, released_year
-- FROM books
-- WHERE released_year > 2000;


# LESS THAN
# Find books released prior to 2000
-- SELECT title, released_year
-- FROM books
-- WHERE released_year < 2000;


# LOGICAL AND (&&)
# Find books written by Dave Eggers and released after 2010
-- SELECT title, author_fname, author_lname, released_year
-- FROM books
-- WHERE
--     author_fname = 'Dave' AND
--     author_lname = 'Eggers' AND
--     released_year > 2010;


# LOGICAL OR (||)
# Find books written by Dave Eggers or released after 2010
-- SELECT title, author_fname, author_lname, released_year
-- FROM books
-- WHERE
--     (author_fname = 'Dave' AND
--     author_lname = 'Eggers') OR
--     released_year > 2010;


# BETWEEN/NOT BETWEEN
# INCLUSIVE of endpoints!
# Find books released between 2000 and 2010
-- SELECT title, author_lname, released_year
-- FROM books
-- WHERE released_year BETWEEN 2000 AND 2010;


# CAST
# Change data type
-- SELECT CAST('2017-5-2' AS DATETIME);


# IN/NOT IN
# Show books written by Carver, Lahiri and/or Smith
-- SELECT title, author_lname
-- FROM books
-- WHERE author_lname in ('Carver', 'Lahiri', 'Smith');


# MODULO (%)
# Show books not released in even years
-- SELECT title, released_year
-- FROM books
-- WHERE released_year%2 != 0;


# CASE STATEMENTS
# Classify books as modern or 20th century lit based on release date
-- SELECT title, released_year,
--     CASE
--         WHEN released_year >= 2000 THEN 'Modern Lit'
--         ELSE '20th Century Lit'
--     END AS genre
-- FROM books;

# Visually quantify book stock
-- SELECT title, stock_quantity,
--     CASE
--         WHEN stock_quantity < 50 THEN '*'
--         WHEN stock_quantity BETWEEN 50 and 100 THEN '**'
--         ELSE '***'
--     END AS stock
-- FROM books;


# Exercises
# Evaluate
SELECT 10 != 10;                             # FALSE
SELECT 15 > 14 && 99-5 <= 94;                # TRUE
SELECT 1 in (5,3) || 9 BETWEEN 8 AND 10;     # TRUE

# Select all books written before 1980
SELECT title
FROM books
WHERE released_year < 1980;

# Select all books written by Eggers or Chabon
SELECT title, author_lname
FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

# Select all books written by Lahiri, published after 2000
SELECT title, author_lname
FROM books
WHERE author_lname LIKE '%Lahiri%' AND released_year > 2000;

# Select all books with page counts between 100 and 200
SELECT title, pages
FROM books
WHERE pages BETWEEN 100 and 200;

# Select all books where author_lname starts with a 'C' or an 'S';
SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'c%' OR author_lname LIKE 's%';

# If title contains stories -> short stories
# Just kids and heartbreaking work -> memoir
# Everything else -> novel
SELECT title, author_lname, 
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%just kids%' OR title LIKE '%a heartbreaking work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM books;

# "Make this happen"
SELECT title, author_lname, CONCAT(COUNT(*), ' books') AS counts
FROM books
GROUP BY author_lname
ORDER by author_lname;