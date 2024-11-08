# Write your MySQL query statement below
SELECT a.product_id, COALESCE(c.new_price, 10) price
FROM
(SELECT DISTINCT product_id FROM Products) a
LEFT JOIN
    (
    SELECT product_id, MAX(change_date) change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
    ) b
ON a.product_id = b.product_id
LEFT JOIN Products c
ON b.product_id = c.product_id AND b.change_date = c.change_date;