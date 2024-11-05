# Write your MySQL query statement below
SELECT customer_id
FROM Customer a
GROUP BY customer_id
HAVING COUNT(*) = (SELECT COUNT(DISTINCT product_key) FROM Product)