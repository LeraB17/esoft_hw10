-- Добавление студентов
INSERT 
INTO Students (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa) 
VALUES
('Alice', 'Johnson', '2000-01-15', 'alice.johnson@example.com', NULL, '123 Maple St, Springfield', '2020-09-01', 4.5),
('Bob', 'Smith', '1999-06-21', 'bob.smith@example.com', '555-1234', '456 Oak St, Springfield', '2023-09-01', 3.8),
('Carol', 'White', '2001-03-11', 'carol.white@example.com', NULL, '789 Pine St, Springfield', '2020-09-01', NULL),
('Dave', 'Brown', '2000-11-30', 'dave.brown@example.com', '555-5678', '101 Birch St, Springfield', '2023-09-01', 3.2),
('Eve', 'Davis', '1998-12-22', 'eve.davis@example.com', '555-8765', '202 Elm St, Springfield', '2023-09-01', NULL);

-- Добавление курсов
INSERT 
INTO Courses (course_name, description, credits, department) 
VALUES
('Computer Science', 'Introduction to Computer Science', 3, 'Mathematics and Computer Science'),
('Mathematics', 'Introduction to Algebra', 4, 'Mathematics and Computer Science'),
('History', 'World History Overview', 3, 'History');

-- Добавление зачислений
INSERT 
INTO Enrollments (student_id, course_id, enrollment_date, grade) 
VALUES
(1, 1, '2020-09-02', 5),
(2, 2, '2023-09-02', NULL),
(3, 3, '2020-09-02', 3),
(4, 1, '2023-09-02', 2),
(1, 2, '2024-05-20', 4),
(3, 2, '2024-05-20', 5);
