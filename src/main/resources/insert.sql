-- Insert the parent rows first so students can reference valid course IDs.
INSERT INTO courses (course_id, name, credits)
VALUES (1, 'Java Programming', 4),
       (2, 'Database Fundamentals', 3),
       (3, 'Web Development', 5);

-- Insert five adults with unique emails and explicit IDs.
-- Leave course 3 empty to demonstrate a zero count in the LEFT JOIN query.
INSERT INTO students (student_id, name, email, age, course_id)
VALUES (1, 'Alice Johnson', 'alice@example.com', 20, 1),
       (2, 'Bob Smith', 'bob@example.com', 22, 2),
       (3, 'Carol Davis', 'carol@example.com', 19, 1),
       (4, 'David Brown', 'david@example.com', 24, 2),
       (5, 'Emma Wilson', 'emma@example.com', 21, 1);
