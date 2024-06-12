-- Удаление студента, зачисленного на курс с id=3 (отчисление с курса) 
DELETE FROM Enrollments
WHERE student_id = 2 AND course_id = 2;

-- Удаление курса без студентов
DELETE FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);
