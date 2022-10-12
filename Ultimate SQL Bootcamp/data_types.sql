# Storing text
- CHAR
    - Fixed length
    - Max length of 255
    - Right-padded with spaces to specified length
        - Spaces removed when querying data
    - Faster for storing fixed-length
        - State abbrev (MA, NY, ...)
        - Yes/no flags (Y, N)
- VARCHAR
    - Common option, almost always preferred


# Numbers
- DECIMAL
    - DECIMAL(13,2)
        - 13 is max # of total digits
        - 2 is max # of digits after DECIMAL
    - ex. DECIMAL(5,2)
    INSERT 7 -> 7.00
    INSERT 123456 -> 999.99
    INSERT 1.9999 -> 2.00

- FLOAT and DOUBLE
    - Store larger #s using less space at the cost of precision
        - FLOAT has precision issues after ~7 digits
        - DOUBLE has precision issues after ~15 digits
    - Prefer DOUBLE to float in a pinch!


# Dates and times
- DATE
    - YYYY-MM-DD
- TIME
    - HH:MM:SS
- DATETIME
    - YYYY-MM-DD HH:MM:SS
- CURDATE
    - Gives current date
- CURTIME
    - Gives current time
- NOW
    - Gives current datetime
- DATE_FORMAT(date, format)
    - Reformats date
    - ex. Reformat date
    SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');
- TIME_FORMAT(time, format)
    - Works similarly to DATE_FORMAT, but on times

# Example queries
# Get day
SELECT name, DAY(birthdate), FROM people;

# DATE math
- DATEDIFF(date1, date2)
    - Finds # of days between 2 dates
    - ex. Find how many days ago people were born
    SELECT DATEDIFF(NOW(), birthdate)
    FROM people;
- DATE_ADD(date, interval, expr_unit)
    - Interval = quantity
    - expr_unit = days, weeks, years, ...
    ex. Add X months to all birthdates
    SELECT name, birthdate, DATE_ADD(birthdt, INTERVAL 10 MONTH)
    FROM people;
    // OR //
    SELECT name, birthdate, birthdate + INTERVAL 10 MONTH + INTERVAL 5 HOUR
    FROM people;

# How to set up automatic timestamps
    - Track when a row was recorded
    - TIMESTAMP
        - Stores same type of data as DATETIME, but takes up less space
        - Recommended to only use for tracking row entry
    ex. Create new table. Track timestamp when entries are made
    CREATE TABLE comments (
        content VARCHAR(100),
        created_at TIMESTAMP DEFAULT NOW()
    );
    ex. Create new table. Track timestamp when entries are created AND updated
    CREATE TABLE comments2(
        content VARCHAR(100),
        changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
    )