-- source C:\Users\611391\Documents\Learning\MySQL\insert_data.sql

USE cat_app;

# INSERT
-- INSERT INTO cats(name, age)
-- VALUES ('Jetson', 7); 


# MULTIPLE INSERT
-- INSERT INTO cats(name, age)
-- VALUES
--     ('Charlie', 10),
--     ('Peanut', 2),
--     ('Benji', 8);


# NULL and NOT NULL
-- INSERT INTO cats(name)
-- VALUES ('null age');

# Enforce not null
-- CREATE TABLE cats2
--     (
--         name VARCHAR(100) NOT NULL,
--         age INT NOT NULL
--     );
-- DESC cats2;


# Default values
-- CREATE TABLE cats3
--     (
--         name VARCHAR(100) NOT NULL DEFAULT 'no name',
--         age INT NOT NULL DEFAULT 69
--     );
-- DESC cats3;


# Primary Keys
-- CREATE TABLE unique_cats
-- (
--     cat_id INT NOT NULL AUTO_INCREMENT,
--     name VARCHAR(100),
--     age INT,
--     PRIMARY KEY (cat_id)
-- );
-- DESC unique_cats;


# Exercise
-- CREATE DATABASE exercises;
-- USE exercises;
-- CREATE TABLE employees
--     (
--         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--         last_name VARCHAR(100) NOT NULL,
--         first_name VARCHAR(100) NOT NULL,
--         middle_name VARCHAR(100),
--         age INT NOT NULL,
--         current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
--     );
-- DESC employees;