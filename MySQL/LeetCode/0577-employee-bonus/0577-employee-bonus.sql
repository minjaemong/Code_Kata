# Write your MySQL query statement below
SELECT name, bonus
FROM Employee a
LEFT JOIN bonus b ON a.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;