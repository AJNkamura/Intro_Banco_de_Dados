-- 1) Names from instructors from biology department 
SELECT name, dept_name
FROM instructor 
where dept_name = "biology";

-- 2) 
SELECT course_id, credits, dept_name
from course
where dept_name = "comp. sci" && credits = 3;

-- 3) For the student with ID 12345, show all course_id and title of all courses registered for by the student.
SELECT c.course_id, c.title, ID
FROM takes as t
JOIN course as c ON t.course_id = c.course_id
WHERE t.ID = 12345;

-- 4)
SELECT ID, SUM(c.credits) AS total_credits
FROM takes as t
JOIN course as c ON t.course_id = c.course_id
WHERE t.ID = 12345;

-- 5)
SELECT ID, SUM(c.credits) AS total_credits
FROM takes as t
JOIN course as c ON t.course_id = c.course_id
group by ID;

-- 6)
SELECT DISTINCT s.name
FROM student as s
JOIN takes as t ON s.ID = t.ID
JOIN course as c ON t.course_id = c.course_id
WHERE c.dept_name = 'Comp. Sci.'; 

-- 7)

-- 8)
SELECT name
FROM instructor
WHERE ID NOT IN (
    SELECT DISTINCT ID
    FROM teaches
);

