-- Question 22: Student Academic System Views

CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Class(
    ClassId INT PRIMARY KEY,
    ClassName VARCHAR(50)
);

CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50),
    ClassId INT,
    Marks INT,
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId)
);

INSERT INTO Class VALUES(1,'FYBCA');
INSERT INTO Class VALUES(2,'SYBCA');
INSERT INTO Class VALUES(3,'TYBCA');

INSERT INTO Student VALUES(101,'Pranav',1,85);
INSERT INTO Student VALUES(102,'Rahul',2,78);
INSERT INTO Student VALUES(103,'Sneha',3,92);
INSERT INTO Student VALUES(104,'Amit',2,88);

-- i. Create simple view
CREATE VIEW StudentView AS
SELECT Sname, Marks
FROM Student;

-- ii. Display data using view
SELECT * FROM StudentView;

-- iii. Create join view
CREATE VIEW StudentClassView AS
SELECT Student.Sname, Class.ClassName
FROM Student
JOIN Class
ON Student.ClassId = Class.ClassId;

-- iv. Display combined data
SELECT * FROM StudentClassView;

-- v. Create aggregate view
CREATE VIEW AvgMarksView AS
SELECT ClassId, AVG(Marks) AS AvgMarks
FROM Student
GROUP BY ClassId;

-- vi. Count number of students in each class
SELECT ClassId, COUNT(*) AS TotalStudents
FROM Student
GROUP BY ClassId;