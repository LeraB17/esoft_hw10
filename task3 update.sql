-- Обновление информации о студенте
UPDATE Students
SET phone_number = '555-9999', address = '321 Maple St, Springfield'
WHERE student_id = 1;

-- Обновление описания курса
UPDATE Courses
SET description = 'Introduction to Algebra and Geometry.'
WHERE course_id = 2;

-- Обновление оценки за курс
UPDATE Enrollments
SET grade = 3.0
WHERE enrollment_id = 4;
