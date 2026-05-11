-- Create Database
CREATE DATABASE CollegeDB;

-- Use Database
USE CollegeDB;

-- Create Department Table
CREATE TABLE Department(
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE NOT NULL
);

-- Create Student Table
CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    DeptId INT,
    FOREIGN KEY(DeptId) REFERENCES Department(DeptId)
);

-- Create Result Table
CREATE TABLE Result(
    Sid INT PRIMARY KEY,
    Marks INT,
    FOREIGN KEY(Sid) REFERENCES Student(Sid)
);

-- Insert Data
INSERT INTO Department VALUES
(101,'Computer'),
(102,'Mechanical');

INSERT INTO Student VALUES
(1,'Amit',101),
(2,'Neha',102),
(3,'Ravi',101);

INSERT INTO Result VALUES
(1,75),
(2,55),
(3,85);

-- i. Display students with marks above 60
SELECT Student.Sname, Result.Marks
FROM Student
JOIN Result ON Student.Sid = Result.Sid
WHERE Result.Marks > 60;

-- ii. Display department-wise average marks
SELECT Student.DeptId, AVG(Result.Marks) AS Average_Marks
FROM Student
JOIN Result ON Student.Sid = Result.Sid
GROUP BY Student.DeptId;

-- iii. Display student with department and marks using JOIN
SELECT Student.Sname, Department.DeptName, Result.Marks
FROM Student
JOIN Department ON Student.DeptId = Department.DeptId
JOIN Result ON Student.Sid = Result.Sid;

-- iv. Display students scoring above department average using Nested Query
SELECT Sname
FROM Student
WHERE Sid IN
(
    SELECT Sid
    FROM Result
    WHERE Marks >
    (
        SELECT AVG(Marks)
        FROM Result
    )
);

-- v. Cursor to display student names and marks
DELIMITER //

CREATE PROCEDURE StudentCursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sname VARCHAR(50);
    DECLARE smarks INT;

    DECLARE cur CURSOR FOR
    SELECT Student.Sname, Result.Marks
    FROM Student
    JOIN Result ON Student.Sid = Result.Sid;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sname, smarks;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT sname, smarks;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

-- Call Procedure
CALL StudentCursor();