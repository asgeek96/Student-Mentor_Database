# 🎓 Student-Mentor Database System

A relational database system designed to manage student-mentor assignments across academic departments. Built using **MySQL**, this project demonstrates core database concepts including schema design, normalization, foreign key relationships, and data integrity.

---

## 📌 Project Overview

Academic institutions often struggle to track which mentor is assigned to which student, across which course and department. This system solves that by providing a clean, normalized relational database that:

- Tracks students and their department/course enrollments
- Manages mentor profiles and their departmental affiliations
- Records mentor-student assignments along with yearly remarks
- Enforces referential integrity across all relationships

---

## 🗂️ Database Schema

The database `student_mentor` consists of **4 tables**:

### `department`
| Column     | Type        | Description                        |
|------------|-------------|------------------------------------|
| Dname      | VARCHAR(45) | Department name (e.g., Comp_Sci)   |
| Dnumber    | VARCHAR(45) | Department code (e.g., CS-1)       |
| course_id  | VARCHAR(45) | **Primary Key** – Unique course ID |
| course     | VARCHAR(45) | Course name (e.g., Cyber Security) |

### `student`
| Column                | Type        | Description                               |
|-----------------------|-------------|-------------------------------------------|
| SID                   | VARCHAR(45) | **Primary Key** – Student ID              |
| SFname                | VARCHAR(45) | First name                                |
| SLname                | VARCHAR(45) | Last name                                 |
| DOB                   | VARCHAR(45) | Date of birth                             |
| Year                  | VARCHAR(45) | Year of enrollment                        |
| Address               | VARCHAR(45) | Residential address                       |
| department_course_id  | VARCHAR(45) | **Foreign Key** → department(course_id)   |

### `mentor`
| Column                | Type        | Description                              |
|-----------------------|-------------|------------------------------------------|
| MID                   | INT(11)     | **Primary Key** – Mentor ID              |
| MFname                | VARCHAR(45) | First name                               |
| MLname                | VARCHAR(45) | Last name                                |
| Phone_no              | VARCHAR(45) | Contact number                           |
| Email                 | VARCHAR(45) | Institutional email                      |
| department_course_id  | VARCHAR(45) | **Foreign Key** → department(course_id)  |

### `mentor_has_student` *(Junction Table)*
| Column     | Type        | Description                                      |
|------------|-------------|--------------------------------------------------|
| mentor_MID | INT(11)     | **Foreign Key** → mentor(MID)                    |
| student_SID| VARCHAR(45) | **Foreign Key** → student(SID)                   |
| Remarks    | VARCHAR(45) | Academic performance grade (e.g., A++, B+, F-)   |
| Year       | INT(11)     | Year of mentorship                               |
| Description| VARCHAR(45) | Additional notes                                 |

---

## 🔗 Entity-Relationship Diagram

![ER Diagram](ERDiagram.png)

**Key Relationships:**
- A **Department** offers one or more courses (`1:N`)
- A **Student** belongs to one Department/Course (`N:1`)
- A **Mentor** belongs to one Department/Course (`N:1`)
- A **Mentor** can have many **Students**, and a Student can have many Mentors (`M:N`) — resolved via the `mentor_has_student` junction table

---

## 🛠️ Tech Stack

| Tool         | Purpose                        |
|--------------|-------------------------------|
| MySQL        | Relational database engine     |
| MySQL Workbench | Schema design & ER diagram  |
| CSV          | Sample data files              |

---

## 🚀 Setup & Usage

### Prerequisites
- MySQL Server installed
- MySQL Workbench (optional, for visual management)

### Step 1: Create the Database

```sql
CREATE DATABASE student_mentor;
USE student_mentor;
```

### Step 2: Create Tables

```sql
CREATE TABLE department (
    Dname        VARCHAR(45) NOT NULL,
    Dnumber      VARCHAR(45) NOT NULL,
    course_id    VARCHAR(45) NOT NULL,
    course       VARCHAR(45) NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE mentor (
    MID                  INT(11)     NOT NULL,
    MFname               VARCHAR(45) NOT NULL,
    MLname               VARCHAR(45) NOT NULL,
    Phone_no             VARCHAR(45) NOT NULL,
    Email                VARCHAR(45) NOT NULL,
    department_course_id VARCHAR(45) NOT NULL,
    PRIMARY KEY (MID),
    FOREIGN KEY (department_course_id) REFERENCES department(course_id)
);

CREATE TABLE student (
    SID                  VARCHAR(45) NOT NULL,
    SFname               VARCHAR(45) NOT NULL,
    SLname               VARCHAR(45) NOT NULL,
    DOB                  VARCHAR(45) NOT NULL,
    Year                 VARCHAR(45) NOT NULL,
    Address              VARCHAR(45) NOT NULL,
    department_course_id VARCHAR(45) NOT NULL,
    PRIMARY KEY (SID),
    FOREIGN KEY (department_course_id) REFERENCES department(course_id)
);

CREATE TABLE mentor_has_student (
    mentor_MID  INT(11)     NOT NULL,
    student_SID VARCHAR(45) NOT NULL,
    Remarks     VARCHAR(45) NOT NULL,
    Year        INT(11)     NOT NULL,
    Description VARCHAR(45),
    PRIMARY KEY (mentor_MID, student_SID),
    FOREIGN KEY (mentor_MID)  REFERENCES mentor(MID),
    FOREIGN KEY (student_SID) REFERENCES student(SID)
);
```

### Step 3: Load Sample Data

```sql
-- Department
INSERT INTO department VALUES ('Comp_Sci', 'CS-1', 'CS-101', 'Cyber Security');
INSERT INTO department VALUES ('Comp_Sci', 'CS-1', 'CS-102', 'Comp_Network');

-- Mentor
INSERT INTO mentor VALUES (1, 'Yadu', 'Krishnan_S', '9412165651', 'yadukrishnan.s@alliance.edu.in', 'ME-101');
INSERT INTO mentor VALUES (2, 'Manjunath', 'SV', '8650505642', 'manjunath.sv@alliance.edu.in', 'ECE-101');

-- Student
INSERT INTO student VALUES ('102', 'Sinan', 'Bin', '24-05-1992', '2015', 'ABC', 'IT-102');
INSERT INTO student VALUES ('1024', 'Arun', 'Singh', '28-07-1992', '2006', 'AAA', 'CS-102');

-- Mentor-Student Assignment
INSERT INTO mentor_has_student VALUES (12, '102', 'F-', 2002, NULL);
INSERT INTO mentor_has_student VALUES (8, '1234', 'B+', 2009, NULL);
```

> Full sample data is available in the `/data` CSV files: `Student.csv`, `Mentor.csv`, `Department.csv`, `mentor_has_Student.csv`

---

## 📊 Sample Queries

### 1. List all students with their department and course
```sql
SELECT s.SID, s.SFname, s.SLname, d.Dname, d.course
FROM student s
JOIN department d ON s.department_course_id = d.course_id;
```

### 2. Find all students assigned to a specific mentor
```sql
SELECT s.SFname, s.SLname, ms.Remarks, ms.Year
FROM mentor_has_student ms
JOIN student s ON ms.student_SID = s.SID
WHERE ms.mentor_MID = 8;
```

### 3. Count how many students each mentor is assigned to
```sql
SELECT m.MFname, m.MLname, COUNT(ms.student_SID) AS student_count
FROM mentor m
LEFT JOIN mentor_has_student ms ON m.MID = ms.mentor_MID
GROUP BY m.MID, m.MFname, m.MLname
ORDER BY student_count DESC;
```

### 4. List mentors and students in the same department
```sql
SELECT m.MFname AS Mentor, s.SFname AS Student, d.Dname AS Department
FROM mentor m
JOIN department d ON m.department_course_id = d.course_id
JOIN student s ON s.department_course_id = d.course_id;
```

### 5. Find students with remarks of 'A++' (top performers)
```sql
SELECT s.SFname, s.SLname, ms.Remarks, ms.Year
FROM student s
JOIN mentor_has_student ms ON s.SID = ms.student_SID
WHERE ms.Remarks = 'A++';
```

---

## 📁 Repository Structure

```
Student-Mentor-Database/
├── README.md                  ← Project documentation
├── ERDiagram.png              ← Entity-Relationship Diagram
├── Initial_entities.docx      ← Design document with CREATE & INSERT statements
├── data/
│   ├── Department.csv         ← 12 department/course records
│   ├── Mentor.csv             ← 12 mentor records
│   ├── Student.csv            ← 19 student records
│   └── mentor_has_Student.csv ← 19 mentor-student assignment records
```

---

## 💡 Key Concepts Demonstrated

- **Relational Schema Design** – Entities, attributes, and relationships modelled from scratch
- **Normalization** – Tables designed to reduce redundancy (3NF)
- **Primary & Foreign Keys** – Referential integrity enforced across all 4 tables
- **Junction Table** – M:N relationship between Mentor and Student resolved via `mentor_has_student`
- **ER Diagram** – Visual representation of the schema using MySQL Workbench
- **SQL DDL & DML** – `CREATE TABLE`, `INSERT INTO`, `SELECT` with `JOIN`, `GROUP BY`, `WHERE`

---

## 👤 Author

**Asgeek96**  
[GitHub Profile](https://github.com/asgeek96)
