DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;

CREATE TABLE IF NOT EXISTS Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address TEXT,
    enrollment_date TIMESTAMPTZ NOT NULL,
    gpa DECIMAL(3, 2)
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    credits INT NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date TIMESTAMPTZ NOT NULL,
    grade INT,
    CONSTRAINT fk_student
        FOREIGN KEY(student_id) 
        REFERENCES Students(student_id),
    CONSTRAINT fk_course
        FOREIGN KEY(course_id) 
        REFERENCES Courses(course_id)
);