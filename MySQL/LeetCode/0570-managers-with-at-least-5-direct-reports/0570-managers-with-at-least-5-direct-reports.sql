# Write your MySQL query statement below
SELECT b.name
FROM (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
    ) AS a
JOIN Employee b ON a.managerId = b.id;