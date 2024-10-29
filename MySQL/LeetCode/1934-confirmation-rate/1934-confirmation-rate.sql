# Write your MySQL query statement below
SELECT a.user_id, ROUND(COALESCE(SUM(CASE WHEN b.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(*), 0), 2) confirmation_rate
FROM Signups a LEFT JOIN Confirmations b ON a.user_id = b.user_id
GROUP BY a.user_id