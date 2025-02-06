WITH RECURSIVE star_pattern AS (
    SELECT 1 n
    UNION ALL
    SELECT n + 1
    FROM star_pattern
    WHERE n < 20
    )
SELECT REPEAT('* ', n) FROM star_pattern;
