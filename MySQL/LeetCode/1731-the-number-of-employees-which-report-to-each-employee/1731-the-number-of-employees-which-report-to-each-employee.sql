# Write your MySQL query statement below
SELECT a.employee_id, a.name, COUNT(b.reports_to) reports_count, ROUND(AVG(b.age)) average_age
FROM Employees a
JOIN Employees b ON a.employee_id = b.reports_to
GROUP BY a.employee_id
ORDER BY a.employee_id;