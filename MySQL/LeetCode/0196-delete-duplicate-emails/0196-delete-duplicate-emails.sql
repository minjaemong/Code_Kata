# Write your MySQL query statement below
DELETE FROM Person
WHERE id NOT IN (SELECT a.min_id
                 FROM (SELECT email, MIN(id) min_id FROM Person GROUP BY email) a)