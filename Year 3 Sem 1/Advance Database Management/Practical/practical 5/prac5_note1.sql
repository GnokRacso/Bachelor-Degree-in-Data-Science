CREATE OR REPLACE TRIGGER trg_customers_credit
    BEFORE UPDATE OF creditLimit  
    ON customers
   for each row
DECLARE
    l_day_of_month NUMBER;
BEGIN
    l_day_of_month := EXTRACT(DAY FROM sysdate);
    IF l_day_of_month BETWEEN 28 AND 30 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 30th');
    END IF;
    dbms_output.put_line('Customer '||:old.customernumber||' initial credit limit of RM '||:old.creditlimit|| ' is adjusted to '||:new.creditlimit);
END;
/

create or replace trigger trg_update_unitSold
    after insert on orderdetails
    for each row
begin
    update products
        set total_units_sold = total_units_sold +: new.quantityordered
        where productcode = :new.productcode;
end;
/
select ordernumber, productcode from orderdetails
order by 1;

insert into orderdetails values (10425, 'S12_1666', 800, 78, 14);

CREATE OR REPLACE TRIGGER trg_customers_credit1
    BEFORE UPDATE OF creditLimit  
    ON customers
  -- for each row
DECLARE
    l_day_of_month NUMBER;
BEGIN
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 28 AND 30 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 30th');
    END IF;
    dbms_output.put_line('Customers''  credit limit  is adjusted.');
END;
/

