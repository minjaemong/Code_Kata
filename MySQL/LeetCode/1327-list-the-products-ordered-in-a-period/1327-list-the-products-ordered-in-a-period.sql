# Write your MySQL query statement below
SELECT b.product_name, SUM(a.unit) unit
FROM Orders a LEFT JOIN Products b ON a.product_id = b.product_id
WHERE a.order_date LIKE '2020-02%'
GROUP BY b.product_name
HAVING unit >= 100;