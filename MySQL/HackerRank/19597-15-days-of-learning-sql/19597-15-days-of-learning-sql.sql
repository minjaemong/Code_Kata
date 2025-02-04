WITH cte1 AS (
    SELECT s.submission_date, s.hacker_id, h.name, COUNT(*) AS cnt
    FROM Submissions s
    JOIN Hackers h ON s.hacker_id = h.hacker_id
    GROUP BY s.submission_date, s.hacker_id, h.name
),
cte2 AS (
    SELECT s1.hacker_id, s1.submission_date,
           DATEDIFF(DAY, '2016-03-01', s1.submission_date) + 1 AS expected_days,
           COUNT(DISTINCT s2.submission_date) AS actual_days
    FROM Submissions s1
    JOIN Submissions s2 
        ON s1.hacker_id = s2.hacker_id
        AND s2.submission_date BETWEEN '2016-03-01' AND s1.submission_date
    GROUP BY s1.hacker_id, s1.submission_date
),
cte3 AS (
    SELECT submission_date, COUNT(DISTINCT hacker_id) AS total_cnt
    FROM cte2
    WHERE actual_days = expected_days
    GROUP BY submission_date
),
cte4 AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY cnt DESC, hacker_id) AS rnk
    FROM cte1
)
SELECT a.submission_date, COALESCE(b.total_cnt, 0), a.hacker_id, a.name
FROM cte4 a
LEFT JOIN cte3 b ON a.submission_date = b.submission_date
WHERE a.rnk = 1
ORDER BY a.submission_date;
