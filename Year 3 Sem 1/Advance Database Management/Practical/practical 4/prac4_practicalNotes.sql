---To check data existance---
create or replace procedure adjust_price(in_productcode varchar) is
begin
    UPDATE products 
       SET buyprice = buyprice * 1.05 
       WHERE productcode = in_productcode;

    IF SQL%NOTFOUND THEN
        dbms_output.put_line('No such product - '|| in_productCode);
    elsif SQL%FOUND THEN
        dbms_output.put_line('Product '|| in_productCode|| ' - buy price is adjusted successfully');
    END IF;
end;
/

---Making Report Nicer---
SELECT productcode, buyprice,
TRIM (TO_CHAR (buyprice*9999, '$999G999G999D99')) , ---making format---
RPAD (buyprice, 12, '*') , ---Right padding---
LPAD (buyprice, 12, ' ')   ---Left padding---
FROM products;

                    