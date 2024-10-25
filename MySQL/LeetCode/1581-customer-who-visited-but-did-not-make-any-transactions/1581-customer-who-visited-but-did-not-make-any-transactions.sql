# Write your MySQL query statement below
SELECT a.customer_id, count(*)-count(transaction_id) count_no_trans
FROM Visits a LEFT JOIN Transactions b ON a.visit_id = b.visit_id
GROUP BY a.customer_id
HAVING count_no_trans > 0