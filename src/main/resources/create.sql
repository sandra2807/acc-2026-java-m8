-- Enable foreign key checks on the connection that runs all project scripts.
PRAGMA foreign_keys = ON;

-- Remove the child table first so no students reference courses being removed.
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

-- Create courses first because students will reference this table.
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    credits INTEGER NOT NULL CHECK (credits > 0)
);

-- Require a unique email, an adult age, and an existing course for each student.
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    age INTEGER NOT NULL CHECK (age >= 18),
    course_id INTEGER NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
