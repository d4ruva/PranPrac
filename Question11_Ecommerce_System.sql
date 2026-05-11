-- Question 11: E-Commerce System

CREATE TABLE Customer(
Cid INT PRIMARY KEY,
Cname VARCHAR(50)
);

CREATE TABLE Orders(
Oid INT PRIMARY KEY,
Cid INT,
FOREIGN KEY(Cid) REFERENCES Customer(Cid)
);

CREATE TABLE OrderItem(
Oid INT,
Pid INT,
Qty INT,
FOREIGN KEY(Oid) REFERENCES Orders(Oid)
);

SELECT * FROM Orders;
