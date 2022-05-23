CREATE OR REPLACE TRIGGER TRG_UPT_CUST_MONTHLY
AFTER UPDATE OF FinalTotal ON Orders
FOR EACH ROW
DECLARE
   v_custNum CUSTOMERS.CUSTOMERNUMBER%TYPE;
BEGIN
   Select customerNumber into v_custNum
   From CUSTOMERS_MONTHLY
   Where customerNumber = :new.customerNumber AND 
         YearNo  = EXTRACT(Year From(:new.OrderDate)) AND 
         MonthNo = EXTRACT(Month From(:new.OrderDate));
   
   IF SQL%FOUND THEN
      UPDATE CUSTOMERS_MONTHLY
         SET Monthly_Amount = Monthly_Amount + :new.FinalTotal-:old.FinalTotal
      WHERE customerNumber = :new.customerNumber        AND
         YearNo  = EXTRACT(Year From(:new.OrderDate)) AND 
         MonthNo = EXTRACT(Month From(:new.OrderDate));
  END IF;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      INSERT INTO CUSTOMERS_MONTHLY VALUES
         (:new.customerNumber,EXTRACT(Year From(:new.OrderDate)),EXTRACT(Month From(:new.OrderDate)),:new.FinalTotal);
END;
/