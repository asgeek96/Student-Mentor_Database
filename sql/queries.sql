-- =============================================================
--  Student-Mentor Database System
--  File   : queries.sql
--  Purpose: Useful SELECT queries for reporting and analysis
--  Run    : After schema.sql and insert_data.sql
-- =============================================================

USE student_mentor;

-- -------------------------------------------------------------
-- Q1: List all students with their department and course name
-- -------------------------------------------------------------
SELECT
    s.SID,
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name,
    d.Dname                          AS Department,
    d.Course                         AS Course
FROM student s
JOIN department d ON s.Department_Course_id = d.Course_id
ORDER BY s.SID;

-- -------------------------------------------------------------
-- Q2: List all mentors with their department and course name
-- -------------------------------------------------------------
SELECT
    m.MID,
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    m.Email,
    d.Dname                          AS Department,
    d.Course                         AS Course
FROM mentor m
JOIN department d ON m.Department_Course_id = d.Course_id
ORDER BY m.MID;

-- -------------------------------------------------------------
-- Q3: Find all students assigned to a specific mentor (MID = 9)
-- -------------------------------------------------------------
SELECT
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name,
    ms.Remarks,
    ms.Year,
    ms.Description
FROM mentor_has_student ms
JOIN mentor  m ON ms.Mentor_MID  = m.MID
JOIN student s ON ms.Student_SID = s.SID
WHERE ms.Mentor_MID = 9;

-- -------------------------------------------------------------
-- Q4: Count how many students each mentor is assigned to
-- -------------------------------------------------------------
SELECT
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    COUNT(ms.Student_SID)            AS Total_Students
FROM mentor m
LEFT JOIN mentor_has_student ms ON m.MID = ms.Mentor_MID
GROUP BY m.MID, m.MFname, m.MLname
ORDER BY Total_Students DESC;

-- -------------------------------------------------------------
-- Q5: List top-performing students (Remarks = 'A++')
-- -------------------------------------------------------------
SELECT
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name,
    d.Course                         AS Course,
    ms.Remarks,
    ms.Year
FROM student s
JOIN mentor_has_student ms ON s.SID       = ms.Student_SID
JOIN department         d  ON s.Department_Course_id = d.Course_id
WHERE ms.Remarks = 'A++'
ORDER BY ms.Year;

-- -------------------------------------------------------------
-- Q6: List mentors and students belonging to the same department
-- -------------------------------------------------------------
SELECT
    d.Dname                          AS Department,
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name
FROM department d
JOIN mentor  m ON m.Department_Course_id = d.Course_id
JOIN student s ON s.Department_Course_id = d.Course_id
ORDER BY d.Dname, m.MLname;

-- -------------------------------------------------------------
-- Q7: Full assignment report — mentor, student, department, grade
-- -------------------------------------------------------------
SELECT
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name,
    d.Dname                          AS Department,
    d.Course                         AS Course,
    ms.Remarks,
    ms.Year,
    ms.Description
FROM mentor_has_student ms
JOIN mentor     m ON ms.Mentor_MID  = m.MID
JOIN student    s ON ms.Student_SID = s.SID
JOIN department d ON s.Department_Course_id = d.Course_id
ORDER BY ms.Year, m.MLname;

-- -------------------------------------------------------------
-- Q8: Departments with no assigned mentor-student pairs
-- -------------------------------------------------------------
SELECT
    d.Course_id,
    d.Dname,
    d.Course
FROM department d
WHERE d.Course_id NOT IN (
    SELECT DISTINCT m.Department_Course_id
    FROM mentor m
    JOIN mentor_has_student ms ON m.MID = ms.Mentor_MID
);
