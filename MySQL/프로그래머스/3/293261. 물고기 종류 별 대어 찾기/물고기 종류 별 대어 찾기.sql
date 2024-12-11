-- 코드를 작성해주세요
SELECT ID, FISH_NAME, LENGTH
FROM
    (
    SELECT ID, FISH_NAME, LENGTH, RANK() OVER (PARTITION BY FISH_NAME ORDER BY LENGTH DESC) rnk
    FROM FISH_INFO a LEFT JOIN FISH_NAME_INFO b ON a.FISH_TYPE = b.FISH_TYPE
    ) a
WHERE rnk = 1
ORDER BY ID;