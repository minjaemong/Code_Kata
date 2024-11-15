# Write your MySQL query statement below
SELECT id, SUM(num) num
FROM
    (
    SELECT requester_id id, COUNT(requester_id) num
    FROM RequestAccepted
    GROUP BY requester_id

    UNION ALL

    SELECT accepter_id id, COUNT(accepter_id) num
    FROM RequestAccepted
    GROUP BY accepter_id
    ) a
GROUP BY id
ORDER BY num DESC
LIMIT 1;