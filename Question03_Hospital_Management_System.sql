-- Question 3: Hospital Management System

CREATE TABLE Patient(
Pid INT PRIMARY KEY,
Pname VARCHAR(50),
Age INT
);

CREATE TABLE Doctor(
Did INT PRIMARY KEY,
Dname VARCHAR(50),
Specialization VARCHAR(50)
);

CREATE TABLE Visit(
Pid INT,
Did INT,
VisitDate DATE,
FOREIGN KEY(Pid) REFERENCES Patient(Pid),
FOREIGN KEY(Did) REFERENCES Doctor(Did)
);

SELECT * FROM Patient WHERE Age>50;
