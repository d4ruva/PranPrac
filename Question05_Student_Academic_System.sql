-- Create Database
CREATE DATABASE AcademicDB;

-- Use Database
USE AcademicDB;

-- Create Class Table
CREATE TABLE Class(
    ClassId INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL
);

-- Create Student Table
CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    ClassId INT,
    Marks INT,
    FOREIGN KEY(ClassId) REFERENCES Class(ClassId)
);

-- Insert Data
INSERT INTO Class VALUES
(101,'FYBCA'),
(102,'SYBCA');

INSERT INTO Student VALUES
(1,'Amit',101,75),
(2,'Neha',101,55),
(3,'Ravi',102,80);

-- i. Display students with marks > 60
SELECT * FROM Student
WHERE Marks > 60;

-- ii. Display class-wise average marks
SELECT ClassId, AVG(Marks) AS Average_Marks
FROM Student
GROUP BY ClassId;

-- iii. Display student with class name using JOIN
SELECT Student.Sname, Class.ClassName
FROM Student
JOIN Class ON Student.ClassId = Class.ClassId;

-- iv. Display students scoring above class average using Nested Query
SELECT Sname, Marks
FROM Student
WHERE Marks >
(
    SELECT AVG(Marks)
    FROM Student
);