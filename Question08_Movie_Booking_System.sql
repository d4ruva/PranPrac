-- Question 8: Movie Booking System

CREATE TABLE Movie(
Mid INT PRIMARY KEY,
Mname VARCHAR(50),
ReleaseYear INT
);

CREATE TABLE Booking(
Bid INT PRIMARY KEY,
Mid INT,
Amount DECIMAL(10,2),
FOREIGN KEY(Mid) REFERENCES Movie(Mid)
);

SELECT * FROM Movie WHERE ReleaseYear>2020;

-- ii. Count bookings per movie
SELECT M.Mname, COUNT(B.Bid) AS Booking_Count
FROM Movie M
LEFT JOIN Booking B ON M.Mid = B.Mid
GROUP BY M.Mid, M.Mname;

-- iii. Display movie with booking details using JOIN
SELECT M.Mname, B.Amount
FROM Movie M
INNER JOIN Booking B ON M.Mid = B.Mid;

-- iv. Display movies having bookings above average using nested query
SELECT Mname
FROM Movie
WHERE Mid IN (
    SELECT Mid
    FROM Booking
    GROUP BY Mid
    HAVING COUNT(Bid) > (
        SELECT AVG(Booking_Count)
        FROM (
            SELECT COUNT(Bid) AS Booking_Count
            FROM Booking
            GROUP BY Mid
        )
    )
);
