--  source C:\Users\611391\Documents\Learning\MySQL\crud.sql
 
# Remake cats table
--  DROP TABLE cats;
--  CREATE TABLE cats
--     (
--         cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--         name VARCHAR(100),
--         breed VARCHAR(100),
--         age INT
--     );

-- INSERT INTO cats(name, breed, age)
-- VALUES
--     ('Ringo', 'Tabby', 4),
--     ('Cindy', 'Maine Coon', 10),
--     ('Dumbledore', 'Maine Coon', 11),
--     ('Egg', 'Persian', 4),
--     ('Misty', 'Tabby', 13),
--     ('George Michael', 'Ragdoll', 9),
--     ('Jackson', 'Sphynx', 7);


# READ
-- SELECT *
-- FROM cats
-- WHERE name='Egg';


# Aliases
-- SELECT cat_id AS id, name
-- FROM cats;


# UDPATE
-- UPDATE cats SET breed='Shorthair'
-- WHERE name='Ringo';


# DELETE
-- DELETE FROM cats
-- WHERE name='Egg';

# Delete all records from table
-- DELETE FROM cats;


-- CRUD EXERCISES
CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts
    (
        shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        article VARCHAR(100) NOT NULL,
        color VARCHAR(100) NOT NULL,
        shirt_size VARCHAR(2) NOT NULL,
        last_worn INT
    );

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

SELECT article, color FROM shirts;

SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size = 'M';
SELECT * FROM shirts;

UPDATE shirts SET shirt_size='L'
WHERE article='polo shirt';
SELECT * FROM shirts;

UPDATE shirts SET last_worn=0
WHERE last_worn=15;
SELECT * FROM shirts;

UPDATE shirts SET shirt_size='XS', color='off white'
WHERE color='white';
SELECT * FROM shirts;

DELETE FROM shirts
WHERE last_worn=200;
SELECT * FROM shirts;

DELETE FROM shirts
WHERE article='tank top';
SELECT * FROM shirts;

DELETE FROM shirts;
SELECT * FROM shirts;

DROP TABLE shirts;