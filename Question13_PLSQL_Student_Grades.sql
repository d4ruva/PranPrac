-- Question 13: PL/SQL Student Grades

CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Name VARCHAR(30),
    Marks INT,
    Grade CHAR(1)
);

INSERT INTO Student VALUES(1,'Amit',85,NULL);
INSERT INTO Student VALUES(2,'Neha',72,NULL);
INSERT INTO Student VALUES(3,'Rahul',60,NULL);
INSERT INTO Student VALUES(4,'Pooja',45,NULL);

DELIMITER //
CREATE PROCEDURE AssignGrade()
BEGIN
    UPDATE Student
    SET Grade =
    CASE
        WHEN Marks >= 75 THEN 'A'
        WHEN Marks >= 60 THEN 'B'
        WHEN Marks >= 50 THEN 'C'
        ELSE 'D'
    END;
END //
DELIMITER ;

CALL AssignGrade();

DELIMITER //
CREATE PROCEDURE DisplayGrades()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sname VARCHAR(30);
    DECLARE g CHAR(1);
    DECLARE cur CURSOR FOR
        SELECT Name, Grade FROM Student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO sname, g;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT sname AS Name, g AS Grade;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL DisplayGrades();

SELECT Grade, COUNT(*) AS Total_Students
FROM Student
GROUP BY Grade;
