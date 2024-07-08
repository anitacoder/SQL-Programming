CREATE DATABASE LEARN;
USE LEARN;

CREATE TABLE students (
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT, 
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students (student_id, student_name) VALUES 
(1, 'Uchenna'),
(2, 'Franklyn'),
(3, 'Micheal');

INSERT INTO courses (course_id, course_name) VALUES
(101, 'Mathematics'),
(102, 'English'),
(103, 'Physics');

INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES 
(1, 1, 101, '2024-01-25'),
(2, 1, 102, '2024-01-26'),
(3, 2, 103, '2024-01-27'),
(4, 3, 101, '2024-01-28');

SELECT * FROM students WHERE student_id = 2 OR student_id = 3;
SELECT * FROM courses;
SELECT * FROM enrollments;







