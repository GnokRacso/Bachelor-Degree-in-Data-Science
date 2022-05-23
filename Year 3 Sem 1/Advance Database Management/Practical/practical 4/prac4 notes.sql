---Create more exception for more user friendly----
create or replace procedure prc_check_purchase(cust_no in number) is
   v_total_purchases NUMBER;
   v_name customers.customername%type;
   e_invalid_no    EXCEPTION;
BEGIN
   IF cust_no < 0 
   THEN
      RAISE e_invalid_no;
   END IF;

   SELECT customername into v_name
      FROM customers
   WHERE customernumber = cust_no;

   SELECT COUNT(*)
     INTO v_total_purchases 
     FROM orders
    WHERE customernumber = cust_no;
      
   DBMS_OUTPUT.PUT_LINE ('The customer has made '||v_total_purchases||'  purchases');
   DBMS_OUTPUT.PUT_LINE ('No exception has been raised');
EXCEPTION
   WHEN NO_DATA_FOUND then
      DBMS_OUTPUT.PUT_LINE('Customer number '|| cust_no || ' does not exist');
   WHEN e_invalid_no then
      DBMS_OUTPUT.PUT_LINE ('Customer number cannot be negative');
END;

--- Exception_INIT pragma----
create or replace procedure prc_update_creditLimit(cust_no in number, l_credit in number) is
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init( e_credit_too_high, -20061 );
    l_max_credit customers.creditlimit%TYPE;
  BEGIN
    -- get the max credit limit
    SELECT MAX(creditlimit)    INTO l_max_credit
    FROM customers;
     -- check if input credit is greater than the max credit
    ---#runtime error, not good enough
    IF l_credit > l_max_credit THEN 
        ---RAISE e_credit_too_high; #too weak, no error line---
        raise_application_error(-20061, 'Credit is too high'); 
    END IF;
    -- if not, update credit limit
    UPDATE customers 
    SET creditlimit = l_credit
    WHERE customernumber = cust_no;
    dbms_output.put_line('Credit limit of customer : ' || cust_no ||' is adjusted to ' || l_credit);
 EXCEPTION
   WHEN e_credit_too_high THEN
      DBMS_OUTPUT.PUT_LINE('An error was encountered ' ||chr(10)|| SQLERRM);
      DBMS_OUTPUT.PUT_LINE('Credit limit of Customer ' || cust_no || ' exceed the limit of '|| l_max_credit);
 END;
/

---Function and Local Procedure---
Create or replace function NumberOrders (v_custNo IN number)
   return number as v_count NUMBER;
begin
      select count(*)
   into v_count
   from orders
   where customernumber = v_custno;
      return v_count;
end;

declare cust_num orders.customernumber%type;
begin
   cust_num := 495;
   dbms_output.put_line ('Number of orders by customer '||cust_num|| ' is' || NumberOrders(cust_num));
end;
/

---Function 2.0----
Create or replace function FullName ( v_firstName varchar2, v_LastName varchar2)
RETURN Varchar2 as
  v_FullName varchar2(60);
BEGIN 
  v_FullName := (RTRIM(v_FirstName) ||'  '|| RTRIM(v_LastName));
  RETURN v_FullName; 
END; 
/

create or replace procedure prc_check_shipping(v_order_no number) is
    past_due EXCEPTION; 
    PRAGMA EXCEPTION_INIT (past_due, -20001); 
    due_date date;

     PROCEDURE shipping_status (  due_date DATE) IS
     BEGIN
        IF due_date  < (sysdate + 4) THEN 
           RAISE_APPLICATION_ERROR(-20001, 'Fast delivery needed.');
       END IF;
     END;

BEGIN
   select requireddate into due_date 
   from orders 
   where ordernumber = v_order_no;
   shipping_status (due_date);
EXCEPTION
  
WHEN past_due THEN 
     DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

exec prc_check_shipping(10422)
