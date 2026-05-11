-- Question 16: Fine Calculation

CREATE TABLE Issue(
Bid INT,
Mid INT,
IssueDate DATE,
ReturnDate DATE
);

CREATE OR REPLACE FUNCTION Calculate_Fine(
issue_date DATE,
return_date DATE
)
RETURN NUMBER
IS
days NUMBER;
BEGIN
days := return_date - issue_date;
IF days>7 THEN
RETURN (days-7)*5;
ELSE
RETURN 0;
END IF;
END;
/
