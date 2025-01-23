SELECT a.Name
FROM Students a LEFT JOIN Friends b ON a.ID = b.ID
LEFT JOIN Packages c ON a.ID = c.ID
LEFT JOIN Students d ON b.Friend_ID = d.ID
LEFT JOIN Packages e ON d.ID = e.ID
WHERE e.Salary >= c.Salary
ORDER BY e.Salary;
