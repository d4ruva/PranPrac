-- Question 15: Product Discount

CREATE DATABASE ProductDB;
USE ProductDB;

CREATE TABLE Product(
    Pid INT PRIMARY KEY,
    Pname VARCHAR(30),
    Price INT
);

INSERT INTO Product VALUES(1,'Laptop',50000);
INSERT INTO Product VALUES(2,'Mobile',20000);
INSERT INTO Product VALUES(3,'TV',30000);
INSERT INTO Product VALUES(4,'Mouse',1000);

DELIMITER //
CREATE PROCEDURE DiscountPrice()
BEGIN
    UPDATE Product
    SET Price = Price - (Price * 0.10);
END //
DELIMITER ;

CALL DiscountPrice();

SELECT * FROM Product;

SELECT * FROM Product
WHERE Price = (SELECT MAX(Price) FROM Product);
