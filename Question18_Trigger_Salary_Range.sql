-- Question 18: Salary Range Trigger

CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;

CREATE TABLE IF NOT EXISTS Employee(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee (Eid, Ename, Salary) VALUES
(1, 'Amit', 50000.00),
(2, 'Neha', 45000.00),
(3, 'Rahul', 30000.00);

DELIMITER //
CREATE TRIGGER trg_salary
BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 20000 OR NEW.Salary > 80000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary out of range';
    END IF;
END;//
DELIMITER ;

-- Update and verify
UPDATE Employee SET Salary = 52000.00 WHERE Eid = 1;
-- The following update should fail due to the trigger:
-- UPDATE Employee SET Salary = 18000.00 WHERE Eid = 2;

-- Display average salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;
