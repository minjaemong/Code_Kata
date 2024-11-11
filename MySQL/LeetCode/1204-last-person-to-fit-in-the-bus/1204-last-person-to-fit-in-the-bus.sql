# Write your MySQL query statement below
SELECT person_name
FROM
    (
        SELECT *, SUM(Weight) OVER (ORDER BY turn) Total_Weight
    FROM Queue
    ) a
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC
LIMIT 1;