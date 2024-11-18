# Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM
    (
    SELECT a.name Employee, b.name Department, a.salary Salary, DENSE_RANK() OVER (PARTITION BY a.departmentId ORDER BY a.salary DESC) rnk
    FROM Employee a LEFT JOIN Department b ON a.departmentId = b.id
    ) a
WHERE rnk <= 3