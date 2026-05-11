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

-- To calculate and display fines
DECLARE
    v_fine NUMBER;
BEGIN
    FOR rec IN (SELECT Bid, Mid, IssueDate, ReturnDate FROM Issue) LOOP
        v_fine := Calculate_Fine(rec.IssueDate, rec.ReturnDate);
        DBMS_OUTPUT.PUT_LINE('Book ' || rec.Bid || ' by Member ' || rec.Mid || ' - Fine: ' || v_fine);
    END LOOP;
END;
/
