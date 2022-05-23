CREATE OR REPLACE TRIGGER Track_Employees
BEFORE INSERT OR
       UPDATE OR
       DELETE
       ON employees
DECLARE
v_date date; 

BEGIN
   select TransDate into v_date
   from Employees_Audit
   where to_char(TransDate,'DD-MON-YY') = to_char(SYSDATE,'DD-MON-YY');
-- check if there is already a record for today ---
   
   if SQL%FOUND THEN
      CASE
         WHEN INSERTING THEN
            UPDATE Employees_AUDIT
               SET No_Of_Insert = No_Of_Insert + 1
            where to_char(TransDate,'DD-MON-YY') = to_char(SYSDATE,'DD-MON-YY');
         WHEN UPDATING THEN
            UPDATE Employees_AUDIT
               SET No_Of_Update = No_Of_Update + 1
            where to_char(TransDate,'DD-MON-YY') = to_char(SYSDATE,'DD-MON-YY');
         WHEN DELETING THEN
            UPDATE Employees_AUDIT
               SET No_Of_Delete = No_Of_Delete + 1
            where to_char(TransDate,'DD-MON-YY') = to_char(SYSDATE,'DD-MON-YY');
      END CASE;
   end if;

   exception
      when no_data_found then
      CASE
         WHEN INSERTING THEN
            INSERT INTO Employees_AUDIT VALUES(sysdate,1,0,0);
         WHEN UPDATING THEN
            INSERT INTO Employees_AUDIT VALUES(sysdate,0,1,0);
         WHEN DELETING THEN
            INSERT INTO Employees_AUDIT VALUES(sysdate,0,0,1);
      END CASE;
END;
/
