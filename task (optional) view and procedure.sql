DROP VIEW IF EXISTS "StudentEnrollments";

-- Представление, которое объединяет информацию о студентах и их зачислениях на курсы
CREATE VIEW "StudentEnrollments" AS
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    s.date_of_birth,
    s.email,
    s.phone_number,
    s.address,
    s.enrollment_date AS student_enrollment_date,
    s.gpa,
    e.enrollment_id,
    e.course_id,
    e.enrollment_date AS course_enrollment_date,
    e.grade,
    c.course_name,
    c.description AS course_description,
    c.credits,
    c.department
FROM Students s
	 LEFT JOIN Enrollments e ON s.student_id = e.student_id
	 LEFT JOIN Courses c ON e.course_id = c.course_id;

-- Хранимая процедура для добавления нового студента и автоматического зачисления его на определенный курс
CREATE OR REPLACE PROCEDURE add_student_and_enroll(
    p_first_name VARCHAR(100),
    p_last_name VARCHAR(100),
    p_date_of_birth DATE,
    p_email VARCHAR(255),
    p_phone_number VARCHAR(20),
    p_address TEXT,
    p_enrollment_date TIMESTAMPTZ,
    p_gpa DECIMAL(3, 2),
    p_course_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_student_id INT;
BEGIN
    -- Добавление нового студента
    INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
    VALUES (p_first_name, p_last_name, p_date_of_birth, p_email, p_phone_number, p_address, p_enrollment_date, p_gpa)
    RETURNING student_id INTO v_student_id;

    -- Автоматическое зачисление студента на указанный курс
    INSERT INTO Enrollments (student_id, course_id, enrollment_date)
    VALUES (v_student_id, p_course_id, p_enrollment_date);
END;
$$;

-- Вызов процедуры
CALL add_student_and_enroll(
    'John', 
    'Doe', 
    '2002-05-15', 
    'john.doe@example.com', 
    '555-1234', 
    '123 Maple St, Springfield', 
    '2024-06-12 09:00:00', 
    3.4, 
    1
);

SELECT * FROM "StudentEnrollments";