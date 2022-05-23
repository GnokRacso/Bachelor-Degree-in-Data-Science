DECLARE
   TYPE products_cursor_typ IS REF CURSOR;
   productList_cursor	products_cursor_typ;

   v_productline    	productLines.productLine%TYPE;
   v_Desc		productLines.textDescription%TYPE;
   v_productCode	products.productCode%TYPE;
   v_productName	products.productName%TYPE;
   v_MSRP		products.MSRP%TYPE;

   CURSOR c1 IS
      select pl.productLine, pl.textDescription,
             CURSOR ( select p.productCode, p.productName, p.MSRP
                      from products p
                      where p.productLine = pl.productLine
                    ) products_info
      from productLines pl;
  
BEGIN
   OPEN c1;
   LOOP -- Process each row of query result set
      FETCH c1 INTO v_productLine,v_Desc, productList_cursor;
         EXIT WHEN c1%NOTFOUND;

      dbms_output.put_line(chr(10));
      DBMS_OUTPUT.PUT_LINE('Product line: ' || v_productLine);
      DBMS_OUTPUT.PUT_LINE('Description : ' || v_Desc);

      LOOP -- Process each row of subquery result set
         FETCH productList_cursor INTO v_productCode, v_productName, v_MSRP;
            EXIT WHEN productList_cursor%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('Product Code: ' ||v_productCode||' price is '||v_MSRP);
         DBMS_OUTPUT.PUT_LINE('Product Name: ' ||v_productName);
      END LOOP;

      DBMS_OUTPUT.PUT_LINE('No. of products in this line :' || productList_cursor%ROWCOUNT); 

   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Total Product lines :' || c1%ROWCOUNT); 
   CLOSE c1;
END;
/