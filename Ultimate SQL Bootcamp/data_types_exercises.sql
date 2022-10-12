USE exercises;

# What is a good use case for CHAR?
# Storing country codes

# Create a new table
-- CREATE TABLE inventory (
--     item_name VARCHAR(100) NOT NULL,
--     price DECIMAL(8,2) NOT NULL,  # always less than 1M
--     quantity INT NOT NULL
-- );

# What is the difference between DATETIME and TIMESTAMP?
# DATETIME - smaller size in memory, primarily used to track when records are entered into a table
# TIMESTAMP - same date format (YYYY-MM-DD HH:MM:SS)

# Print out current time
SELECT CURTIME() AS 'current time';

# Print out current date
SELECT CURDATE() AS 'current date';

# Print out the current day of the week (#)
SELECT DATE_FORMAT(CURDATE(), '%w') AS 'numeric day of week';

# Print out current day of the week (day name)
SELECT DATE_FORMAT(CURDATE(), '%W') AS 'day of week';

# Print out current day and time like 'mm/dd/yyyy'
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

# Print out current day and time like 'January 2nd at 3:15'
SELECT DATE_FORMAT(NOW(), '%M %D at %l:%m');

# Create a tweets table that stores content, username, time created
CREATE TABLE tweets (
    content VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);