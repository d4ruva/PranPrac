-- Create Database
CREATE DATABASE MovieDB;

-- Use Database
USE MovieDB;

-- Create Movie Table
CREATE TABLE Movie(
    Mid INT PRIMARY KEY,
    Mname VARCHAR(50) NOT NULL,
    ReleaseYear INT
);

-- Create Booking Table
CREATE TABLE Booking(
    Bid INT PRIMARY KEY,
    Mid INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY(Mid) REFERENCES Movie(Mid)
);

-- Insert Data
INSERT INTO Movie VALUES
(101,'Pushpa',2021),
(102,'KGF',2019),
(103,'Jawan',2023);

INSERT INTO Booking VALUES
(1,101,1200),
(2,101,1500),
(3,103,2000);

-- i. Display movies released after 2020
SELECT * FROM Movie
WHERE ReleaseYear > 2020;

-- ii. Count bookings per movie
SELECT Mid, COUNT(Bid) AS Total_Bookings
FROM Booking
GROUP BY Mid;

-- iii. Display movie with booking details using JOIN
SELECT Movie.Mname, Booking.Amount
FROM Movie
JOIN Booking ON Movie.Mid = Booking.Mid;

-- iv. Display movies having bookings above average using Nested Query
SELECT Mname
FROM Movie
WHERE Mid IN
(
    SELECT Mid
    FROM Booking
    GROUP BY Mid
    HAVING SUM(Amount) >
    (
        SELECT AVG(Amount)
        FROM Booking
    )
);