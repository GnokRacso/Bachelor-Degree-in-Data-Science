/*
CREATE TABLE employees(
  employeeNumber	number(11)   NOT NULL,
  lastName		varchar(50)  NOT NULL,
  firstName		varchar(50)  NOT NULL,
  extension		varchar(10)  NOT NULL,
  email			varchar(100) NOT NULL,
  officeCode		varchar(10)  NOT NULL,
  jobTitle		varchar(50)  NOT NULL,
  PRIMARY KEY (employeeNumber)
);
*/
CREATE OR REPLACE PROCEDURE prc_emp_list AS

    CURSOR emp_cursor IS
      SELECT employeeNumber, lastName, firstName, email, officeCode
	FROM Employees
        order by employeeNumber;

--emp_rec emp_cursor%ROWTYPE;
--%ROWTYPE takes a structure of a row
BEGIN
-- emp_cursor is opened here
   FOR emp_rec IN emp_cursor LOOP
      DBMS_OUTPUT.PUT_LINE(emp_cursor%rowcount ||'.'||emp_rec.employeeNumber||' '||
                           emp_rec.lastName||',' ||emp_rec.firstName ||
                            ' '||emp_rec.email||' '||emp_rec.officeCode);
   END LOOP;
-- emp_cursor is closed here
END;
/
