-- Create Database
CREATE DATABASE AirlineDB;

-- Use Database
USE AirlineDB;

-- Create Flight Table
CREATE TABLE Flight(
    Fid INT PRIMARY KEY,
    Source VARCHAR(50),
    Destination VARCHAR(50)
);

-- Create Passenger Table
CREATE TABLE Passenger(
    Pid INT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL
);

-- Create Reservation Table
CREATE TABLE Reservation(
    Fid INT,
    Pid INT,
    PRIMARY KEY(Fid, Pid),
    FOREIGN KEY(Fid) REFERENCES Flight(Fid),
    FOREIGN KEY(Pid) REFERENCES Passenger(Pid)
);

-- Insert Data
INSERT INTO Flight VALUES
(101,'Pune','Delhi'),
(102,'Mumbai','Chennai'),
(103,'Pune','Bangalore');

INSERT INTO Passenger VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Ravi');

INSERT INTO Reservation VALUES
(101,1),
(101,2),
(102,3);

-- i. Display flights from Pune
SELECT * FROM Flight
WHERE Source='Pune';

-- ii. Count passengers per flight
SELECT Fid, COUNT(Pid) AS Total_Passengers
FROM Reservation
GROUP BY Fid;

-- iii. Display passenger with flight details using JOIN
SELECT Passenger.Pname, Flight.Source, Flight.Destination
FROM Passenger
JOIN Reservation ON Passenger.Pid = Reservation.Pid
JOIN Flight ON Flight.Fid = Reservation.Fid;

-- iv. Display passengers booked on flights to Delhi using Nested Query
SELECT Pname
FROM Passenger
WHERE Pid IN
(
    SELECT Pid
    FROM Reservation
    WHERE Fid IN
    (
        SELECT Fid
        FROM Flight
        WHERE Destination='Delhi'
    )
);