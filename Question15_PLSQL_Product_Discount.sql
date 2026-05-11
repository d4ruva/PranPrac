-- Question 15: Product Discount

CREATE TABLE Product(
Pid INT,
Pname VARCHAR(50),
Price NUMBER
);

CREATE OR REPLACE PROCEDURE Calc_Discount
IS
BEGIN
UPDATE Product
SET Price=Price-(Price*0.10);
END;
/
