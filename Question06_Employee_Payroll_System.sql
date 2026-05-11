-- Question 6: Employee Payroll System

CREATE TABLE Department(
DeptId INT PRIMARY KEY,
DeptName VARCHAR(50)
);

CREATE TABLE Employee(
Eid INT PRIMARY KEY,
Ename VARCHAR(50),
DeptId INT,
Salary DECIMAL(10,2),
FOREIGN KEY(DeptId) REFERENCES Department(DeptId)
);

SELECT * FROM Employee;
