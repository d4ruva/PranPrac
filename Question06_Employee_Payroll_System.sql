-- Create Database
CREATE DATABASE PayrollDB;

-- Use Database
USE PayrollDB;

-- Create Department Table
CREATE TABLE Department(
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE NOT NULL
);

-- Create Employee Table
CREATE TABLE Employee(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    DeptId INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY(DeptId) REFERENCES Department(DeptId)
);

-- Insert Data
INSERT INTO Department VALUES
(101,'HR'),
(102,'IT');

INSERT INTO Employee VALUES
(1,'Amit',101,50000),
(2,'Neha',102,60000),
(3,'Ravi',101,55000);

-- i. Display employees from HR department
SELECT Employee.*
FROM Employee
JOIN Department ON Employee.DeptId = Department.DeptId
WHERE Department.DeptName='HR';

-- ii. Display department-wise average salary
SELECT DeptId, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY DeptId;

-- iii. Display employee with department name using JOIN
SELECT Employee.Ename, Department.DeptName
FROM Employee
JOIN Department ON Employee.DeptId = Department.DeptId;

-- iv. Display employees earning above average salary using Nested Query
SELECT Ename, Salary
FROM Employee
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employee
);