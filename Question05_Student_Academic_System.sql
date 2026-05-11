-- Question 5: Student Academic System

CREATE TABLE Class(
ClassId INT PRIMARY KEY,
ClassName VARCHAR(50)
);

CREATE TABLE Student(
Sid INT PRIMARY KEY,
Sname VARCHAR(50),
ClassId INT,
Marks INT,
FOREIGN KEY(ClassId) REFERENCES Class(ClassId)
);

SELECT * FROM Student WHERE Marks>60;
