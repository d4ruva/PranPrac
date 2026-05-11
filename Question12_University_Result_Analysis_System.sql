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

-- ii. Display class-wise average marks
SELECT C.ClassName, AVG(M.Marks) AS Average_Marks
FROM Class C
INNER JOIN Student S ON C.ClassId = S.ClassId
INNER JOIN Marks M ON S.Sid = M.Sid
GROUP BY C.ClassId, C.ClassName;

-- iii. Display student with class and marks using JOIN
SELECT S.Sname, C.ClassName, M.Subject, M.Marks
FROM Student S
INNER JOIN Class C ON S.ClassId = C.ClassId
INNER JOIN Marks M ON S.Sid = M.Sid;

-- iv. Display students scoring above class average using nested query
SELECT Sname
FROM Student S
WHERE (
    SELECT AVG(M.Marks)
    FROM Marks M
    WHERE M.Sid = S.Sid
) > (
    SELECT AVG(M2.Marks)
    FROM Student S2
    INNER JOIN Marks M2 ON S2.Sid = M2.Sid
    WHERE S2.ClassId = S.ClassId
);
