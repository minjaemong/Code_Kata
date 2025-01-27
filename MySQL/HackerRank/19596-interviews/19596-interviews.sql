SELECT 
    cn.contest_id, 
    cn.hacker_id, 
    cn.name, 
    COALESCE(SUM(s.total_submissions), 0) AS total_submissions, 
    COALESCE(SUM(s.total_accepted_submissions), 0) AS total_accepted_submissions, 
    COALESCE(SUM(v.total_views), 0) AS total_views, 
    COALESCE(SUM(v.total_unique_views), 0) AS total_unique_views
FROM (
    SELECT DISTINCT 
        c.contest_id, 
        c.hacker_id, 
        c.name,
        ch.challenge_id 
    FROM 
        contests c
    INNER JOIN 
        colleges co ON c.contest_id = co.contest_id
    INNER JOIN 
        challenges ch ON co.college_id = ch.college_id
) AS cn
LEFT JOIN (
    SELECT 
        challenge_id, 
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions 
    FROM 
        submission_stats 
    GROUP BY 
        challenge_id
) AS s ON cn.challenge_id = s.challenge_id
LEFT JOIN (
    SELECT 
        challenge_id, 
        SUM(total_views) AS total_views, 
        SUM(total_unique_views) AS total_unique_views 
    FROM 
        view_stats 
    GROUP BY 
        challenge_id
) AS v ON cn.challenge_id = v.challenge_id
WHERE 
    COALESCE(s.total_submissions, 0) + COALESCE(s.total_accepted_submissions, 0) + COALESCE(v.total_views, 0) + COALESCE(v.total_unique_views, 0) > 0
GROUP BY 
    cn.contest_id, 
    cn.hacker_id, 
    cn.name
ORDER BY 
    cn.contest_id;
