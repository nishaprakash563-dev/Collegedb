CREATE DATABASE college_db;
USE college_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    building VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    dept_id INT,
    credits INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    dept_id INT,
    gpa DECIMAL(3,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES (1, 'Computer Science', 'Block A');
INSERT INTO departments VALUES (2, 'Mechanical', 'Block B');
INSERT INTO departments VALUES (3, 'Electrical', 'Block C');

INSERT INTO courses VALUES (101, 'Data Structures', 1, 4);
INSERT INTO courses VALUES (102, 'Operating Systems', 1, 3);
INSERT INTO courses VALUES (103, 'Thermodynamics', 2, 4);
INSERT INTO courses VALUES (104, 'Machine Design', 2, 3);
INSERT INTO courses VALUES (105, 'Circuit Theory', 3, 4);

INSERT INTO students VALUES (1, 'Nisha Sharma', 20, 1, 8.9);
INSERT INTO students VALUES (2, 'Rahul Verma', 21, 1, 7.5);
INSERT INTO students VALUES (3, 'Priya Singh', 19, 2, 8.2);
INSERT INTO students VALUES (4, 'Amit Kumar', 22, 3, 6.8);
INSERT INTO students VALUES (5, 'Sneha Patil', 20, 1, 9.1);
INSERT INTO students VALUES (6, 'Karan Mehta', 21, 2, 7.0);
INSERT INTO students VALUES (7, 'Divya Reddy', 20, 3, 8.6);
INSERT INTO students VALUES (8, 'Arjun Nair', 22, 1, 6.5);
INSERT INTO students VALUES (9, 'Pooja Joshi', 19, 2, 8.8);
INSERT INTO students VALUES (10, 'Vikram Rao', 23, 3, 7.3);

SELECT * FROM students;

SELECT name, age FROM students WHERE age > 20;

SELECT name, gpa FROM students ORDER BY gpa DESC;

SELECT students.name, departments.dept_name
FROM students
JOIN departments ON students.dept_id = departments.dept_id;

SELECT COUNT(*) FROM students;

SELECT AVG(gpa) FROM students;

SELECT MAX(gpa) FROM students;

SELECT MIN(gpa) FROM students;

SELECT SUM(credits) FROM courses;

SELECT dept_id, COUNT(*) AS total_students
FROM students
GROUP BY dept_id;

SELECT dept_id, AVG(gpa) AS avg_gpa
FROM students
GROUP BY dept_id;

SELECT dept_id, MAX(gpa) AS highest_gpa
FROM students
GROUP BY dept_id;
