-- Question 7: Food Delivery System

CREATE TABLE Restaurant(
Rid INT PRIMARY KEY,
Rname VARCHAR(50)
);

CREATE TABLE Orders(
Oid INT PRIMARY KEY,
Rid INT,
Amount DECIMAL(10,2),
FOREIGN KEY(Rid) REFERENCES Restaurant(Rid)
);

SELECT * FROM Orders;
