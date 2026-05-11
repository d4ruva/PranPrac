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
