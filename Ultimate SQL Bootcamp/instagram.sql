# Exercises

# We want to reward our users who have been around the longest. Find the 5 oldest users
-- SELECT username, created_at
-- FROM users
-- ORDER BY created_at
-- LIMIT 5;


# We need to figure out when to schedule an ad campagin.
# What day of the week do the most users register on?
-- SELECT
--     DATE_FORMAT(created_at, '%W') AS day_of_week,
--     COUNT(*) AS num_registered
-- FROM users
-- GROUP BY day_of_week
-- ORDER BY num_registered DESC;


# We want to target our inactive users with an email campaign
# Find all inactive users (never posted a photo)
# BONUS: find users who have also never posted a comment

-- SELECT
--     users.username,
--     SUM(photos.id) AS total_photos
-- FROM users
-- LEFT JOIN photos
--     ON users.id = photos.user_id
-- GROUP BY users.username
-- HAVING total_photos IS NULL;


# We ran a contest to see who could get the most likes on a single photo. Who won?
# get photo_id with most likes, then left join with users
-- SELECT
--     users.username,
--     photos.image_url,
--     A.total_likes
-- FROM (
--     SELECT
--         likes.photo_id,
--         COUNT(likes.user_id) AS total_likes
--     FROM likes
--     GROUP BY likes.photo_id
--     ORDER BY total_likes DESC
--     LIMIT 1) A
-- LEFT JOIN photos
--     ON A.photo_id = photos.id
-- LEFT JOIN users
--     ON photos.user_id = users.id;

# Alternate solution with NO subquery
-- SELECT
--     users.username,
--     photos.image_url,
--     likes.photo_id,
--     COUNT(likes.user_id) AS total_likes
-- FROM likes
-- JOIN photos
--     ON likes.photo_id = photos.id
-- JOIN users
--     ON photos.user_id = users.id
-- GROUP BY likes.photo_id
-- ORDER BY total_likes DESC
-- LIMIT 1;


# How many times does the average user post?
# Get total photos/total users
-- SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_posts_per_user;


# A brand wants to know which hashtags to use in a post.
# What are the top 5 most commonly used hashtags?
# find the most common tags, then inner join in for tag names
-- SELECT
--     tags.tag_name,
--     photo_tags.tag_id,
--     COUNT(*) AS times_used
-- FROM photo_tags
-- INNER JOIN tags
--     ON photo_tags.tag_id = tags.id
-- GROUP BY photo_tags.tag_id
-- ORDER BY times_used DESC
-- LIMIT 5;


# We have a problem with bots on our site
# Find users who have liked every single photo on the site
# 1. find total num of photos (photos)
# 2. find user_ids where total likes = total # of photos (likes)
# 3. find username from user_ids (likes <-> users)

SELECT
    users.username,
    likes.user_id,
    COUNT(likes.photo_id) AS total_likes
FROM likes
JOIN users
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING total_likes = (
    SELECT COUNT(*)
    FROM photos
);