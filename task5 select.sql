-- 2. Список курсов с указанием количества студентов, зачисленных на каждый курс.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS students_count
FROM Courses c
	LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY c.course_id;

-- 4. Полная информация о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.
SELECT e.enrollment_id, s.first_name || ' ' || s.last_name AS student_name, c.course_name, e.enrollment_date, e.grade
FROM Enrollments e
	 LEFT JOIN Students s ON e.student_id=s.student_id JOIN Courses c ON e.course_id=c.course_id
WHERE current_date - e.enrollment_date <= interval '1 month';

-- 9. Список студентов, которые зачислены на курсы из разных департаментов.
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
	 LEFT JOIN Enrollments e ON s.student_id=e.student_id LEFT JOIN Courses c ON e.course_id=c.course_id
GROUP BY s.student_id
HAVING COUNT(DISTINCT c.department) > 1;

-- 10. Список курсов, на которые не зачислен ни один студент.
SELECT c.course_id, c.course_name, c.description, c.credits, c.department
FROM Enrollments e
	 RIGHT JOIN Courses c ON e.course_id=c.course_id
GROUP BY c.course_id
HAVING COUNT(e.student_id) = 0;

-- 12. Студенты, которые зачислены на курс с наибольшим количеством кредитов.
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
	 LEFT JOIN Enrollments e ON s.student_id=e.student_id LEFT JOIN Courses c ON e.course_id=c.course_id
WHERE e.course_id IN (
	SELECT course_id
	FROM Courses
	WHERE credits = (
		SELECT MAX(credits)
		FROM Courses
	)
)