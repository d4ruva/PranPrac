-- Question 20: Validate Marks

CREATE DATABASE IF NOT EXISTS StudentMarksDB;
USE StudentMarksDB;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student(
    Sid INT PRIMARY KEY,
    Marks INT
);

INSERT INTO Student (Sid, Marks) VALUES
(1, 85),
(2, 92),
(3, 74);

DELIMITER //
DROP TRIGGER IF EXISTS trg_marks_insert;//
DROP TRIGGER IF EXISTS trg_marks_update;//

CREATE TRIGGER trg_marks_insert
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.Marks < 0 OR NEW.Marks > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Marks';
    END IF;
END;//

CREATE TRIGGER trg_marks_update
BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
    IF NEW.Marks < 0 OR NEW.Marks > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Marks';
    END IF;
END;//
DELIMITER ;

-- Update and verify
UPDATE Student SET Marks = 88 WHERE Sid = 1;
-- The following update should fail due to the trigger:
-- UPDATE Student SET Marks = 110 WHERE Sid = 2;

-- Display maximum marks
SELECT MAX(Marks) AS Maximum_Marks FROM Student;
