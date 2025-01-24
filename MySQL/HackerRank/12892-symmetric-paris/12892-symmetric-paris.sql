SELECT a.X, a.Y
FROM Functions a JOIN Functions b ON a.X = b.Y AND a.Y = b.X
WHERE a.X <= a.Y
GROUP BY a.X, a.Y
HAVING a.X != a.Y OR COUNT(*) > 1
ORDER BY a.X;
