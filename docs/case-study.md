# Case Study: Student-Mentor Relational Database System

**Tool:** MySQL 8.0 · MySQL Workbench  
**Scale:** 100 students · 12 mentors · 12 departments · 100 assignments  
**Analyst:** Anubhav Srivastava  

---

## The Business Problem

Academic institutions typically manage mentor-student assignments through spreadsheets or informal records. This creates predictable problems:

- No way to query which mentor is assigned to which student across which course
- No enforcement of data integrity — a student can be assigned to a mentor from a different department with no warning
- No structured way to track yearly performance remarks across multiple mentorship years
- Duplicate data everywhere — department names repeated in every student record rather than referenced from a single source

This project solves those problems by designing a normalised relational database from scratch — starting from entity identification, through ER diagram design, to a fully implemented MySQL schema with referential integrity enforced at the database level.

---

## Approach

### Entity Identification

The first step was identifying the real-world entities that needed to be tracked and their relationships:

| Entity | What it represents |
|---|---|
| `department` | Academic departments and the courses they offer |
| `student` | Students enrolled in a course |
| `mentor` | Academic mentors affiliated with a department |
| `mentor_has_student` | The assignment relationship between mentors and students |

This decomposition — separating entities that novice designers often collapse into one table — is the foundation of a clean schema.

### Normalisation to 3NF

The schema was designed to **Third Normal Form (3NF)**:

- **1NF** — All attributes are atomic; no repeating groups. Department name and course are stored once in the `department` table, not repeated in every student record.
- **2NF** — No partial dependencies. `mentor_has_student` uses a composite primary key (`Mentor_MID`, `Student_SID`) and all non-key attributes (`Remarks`, `Year`, `Description`) depend on the full key, not just one part of it.
- **3NF** — No transitive dependencies. Student records reference `Department_Course_id` as a foreign key rather than storing department name and course name directly — eliminating the update anomalies that would occur if a course was renamed.

### Handling the M:N Relationship

The core design challenge was the mentor-student relationship: a mentor can supervise many students, and a student can have multiple mentors across different years. This is a **many-to-many (M:N)** relationship — which cannot be implemented directly in a relational database without a junction table.

The `mentor_has_student` table resolves this:

```sql
CREATE TABLE mentor_has_student (
    Mentor_MID  INT NOT NULL,
    Student_SID INT NOT NULL,
    Remarks     VARCHAR(10) NOT NULL,
    Year        INT(4) NOT NULL,
    Description VARCHAR(100),
    PRIMARY KEY (Mentor_MID, Student_SID),
    FOREIGN KEY (Mentor_MID)  REFERENCES mentor(MID),
    FOREIGN KEY (Student_SID) REFERENCES student(SID)
);
```

The composite primary key `(Mentor_MID, Student_SID)` ensures that the same mentor-student pair cannot be duplicated. The foreign keys mean the database itself — not application logic — enforces that only valid mentors and students can be assigned.

### Referential Integrity

Foreign key constraints are enforced across all four tables:

- `student.Department_Course_id` → `department.Course_id`
- `mentor.Department_Course_id` → `department.Course_id`
- `mentor_has_student.Mentor_MID` → `mentor.MID`
- `mentor_has_student.Student_SID` → `student.SID`

This means it is **impossible** at the database level to:
- Assign a student to a non-existent department
- Create an assignment for a mentor or student that doesn't exist
- Delete a mentor who still has active student assignments (without first removing the assignments)

This is the difference between data integrity enforced by convention and data integrity enforced by constraint.

---

## Sample Queries & What They Demonstrate

### Full assignment report with JOINs across all 4 tables

```sql
SELECT
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor,
    CONCAT(s.SFname, ' ', s.SLname) AS Student,
    d.Dname AS Department,
    ms.Remarks, ms.Year, ms.Description
FROM mentor_has_student ms
JOIN mentor m     ON ms.Mentor_MID  = m.MID
JOIN student s    ON ms.Student_SID = s.SID
JOIN department d ON s.Department_Course_id = d.Course_id
ORDER BY ms.Year;
```

This query joins all four tables in a single statement — the kind of query that breaks immediately on a poorly designed schema, and runs cleanly on a properly normalised one.

### Mentor workload distribution

```sql
SELECT
    CONCAT(m.MFname, ' ', m.MLname) AS Mentor_Name,
    COUNT(ms.Student_SID) AS Total_Students
FROM mentor m
LEFT JOIN mentor_has_student ms ON m.MID = ms.Mentor_MID
GROUP BY m.MID
ORDER BY Total_Students DESC;
```

`LEFT JOIN` rather than `INNER JOIN` — ensures mentors with zero assignments still appear in the results, rather than being silently excluded.

### Top-performing students filtered by grade

```sql
SELECT
    CONCAT(s.SFname, ' ', s.SLname) AS Student_Name,
    d.Course, ms.Remarks, ms.Year
FROM student s
JOIN mentor_has_student ms ON s.SID = ms.Student_SID
JOIN department d ON s.Department_Course_id = d.Course_id
WHERE ms.Remarks = 'A++';
```

---

## Key Design Decisions

| Decision | Rationale |
|---|---|
| `Course_id` as primary key in `department` | Departments can offer multiple courses — `Course_id` is the most granular unique identifier for the department-course combination |
| Composite PK in `mentor_has_student` | Prevents duplicate mentor-student assignments at the database level without needing application-side validation |
| `LEFT JOIN` for mentor workload query | Includes mentors with zero assignments — an `INNER JOIN` would silently hide them, giving a misleading picture of workload distribution |
| `FOREIGN KEY` constraints on all relationships | Integrity enforced at the database level, not the application level — more robust and environment-independent |
| Normalisation to 3NF | Eliminates update anomalies — renaming a department or course requires changing one row in one table, not hundreds of student records |

---

## Skills Demonstrated

- **Relational schema design** — entity identification, attribute definition, relationship modelling from a real-world problem
- **Normalisation** — 1NF → 2NF → 3NF with explicit reasoning at each stage
- **ER diagram design** — visual schema representation using MySQL Workbench
- **DDL** — `CREATE DATABASE`, `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` constraints
- **DML** — `INSERT INTO` for 100+ records across 4 tables
- **Multi-table JOINs** — `INNER JOIN`, `LEFT JOIN` across 4 tables in a single query
- **Aggregation** — `COUNT`, `GROUP BY`, `ORDER BY` for workload and performance analysis
- **Referential integrity** — understanding what constraints enforce and what they prevent

---

## Repository Contents

| File | Description |
|---|---|
| `ERDiagram.png` | Entity-Relationship diagram (MySQL Workbench) |
| `sql/schema.sql` | Full DDL — database and table creation with constraints |
| `sql/insert_data.sql` | All INSERT statements — 100 students, 12 mentors, 12 departments |
| `sql/queries.sql` | 5 sample queries demonstrating JOIN, GROUP BY, WHERE filtering |
| `data/` | CSV exports for all 4 tables |
| `docs/Initial_entities.docx` | Full design document with schema rationale |
| `case-study.md` | This file |

---

*Built by Anubhav Srivastava · [GitHub](https://github.com/asgeek96) · [LinkedIn](https://linkedin.com/in/asgeek)*
