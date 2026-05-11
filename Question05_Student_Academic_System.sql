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

-- ii. Display class-wise average marks
SELECT ClassId, AVG(Marks) AS Average_Marks
FROM Student
GROUP BY ClassId;

-- iii. Display student with class name using JOIN
SELECT S.Sname, C.ClassName
FROM Student S
INNER JOIN Class C ON S.ClassId = C.ClassId;

-- iv. Display students scoring above class average using nested query
SELECT Sname
FROM Student S
WHERE Marks > (
    SELECT AVG(Marks)
    FROM Student
    WHERE ClassId = S.ClassId
);
