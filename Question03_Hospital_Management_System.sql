-- Create Database
CREATE DATABASE HospitalDB;

-- Use Database
USE HospitalDB;

-- Create Patient Table
CREATE TABLE Patient(
    Pid INT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    Age INT
);

-- Create Doctor Table
CREATE TABLE Doctor(
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Specialization VARCHAR(50)
);

-- Create Visit Table
CREATE TABLE Visit(
    Pid INT,
    Did INT,
    VisitDate DATE,
    PRIMARY KEY(Pid, Did),
    FOREIGN KEY(Pid) REFERENCES Patient(Pid),
    FOREIGN KEY(Did) REFERENCES Doctor(Did)
);

-- Insert Data
INSERT INTO Patient VALUES
(1,'Amit',55),
(2,'Neha',40),
(3,'Ravi',60);

INSERT INTO Doctor VALUES
(101,'Dr.Sharma','Cardiology'),
(102,'Dr.Patil','Orthopedic');

INSERT INTO Visit VALUES
(1,101,'2025-05-10'),
(2,102,'2025-05-11'),
(3,101,'2025-05-12');

-- i. Display patients above age 50
SELECT * FROM Patient
WHERE Age > 50;

-- ii. Count patients per doctor
SELECT Did, COUNT(Pid) AS Total_Patients
FROM Visit
GROUP BY Did;

-- iii. Display patient name with doctor name using JOIN
SELECT Patient.Pname, Doctor.Dname
FROM Patient
JOIN Visit ON Patient.Pid = Visit.Pid
JOIN Doctor ON Doctor.Did = Visit.Did;

-- iv. Display patients treated by Cardiology doctors using Nested Query
SELECT Pname
FROM Patient
WHERE Pid IN
(
    SELECT Pid
    FROM Visit
    WHERE Did IN
    (
        SELECT Did
        FROM Doctor
        WHERE Specialization='Cardiology'
    )
);