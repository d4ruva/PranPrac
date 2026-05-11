-- Question 4: Airline Reservation System

CREATE TABLE Flight(
Fid INT PRIMARY KEY,
Source VARCHAR(50),
Destination VARCHAR(50)
);

CREATE TABLE Passenger(
Pid INT PRIMARY KEY,
Pname VARCHAR(50)
);

CREATE TABLE Reservation(
Fid INT,
Pid INT,
FOREIGN KEY(Fid) REFERENCES Flight(Fid),
FOREIGN KEY(Pid) REFERENCES Passenger(Pid)
);

SELECT * FROM Flight WHERE Source='Pune';

-- ii. Count passengers per flight
SELECT Fid, COUNT(Pid) AS Passenger_Count
FROM Reservation
GROUP BY Fid;

-- iii. Display passenger with flight details using JOIN
SELECT P.Pname, F.Source, F.Destination
FROM Passenger P
INNER JOIN Reservation R ON P.Pid = R.Pid
INNER JOIN Flight F ON R.Fid = F.Fid;

-- iv. Display passengers booked on flights to Delhi using nested query
SELECT Pname
FROM Passenger
WHERE Pid IN (
    SELECT Pid
    FROM Reservation
    WHERE Fid IN (
        SELECT Fid
        FROM Flight
        WHERE Destination = 'Delhi'
    )
);
