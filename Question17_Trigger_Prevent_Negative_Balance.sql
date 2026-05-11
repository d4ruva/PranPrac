-- Question 17: Prevent Negative Balance

CREATE TABLE Account(
Aid INT,
Balance NUMBER
);

CREATE OR REPLACE TRIGGER trg_balance
BEFORE UPDATE ON Account
FOR EACH ROW
BEGIN
IF :NEW.Balance < 0 THEN
RAISE_APPLICATION_ERROR(-20001,'Negative balance not allowed');
END IF;
END;
/
