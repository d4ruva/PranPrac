-- Create Database
CREATE DATABASE LibraryDB;

-- Use Database
USE LibraryDB;

-- Create Book Table
CREATE TABLE Book(
    Bid INT PRIMARY KEY,
    Title VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2),
    Dept VARCHAR(50)
);

-- Create Member Table
CREATE TABLE Member(
    Mid INT PRIMARY KEY,
    Mname VARCHAR(50) NOT NULL
);

-- Create Issue Table
CREATE TABLE IssueBook(
    Bid INT,
    Mid INT,
    IssueDate DATE,
    PRIMARY KEY(Bid, Mid),
    FOREIGN KEY(Bid) REFERENCES Book(Bid),
    FOREIGN KEY(Mid) REFERENCES Member(Mid)
);

-- Insert Data
INSERT INTO Book VALUES
(101,'DBMS',500,'Computer'),
(102,'Java',450,'Computer'),
(103,'Physics',300,'Science');

INSERT INTO Member VALUES
(1,'Amit'),
(2,'Neha');

INSERT INTO IssueBook VALUES
(101,1,'2025-05-10'),
(102,2,'2025-05-11');

-- i. Display books from Computer department
SELECT * FROM Book
WHERE Dept='Computer';

-- ii. Count number of books issued
SELECT COUNT(Bid) AS Total_Books_Issued
FROM IssueBook;

-- iii. Display book title with member name using JOIN
SELECT Book.Title, Member.Mname
FROM Book
JOIN IssueBook ON Book.Bid = IssueBook.Bid
JOIN Member ON Member.Mid = IssueBook.Mid;

-- iv. Display books issued by members using Nested Query
SELECT Title
FROM Book
WHERE Bid IN
(
    SELECT Bid
    FROM IssueBook
    WHERE Mid IN
    (
        SELECT Mid
        FROM Member
    )
);