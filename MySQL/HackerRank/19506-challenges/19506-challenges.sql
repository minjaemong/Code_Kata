WITH cte1 as (
    SELECT b.hacker_id, name, COUNT(*) challenges_created
    FROM Challenges a LEFT JOIN Hackers b ON a.hacker_id = b.hacker_id
    GROUP BY b.hacker_id, name
),
cte2 as (
    SELECT MAX(challenges_created) 
    FROM cte1
),
cte3 as (
    SELECT challenges_created, COUNT(*) cnt
    FROM cte1
    GROUP BY challenges_created)
SELECT hacker_id, name, a.challenges_created
FROM cte1 a
LEFT JOIN cte3 b ON a.challenges_created = b.challenges_created
WHERE cnt = 1 OR a.challenges_created = (SELECT * FROM cte2)
ORDER BY a.challenges_created DESC, hacker_id;
