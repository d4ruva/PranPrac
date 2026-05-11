-- Question 24: Library Management System Views

CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Book(
    Bid INT PRIMARY KEY,
    Title VARCHAR(50),
    Price INT
);

CREATE TABLE Issue(
    Bid INT,
    Mid INT,
    FOREIGN KEY (Bid) REFERENCES Book(Bid)
);

INSERT INTO Book VALUES(1,'DBMS',500);
INSERT INTO Book VALUES(2,'Python',650);
INSERT INTO Book VALUES(3,'Java',700);

INSERT INTO Issue VALUES(1,101);
INSERT INTO Issue VALUES(1,102);
INSERT INTO Issue VALUES(2,103);
INSERT INTO Issue VALUES(1,104);
INSERT INTO Issue VALUES(3,105);

-- i. Create simple view
CREATE VIEW BookView AS
SELECT * FROM Book;

-- ii. Display data using view
SELECT * FROM BookView;

-- iii. Create join view
CREATE VIEW BookIssueView AS
SELECT Book.Title, Issue.Mid
FROM Book
JOIN Issue
ON Book.Bid = Issue.Bid;

-- iv. Display combined data
SELECT * FROM BookIssueView;

-- v. Create aggregate view
CREATE VIEW BookIssueCountView AS
SELECT Bid, COUNT(*) AS TotalIssues
FROM Issue
GROUP BY Bid;

-- vi. Find most issued book
SELECT *
FROM BookIssueCountView
WHERE TotalIssues =
(SELECT MAX(TotalIssues) FROM BookIssueCountView);