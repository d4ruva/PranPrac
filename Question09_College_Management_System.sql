-- Question 9: College Management System

CREATE TABLE Department(
DeptId INT PRIMARY KEY,
DeptName VARCHAR(50)
);

CREATE TABLE Student(
Sid INT PRIMARY KEY,
Sname VARCHAR(50),
DeptId INT,
FOREIGN KEY(DeptId) REFERENCES Department(DeptId)
);

CREATE TABLE Result(
Sid INT,
Marks INT,
FOREIGN KEY(Sid) REFERENCES Student(Sid)
);

SELECT * FROM Result WHERE Marks>60;
