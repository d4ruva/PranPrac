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
