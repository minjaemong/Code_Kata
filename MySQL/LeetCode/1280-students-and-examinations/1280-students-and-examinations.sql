# Write your MySQL query statement below
SELECT stu.student_id, stu.student_name, sub.subject_name, COALESCE(COUNT(exam.subject_name), 0) attended_exams
FROM Students stu
CROSS JOIN Subjects sub
LEFT JOIN Examinations exam ON stu.student_id = exam.student_id AND sub.subject_name = exam.subject_name
GROUP BY stu.student_id, stu.student_name, sub.subject_name
ORDER BY stu.student_id, sub.subject_name;