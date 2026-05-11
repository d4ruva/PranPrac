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

-- ii. Count patients per doctor
SELECT Did, COUNT(Pid) AS Patient_Count
FROM Visit
GROUP BY Did;

-- iii. Display patient name with doctor name using JOIN
SELECT P.Pname, D.Dname
FROM Patient P
INNER JOIN Visit V ON P.Pid = V.Pid
INNER JOIN Doctor D ON V.Did = D.Did;

-- iv. Display patients treated by doctors having specialization "Cardiology" using nested query
SELECT Pname
FROM Patient
WHERE Pid IN (
    SELECT Pid
    FROM Visit
    WHERE Did IN (
        SELECT Did
        FROM Doctor
        WHERE Specialization = 'Cardiology'
    )
);
