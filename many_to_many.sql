# MANY TO MANY BASICS
/*
ex.
    - Books <-> Authors
    - Blog posts <-> Tags
    - Students <-> Classes
*/

# Challenges

-- Display title and individual rating for all shows
-- SELECT series.title, reviews.rating
-- FROM series
-- JOIN reviews
--     ON series.id = reviews.series_id;

-- -- Display title and average rating of each show
-- SELECT series.title, AVG(reviews.rating) as avg_rating
-- FROM series
-- JOIN reviews
--     ON series.id = reviews.series_id
-- GROUP BY series.title
-- ORDER BY avg_rating;

-- -- Select first and last names and all ratings for reviewers
-- SELECT 
--     reviewers.first_name,
--     reviewers.last_name,
--     reviews.rating
-- FROM reviewers
-- JOIN reviews
--     ON reviewers.id = reviews.reviewer_id;

-- -- ID unreviewed series' in the DB
-- SELECT series.title AS unreviewed_series
-- FROM series
-- LEFT JOIN reviews
--     ON series.id = reviews.series_id
-- WHERE reviews.rating IS NULL;

-- -- Find average rating for each genre
-- SELECT series.genre, AVG(reviews.rating) as avg_rating
-- FROM series
-- JOIN reviews
--     ON series.id = reviews.series_id
-- GROUP BY series.genre;

-- -- Show reviewer name, total reviews, min, max, avg and active status (inactive if no reviews)
-- SELECT
--     reviewers.first_name,
--     reviewers.last_name,
--     COUNT(reviews.rating) as total_reviews,
--     IFNULL(MIN(reviews.rating), 0) as min_review,
--     IFNULL(MAX(reviews.rating), 0) as max_review,
--     IFNULL(AVG(reviews.rating), 0) as avg_review,
--     CASE
--         WHEN COUNT(reviews.rating) = 0 THEN 'INACTIVE'
--         ELSE 'ACTIVE'
--     END AS status
-- FROM reviewers
-- LEFT JOIN reviews
--     ON reviewers.id = reviews.reviewer_id
-- GROUP BY reviewers.first_name, reviewers.last_name;

-- -- Show title of series, rating and reviewer
-- SELECT
--     series.title,
--     reviews.rating,
--     CONCAT(reviewers.first_name, ' ', reviewers.last_name) AS reviewer
-- FROM series
-- JOIN reviews
--     ON series.id = reviews.series_id
-- JOIN reviewers
--     ON reviews.reviewer_id = reviewers.id;

-- BONUS: Find title, highest review and reviewer name(s) for each show
SELECT
    A.title,
    A.max_rating,
    B.reviewer
FROM (
    SELECT
        series.title,
        MAX(reviews.rating) as max_rating
    FROM series
    JOIN reviews
        ON series.id = reviews.series_id
    GROUP BY series.title) A
LEFT JOIN (
    SELECT
        series.title,
        MAX(reviews.rating) AS max_rating,
        CONCAT(reviewers.first_name, ' ', reviewers.last_name) AS reviewer
    FROM series
    JOIN reviews
        ON series.id = reviews.series_id
    JOIN reviewers
        ON reviews.reviewer_id = reviewers.id
    GROUP BY series.title, reviewers.id
    ) B
    ON A.title = B.title
WHERE A.max_rating = B.max_rating
ORDER BY A.max_rating DESC;