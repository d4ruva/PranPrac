-- Question 10: Insurance Claim System

CREATE TABLE Customer(
Cid INT PRIMARY KEY,
Cname VARCHAR(50)
);

CREATE TABLE Policy(
Pid INT PRIMARY KEY,
Cid INT,
Premium DECIMAL(10,2),
FOREIGN KEY(Cid) REFERENCES Customer(Cid)
);

CREATE TABLE Claim(
Clid INT PRIMARY KEY,
Pid INT,
Amount DECIMAL(10,2),
FOREIGN KEY(Pid) REFERENCES Policy(Pid)
);

SELECT * FROM Claim WHERE Amount>10000;

-- ii. Display total claim amount per customer
SELECT C.Cname, SUM(Cl.Amount) AS Total_Claim_Amount
FROM Customer C
INNER JOIN Policy P ON C.Cid = P.Cid
INNER JOIN Claim Cl ON P.Pid = Cl.Pid
GROUP BY C.Cid, C.Cname;

-- iii. Display customer with policy and claim using JOIN
SELECT C.Cname, P.Premium, Cl.Amount
FROM Customer C
INNER JOIN Policy P ON C.Cid = P.Cid
INNER JOIN Claim Cl ON P.Pid = Cl.Pid;

-- iv. Display customers whose claim amount is above average using nested query
SELECT Cname
FROM Customer
WHERE Cid IN (
    SELECT P.Cid
    FROM Policy P
    INNER JOIN Claim Cl ON P.Pid = Cl.Pid
    GROUP BY P.Cid
    HAVING SUM(Cl.Amount) > (
        SELECT AVG(Total_Claim)
        FROM (
            SELECT SUM(Cl2.Amount) AS Total_Claim
            FROM Policy P2
            INNER JOIN Claim Cl2 ON P2.Pid = Cl2.Pid
            GROUP BY P2.Cid
        )
    )
);
