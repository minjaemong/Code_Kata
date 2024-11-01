# Write your MySQL query statement below
WITH first AS(
    SELECT player_id, MIN(event_date) first_login
    FROM Activity
    GROUP BY player_id
    )
SELECT ROUND(COUNT(DISTINCT b.player_id) / COUNT(DISTINCT a.player_id), 2) fraction
FROM Activity a LEFT JOIN first b ON a.player_id = b.player_id
AND DATEDIFF(a.event_date, b.first_login) = 1;
