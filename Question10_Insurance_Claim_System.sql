-- Create Database
CREATE DATABASE InsuranceDB;

-- Use Database
USE InsuranceDB;

-- Create Customer Table
CREATE TABLE Customer(
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- Create Policy Table
CREATE TABLE Policy(
    Pid INT PRIMARY KEY,
    Cid INT,
    Premium DECIMAL(10,2),
    FOREIGN KEY(Cid) REFERENCES Customer(Cid)
);

-- Create Claim Table
CREATE TABLE ClaimDetails(
    Clid INT PRIMARY KEY,
    Pid INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY(Pid) REFERENCES Policy(Pid)
);

-- Insert Data
INSERT INTO Customer VALUES
(1,'Amit'),
(2,'Neha');

INSERT INTO Policy VALUES
(101,1,5000),
(102,2,7000);

INSERT INTO ClaimDetails VALUES
(1001,101,15000),
(1002,102,8000);

-- i. Display claims above 10000
SELECT * FROM ClaimDetails
WHERE Amount > 10000;

-- ii. Display total claim amount per customer
SELECT Customer.Cname, SUM(ClaimDetails.Amount) AS Total_Claim
FROM Customer
JOIN Policy ON Customer.Cid = Policy.Cid
JOIN ClaimDetails ON Policy.Pid = ClaimDetails.Pid
GROUP BY Customer.Cname;

-- iii. Display customer with policy and claim using JOIN
SELECT Customer.Cname, Policy.Pid, ClaimDetails.Amount
FROM Customer
JOIN Policy ON Customer.Cid = Policy.Cid
JOIN ClaimDetails ON Policy.Pid = ClaimDetails.Pid;

-- iv. Display customers whose claim amount is above average using Nested Query
SELECT Cname
FROM Customer
WHERE Cid IN
(
    SELECT Cid
    FROM Policy
    WHERE Pid IN
    (
        SELECT Pid
        FROM ClaimDetails
        WHERE Amount >
        (
            SELECT AVG(Amount)
            FROM ClaimDetails
        )
    )
);