-- Question 21: Employee Management System Views

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Department(
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employee(
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    DeptId INT,
    Salary INT,
    FOREIGN KEY (DeptId) REFERENCES Department(DeptId)
);

INSERT INTO Department VALUES(1,'HR');
INSERT INTO Department VALUES(2,'IT');
INSERT INTO Department VALUES(3,'Finance');

INSERT INTO Employee VALUES(101,'Pranav',1,40000);
INSERT INTO Employee VALUES(102,'Rahul',2,55000);
INSERT INTO Employee VALUES(103,'Amit',3,50000);
INSERT INTO Employee VALUES(104,'Sneha',2,65000);

-- i. Create simple view
CREATE VIEW EmployeeView AS
SELECT Eid, Ename, Salary
FROM Employee;

-- ii. Display data using view
SELECT * FROM EmployeeView;

-- iii. Create join view
CREATE VIEW EmployeeDeptView AS
SELECT Employee.Ename, Department.DeptName
FROM Employee
JOIN Department
ON Employee.DeptId = Department.DeptId;

-- iv. Display combined data
SELECT * FROM EmployeeDeptView;

-- v. Create aggregate view
CREATE VIEW AvgSalaryView AS
SELECT DeptId, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY DeptId;

-- vi. Display department having maximum average salary
SELECT *
FROM AvgSalaryView
WHERE AvgSalary = (SELECT MAX(AvgSalary) FROM AvgSalaryView);