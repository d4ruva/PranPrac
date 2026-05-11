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

-- iii. Display book title with member name using JOIN
SELECT B.Title, M.Mname
FROM Book B
INNER JOIN Issue I ON B.Bid = I.Bid
INNER JOIN Member M ON I.Mid = M.Mid;

-- iv. Display books issued by members using nested query
SELECT Title
FROM Book
WHERE EXISTS (
    SELECT 1
    FROM Issue
    WHERE Issue.Bid = Book.Bid
);
