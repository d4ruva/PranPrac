-- Create Database
CREATE DATABASE StudentCourseDB;

-- Use Database
USE StudentCourseDB;

-- Create Student Table
CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    City VARCHAR(50)
);

-- Create Course Table
CREATE TABLE Course(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) UNIQUE NOT NULL
);

-- Create Enrollment Table
CREATE TABLE Enrollment(
    Sid INT,
    Cid INT,
    Year INT,
    PRIMARY KEY(Sid, Cid),
    FOREIGN KEY(Sid) REFERENCES Student(Sid),
    FOREIGN KEY(Cid) REFERENCES Course(Cid)
);

-- Insert Data
INSERT INTO Student VALUES
(1,'Amit','Pune'),
(2,'Neha','Mumbai'),
(3,'Ravi','Pune');

INSERT INTO Course VALUES
(101,'DBMS'),
(102,'Java');

INSERT INTO Enrollment VALUES
(1,101,2025),
(2,102,2025),
(3,101,2025);

-- i. Display students from Pune
SELECT * FROM Student
WHERE City='Pune';

-- ii. Display course-wise student count
SELECT Cid, COUNT(Sid) AS Total_Students
FROM Enrollment
GROUP BY Cid;

-- iii. Display student name with course name using JOIN
SELECT Student.Sname, Course.Cname
FROM Student
JOIN Enrollment ON Student.Sid = Enrollment.Sid
JOIN Course ON Course.Cid = Enrollment.Cid;

-- iv. Display students enrolled in DBMS using Nested Query
SELECT Sname
FROM Student
WHERE Sid IN
(
    SELECT Sid
    FROM Enrollment
    WHERE Cid IN
    (
        SELECT Cid
        FROM Course
        WHERE Cname='DBMS'
    )
);