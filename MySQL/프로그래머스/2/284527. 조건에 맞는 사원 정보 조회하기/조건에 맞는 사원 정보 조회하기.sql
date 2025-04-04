-- 코드를 작성해주세요
SELECT SUM(b.SCORE) SCORE, a.EMP_NO, a.EMP_NAME, a.POSITION, a.EMAIL
FROM HR_EMPLOYEES a LEFT JOIN HR_GRADE b ON a.EMP_NO = b.EMP_NO
GROUP BY a.EMP_NO, b.YEAR
HAVING b.YEAR = 2022
ORDER BY SCORE DESC
LIMIT 1;