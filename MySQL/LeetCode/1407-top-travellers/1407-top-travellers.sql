# Write your MySQL query statement below
SELECT b.name, COALESCE(SUM(distance), 0) travelled_distance
FROM Rides a RIGHT JOIN Users b ON a.user_id = b.id
GROUP BY a.user_id
ORDER BY travelled_distance DESC, b.name;