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
