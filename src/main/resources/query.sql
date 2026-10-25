-- 1. Show all courses to check the inserted course data.
-- Expected: three courses, ordered by course_id.
SELECT * FROM courses ORDER BY course_id;

-- 2. Show all students to check the starting data before making changes.
-- Expected: five students, ordered by student_id.
SELECT * FROM students ORDER BY student_id;

-- 3. Filter by age to find students strictly older than 20.
-- Expected: Bob (22), David (24), and Emma (21).
SELECT * FROM students WHERE age > 20 ORDER BY student_id;

-- 4. Match each student to a course to display readable course names.
-- Expected: all five students with their email, age, and course name.
SELECT students.name AS student_name, students.email, students.age,
       courses.name AS course_name
FROM students
INNER JOIN courses ON students.course_id = courses.course_id
ORDER BY students.student_id;

-- 5. Keep every course and count its matching students to show enrollment.
-- Count student IDs so a course without a student has a count of zero.
-- Expected: Java Programming 3, Database Fundamentals 2, Web Development 0.
SELECT courses.course_id, courses.name AS course_name,
       COUNT(students.student_id) AS student_count
FROM courses
LEFT JOIN students ON courses.course_id = students.course_id
GROUP BY courses.course_id, courses.name
ORDER BY courses.course_id;

-- 6. Correct one student's age using the primary key to target only that row.
-- Expected: Alice's age changes from 20 to 21, affecting one student.
UPDATE students SET age = 21 WHERE student_id = 1;

-- 7. Move one student to another existing course to practice a valid relationship change.
-- Expected: Bob moves from course 2 to course 3 (Web Development).
UPDATE students SET course_id = 3 WHERE student_id = 2;

-- 8. Delete one student by primary key to practice removing a single row safely.
-- Expected: David (student_id 4) is removed, leaving four students.
DELETE FROM students WHERE student_id = 4;

-- 9. Join the remaining students to their courses to verify all three changes.
-- Expected: Alice (21, Java), Bob (22, Web), Carol (19, Java), Emma (21, Java).
SELECT students.student_id, students.name AS student_name,
       students.email, students.age, courses.name AS course_name
FROM students
INNER JOIN courses ON students.course_id = courses.course_id
ORDER BY students.student_id;
