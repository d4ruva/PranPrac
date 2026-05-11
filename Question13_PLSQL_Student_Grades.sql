-- Question 13: PL/SQL Student Grades

CREATE TABLE Student(
Sid INT,
Name VARCHAR(50),
Marks INT
);

CREATE OR REPLACE PROCEDURE Assign_Grade(
p_marks IN NUMBER,
p_grade OUT VARCHAR2
)
IS
BEGIN
IF p_marks>=75 THEN
p_grade:='A';
ELSIF p_marks>=60 THEN
p_grade:='B';
ELSE
p_grade:='C';
END IF;
END;
/

-- To execute and display grades
DECLARE
    v_grade VARCHAR2(1);
BEGIN
    FOR rec IN (SELECT Name, Marks FROM Student) LOOP
        Assign_Grade(rec.Marks, v_grade);
        DBMS_OUTPUT.PUT_LINE(rec.Name || ' - Grade: ' || v_grade);
    END LOOP;
END;
/
