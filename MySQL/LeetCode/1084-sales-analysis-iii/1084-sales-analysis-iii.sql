# Write your MySQL query statement below
SELECT DISTINCT b.product_id, b.product_name
FROM Sales a LEFT JOIN
    (
    SELECT b.product_id, b.product_name, MAX(sale_date) max_date, MIN(sale_date) min_date
    FROM Sales a LEFT JOIN Product b ON a.product_id = b.product_id
    GROUP BY b.product_id, b.product_name
    ) b
ON a.product_id = b.product_id
WHERE (max_date BETWEEN '2019-01-01' AND '2019-03-31') AND (min_date BETWEEN '2019-01-01' AND '2019-03-31');