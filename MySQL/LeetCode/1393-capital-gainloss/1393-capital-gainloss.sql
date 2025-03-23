# Write your MySQL query statement below
SELECT stock_name, SUM(total) capital_gain_loss
FROM
    (
    SELECT *,
        CASE WHEN operation = 'Buy' THEN -1 * price
                WHEN operation = 'Sell' THEN price END AS total
    FROM Stocks
    ) a
GROUP BY stock_name
ORDER BY 2 DESC