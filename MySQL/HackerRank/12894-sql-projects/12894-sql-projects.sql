WITH cte1 AS (
    SELECT *, LAG(End_Date) OVER(ORDER BY End_Date) last_end
    FROM Projects
    ),
cte2 AS (
    SELECT *, CASE WHEN Start_Date = last_end THEN 0 ELSE 1 END flag
    FROM cte1
    ),
cte3 AS (
    SELECT *, SUM(flag) OVER(ORDER BY End_Date) grp
    FROM cte2
    ),
cte4 AS (
    SELECT grp, MIN(Start_Date) project_start, MAX(End_Date) project_end, DATEDIFF(MAX(End_Date), MIN(Start_Date)) + 1 days
    FROM cte3
    GROUP BY grp
    )
SELECT project_start, project_end
FROM cte4
ORDER BY days, project_start;
