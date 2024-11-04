# Write your MySQL query statement below
SELECT s.product_id, min_year first_year, quantity, price
FROM Sales s
JOIN    
    (
    SELECT product_id, MIN(year) min_year
    FROM Sales
    GROUP BY product_id
    ) a
ON s.product_id = a.product_id AND s.year = a.min_year