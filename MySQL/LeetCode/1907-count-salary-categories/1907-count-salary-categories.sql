# Write your MySQL query statement below
SELECT a.category, COALESCE(b.accounts_count, 0) accounts_count
FROM (SELECT 'Low Salary' category
      UNION ALL
      SELECT 'Average Salary'
      UNION ALL
      SELECT 'High Salary') a
LEFT JOIN
    (
    SELECT CASE WHEN income < 20000 THEN 'Low Salary'
                WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                WHEN income > 50000 THEN 'High Salary' END category,
                count(*) accounts_count
    FROM Accounts
    GROUP BY category
    ) b
ON a.category = b.category;