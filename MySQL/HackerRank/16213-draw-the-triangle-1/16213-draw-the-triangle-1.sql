WITH RECURSIVE star_pattern AS (
    SELECT 20 n
    UNION ALL
    SELECT n - 1
    FROM star_pattern
    WHERE n > 1
    )
SELECT REPEAT('* ', n) FROM star_pattern;
