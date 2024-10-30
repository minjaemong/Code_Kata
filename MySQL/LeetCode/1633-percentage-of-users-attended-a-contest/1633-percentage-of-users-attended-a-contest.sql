# Write your MySQL query statement below
SELECT contest_id, ROUND(COUNT(*) / (SELECT COUNT(DISTINCT user_id) FROM Users) * 100, 2) percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id