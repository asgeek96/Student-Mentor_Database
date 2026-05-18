-- =============================================================
--  Student-Mentor Database System
--  File   : schema.sql
--  Purpose: Create database and all tables
--  Engine : MySQL 8.0+
-- =============================================================

CREATE DATABASE IF NOT EXISTS student_mentor;
USE student_mentor;

-- -------------------------------------------------------------
-- Table: department
-- One row per course offered by a department.
-- course_id is the primary key used by both student and mentor.
-- -------------------------------------------------------------
CREATE TABLE department (
    Dname      VARCHAR(45) NOT NULL,
    Dnumber    VARCHAR(10) NOT NULL,
    Course_id  VARCHAR(10) NOT NULL,
    Course     VARCHAR(45) NOT NULL,
    PRIMARY KEY (Course_id)
);

-- -------------------------------------------------------------
-- Table: mentor
-- Each mentor belongs to exactly one department/course.
-- -------------------------------------------------------------
CREATE TABLE mentor (
    MID                  INT(11)     NOT NULL,
    MFname               VARCHAR(45) NOT NULL,
    MLname               VARCHAR(45) NOT NULL,
    Phone_no             VARCHAR(15) NOT NULL,
    Email                VARCHAR(100) NOT NULL,
    Department_Course_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (MID),
    FOREIGN KEY (Department_Course_id) REFERENCES department(Course_id)
);

-- -------------------------------------------------------------
-- Table: student
-- Each student is enrolled in exactly one department/course.
-- -------------------------------------------------------------
CREATE TABLE student (
    SID                  INT(11)     NOT NULL,
    SFname               VARCHAR(45) NOT NULL,
    SLname               VARCHAR(45) NOT NULL,
    DOB                  DATE        NOT NULL,
    Year                 INT(4)      NOT NULL,
    Address              VARCHAR(100) NOT NULL,
    Department_Course_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (SID),
    FOREIGN KEY (Department_Course_id) REFERENCES department(Course_id)
);

-- -------------------------------------------------------------
-- Table: mentor_has_student  (junction table — M:N resolution)
-- A mentor can have many students; a student can have many
-- mentors. Composite primary key on (Mentor_MID, Student_SID).
-- -------------------------------------------------------------
CREATE TABLE mentor_has_student (
    Mentor_MID  INT(11)      NOT NULL,
    Student_SID INT(11)      NOT NULL,
    Remarks     VARCHAR(10)  NOT NULL,
    Year        INT(4)       NOT NULL,
    Description VARCHAR(100) NULL,
    PRIMARY KEY (Mentor_MID, Student_SID),
    FOREIGN KEY (Mentor_MID)  REFERENCES mentor(MID),
    FOREIGN KEY (Student_SID) REFERENCES student(SID)
);
