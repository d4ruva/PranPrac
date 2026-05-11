-- Question 12: University Result Analysis System

CREATE TABLE Class(
ClassId INT PRIMARY KEY,
ClassName VARCHAR(50)
);

CREATE TABLE Student(
Sid INT PRIMARY KEY,
Sname VARCHAR(50),
ClassId INT,
FOREIGN KEY(ClassId) REFERENCES Class(ClassId)
);

CREATE TABLE Marks(
Sid INT,
Subject VARCHAR(50),
Marks INT,
FOREIGN KEY(Sid) REFERENCES Student(Sid)
);

SELECT * FROM Marks WHERE Marks>75;
