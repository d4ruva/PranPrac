-- Create Database
CREATE DATABASE UniversityDB;

-- Use Database
USE UniversityDB;

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
    FOREIGN KEY(ClassId) REFERENCES Class(ClassId)
);

-- Create Marks Table
CREATE TABLE Marks(
    Sid INT,
    Subject VARCHAR(50),
    Marks INT,
    PRIMARY KEY(Sid, Subject),
    FOREIGN KEY(Sid) REFERENCES Student(Sid)
);

-- Insert Data
INSERT INTO Class VALUES
(101,'FYBCA'),
(102,'SYBCA');

INSERT INTO Student VALUES
(1,'Amit',101),
(2,'Neha',102),
(3,'Ravi',101);

INSERT INTO Marks VALUES
(1,'DBMS',80),
(2,'Java',65),
(3,'Python',90);

-- i. Display students scoring above 75
SELECT Student.Sname, Marks.Marks
FROM Student
JOIN Marks ON Student.Sid = Marks.Sid
WHERE Marks.Marks > 75;

-- ii. Display class-wise average marks
SELECT Student.ClassId, AVG(Marks.Marks) AS Average_Marks
FROM Student
JOIN Marks ON Student.Sid = Marks.Sid
GROUP BY Student.ClassId;

-- iii. Display student with class and marks using JOIN
SELECT Student.Sname, Class.ClassName, Marks.Subject, Marks.Marks
FROM Student
JOIN Class ON Student.ClassId = Class.ClassId
JOIN Marks ON Student.Sid = Marks.Sid;

-- iv. Display students scoring above class average using Nested Query
SELECT Sname
FROM Student
WHERE Sid IN
(
    SELECT Sid
    FROM Marks
    WHERE Marks >
    (
        SELECT AVG(Marks)
        FROM Marks
    )
);