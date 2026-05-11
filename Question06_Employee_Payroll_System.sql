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

-- i. Display employees from HR department
SELECT E.*
FROM Employee E
INNER JOIN Department D ON E.DeptId = D.DeptId
WHERE D.DeptName = 'HR';

-- ii. Display department-wise average salary
SELECT D.DeptName, AVG(E.Salary) AS Average_Salary
FROM Employee E
INNER JOIN Department D ON E.DeptId = D.DeptId
GROUP BY D.DeptId, D.DeptName;

-- iii. Display employee with department name using JOIN
SELECT E.Ename, D.DeptName
FROM Employee E
INNER JOIN Department D ON E.DeptId = D.DeptId;

-- iv. Display employees earning above average salary using nested query
SELECT Ename
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);
