SELECT b.hacker_id, b.name, SUM(a.max_score) AS total_score
FROM Hackers b
JOIN (
        SELECT hacker_id, challenge_id, MAX(score) AS max_score
        FROM Submissions
        GROUP BY hacker_id, challenge_id
    ) a
ON b.hacker_id = a.hacker_id
GROUP BY b.hacker_id, b.name
HAVING SUM(a.max_score) != 0
ORDER BY total_score DESC, b.hacker_id;
