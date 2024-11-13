# Write your MySQL query statement below
WITH mu AS (SELECT a.movie_id, a.user_id, rating, created_at, b.title, c.name
    FROM MovieRating a
    LEFT JOIN Movies b ON a.movie_id = b.movie_id
    LEFT JOIN Users c ON a.user_id = c.user_id)
(SELECT name results
FROM mu
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title results
FROM mu
WHERE created_at LIKE '2020-02%'
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1);
