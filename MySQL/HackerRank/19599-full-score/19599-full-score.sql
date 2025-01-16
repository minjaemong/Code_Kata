SELECT d.hacker_id, d.name
FROM Submissions a LEFT JOIN Challenges b ON a.challenge_id = b.challenge_id
LEFT JOIN Difficulty c ON b.difficulty_level = c.difficulty_level
LEFT JOIN Hackers d ON a.hacker_id = d.hacker_id
WHERE a.score = c.score
GROUP BY d.hacker_id, d.name
HAVING COUNT(DISTINCT b.challenge_id) > 1
ORDER BY COUNT(DISTINCT b.challenge_id) DESC, d.hacker_id;
