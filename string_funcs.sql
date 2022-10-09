USE bookstore;

# CONCAT
-- SELECT CONCAT(author_fname, ' ', author_lname) as fullname
-- FROM books;

# CONCAT_WS (with separator)
-- SELECT CONCAT_WS(' ', author_fname, author_lname) as fullname
-- FROM books;


# SUBSTRING
# Index starts at 1. Inclusive of both bounds
-- SELECT SUBSTRING('hello world', 1, 4);  # 'hell' (first char through 4th char)
-- SELECT SUBSTRING('hello world', 7);  # 'world' (index 7 onwards)
-- SELECT SUBSTRING('hello world', -3);  # 'rld' (last 3 chars)

# CONCAT and SUBSTRING
-- SELECT CONCAT(SUBSTRING(title, 1, 10), '...') as abbrev_title
-- FROM books;


# REPLACE
-- SELECT REPLACE('Hello world', 'Hell', '%$#@');

# REPLACE and SUBSTRING
-- SELECT REPLACE(SUBSTRING(title, 1, 10), 'e', '3')
-- # also works the same if you SUBSTRING(CONAT)
-- FROM books;


# REVERSE
-- SELECT REVERSE('hello world');


# CHAR_LENGTH
-- SELECT CHAR_LENGTH('hello world');


# UPPER and LOWER
-- SELECT UPPER('hello world');
-- SELECT LOWER('Hello World');


# Exercises
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') as 'new title'
FROM books;

SELECT 
    author_lname as forwards,
    REVERSE(author_lname) as backwards
FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) as 'full name in caps'
FROM books;

SELECT CONCAT(title, ' was released in ', released_year) as blurb
FROM books;

SELECT title, CHAR_LENGTH(title) as 'character count'
FROM books;

SELECT
    SUBSTRING(title, 1, 10) as 'short title',
    CONCAT(author_lname, ',', author_fname) as author,
    CONCAT(stock_quantity, ' in stock') as quantity
FROM books;