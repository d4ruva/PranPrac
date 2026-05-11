-- Question 2: Library Management System

CREATE TABLE Book(
Bid INT PRIMARY KEY,
Title VARCHAR(50),
Price DECIMAL(10,2),
Dept VARCHAR(50)
);

CREATE TABLE Member(
Mid INT PRIMARY KEY,
Mname VARCHAR(50)
);

CREATE TABLE Issue(
Bid INT,
Mid INT,
IssueDate DATE,
FOREIGN KEY(Bid) REFERENCES Book(Bid),
FOREIGN KEY(Mid) REFERENCES Member(Mid)
);

SELECT * FROM Book WHERE Dept='Computer';

SELECT COUNT(*) AS Total_Books_Issued FROM Issue;
