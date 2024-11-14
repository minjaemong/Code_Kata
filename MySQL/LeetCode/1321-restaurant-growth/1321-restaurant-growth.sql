# Write your MySQL query statement below
WITH daily_sum AS (
    SELECT visited_on, SUM(amount) amount
    FROM Customer
    GROUP BY visited_on
    ),
sumover AS (
    SELECT visited_on,
        SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) amount,
        ROUND(AVG(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW), 2) average_amount
    FROM daily_sum
    )
SELECT *
FROM sumover
WHERE visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM daily_sum), INTERVAL 6 DAY);