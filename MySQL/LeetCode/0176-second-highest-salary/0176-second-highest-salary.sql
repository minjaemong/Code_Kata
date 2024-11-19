# Write your MySQL query statement below
SELECT MAX(CASE WHEN rnk = 2 THEN salary END) SecondHighestSalary
FROM
    (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) rnk
    FROM Employee
    ) a;