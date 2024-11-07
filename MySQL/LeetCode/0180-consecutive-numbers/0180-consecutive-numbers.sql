# Write your MySQL query statement below
SELECT num ConsecutiveNums
FROM
    (
    SELECT num, LAG(num, 1) OVER (ORDER BY id) prev , LAG(num, 2) OVER (ORDER BY id) pre_prev
    FROM Logs
    ) a
WHERE num = prev AND prev = pre_prev
GROUP BY num