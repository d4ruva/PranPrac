-- Question 14: Employee Salary Classification

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(30),
    Salary INT,
    Class VARCHAR(20)
);

INSERT INTO Employee VALUES(1,'Amit',60000,NULL);
INSERT INTO Employee VALUES(2,'Neha',45000,NULL);
INSERT INTO Employee VALUES(3,'Rahul',30000,NULL);
INSERT INTO Employee VALUES(4,'Pooja',18000,NULL);

DELIMITER //
CREATE FUNCTION GetClass(sal INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE emp_class VARCHAR(20);
    IF sal >= 50000 THEN
        SET emp_class = 'Class I';
    ELSEIF sal >= 40000 THEN
        SET emp_class = 'Class II';
    ELSEIF sal >= 25000 THEN
        SET emp_class = 'Class III';
    ELSE
        SET emp_class = 'Class IV';
    END IF;
    RETURN emp_class;
END //
DELIMITER ;

UPDATE Employee
SET Class = GetClass(Salary);

SELECT * FROM Employee;

SELECT Class, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Class;
