--Using cursor to print sets of records
--In this example, we want to print product details and indicate which product has UnitsInStock lower than a certain amount
/*
CREATE TABLE products(
  productCode		varchar(15) NOT NULL,
  productName		varchar(70) NOT NULL,
  productLine		varchar(50) NOT NULL,
  productScale		varchar(10) NOT NULL,
  productVendor		varchar(50) NOT NULL,
  productDescription	varchar(4000) NOT NULL,
  quantityInStock	number(4) NOT NULL,
  buyPrice		number(7,2) NOT NULL,
  MSRP			number(7,2) NOT NULL,
  PRIMARY KEY (productCode)
);
*/

CREATE OR REPLACE PROCEDURE prc_Low_Stock(v_lowQty IN NUMBER) IS

  v_indicator     char(5);

  CURSOR PROD_CURSOR IS
    SELECT productCode, productName, productLine, productScale, productVendor, quantityInStock, buyPrice
    FROM PRODUCTS
    WHERE quantityInStock < v_lowQty
    ORDER BY productLine;

  pRec PROD_CURSOR%rowtype;
  v_prodline products.productLine%type := ' ';

BEGIN
  DBMS_OUTPUT.PUT_LINE('PRODUCTS RUNNING LOW ON STOCK');
  DBMS_OUTPUT.PUT_LINE('=============================');
  DBMS_OUTPUT.PUT_LINE('====PLS=====INSERT==SUB-HEADING===HERE===============');

  OPEN PROD_CURSOR;

  LOOP
   FETCH PROD_CURSOR INTO pRec;
      
   EXIT WHEN PROD_CURSOR%NOTFOUND;
/*
   if pRec.quantityinStock < v_lowQty then
      v_indicator := '#<---';
   else
      v_indicator := '     ';
   end if;
*/

if pRec.productLine<> v_prodline then
   DBMS_OUTPUT.PUT_LINE(chr(10)||'Product Line: '||pRec.productLine);
   DBMS_OUTPUT.PUT_LINE(LPAD('-', 80, '-'));
   v_prodline := pRec.productLine;
  end if;

DBMS_OUTPUT.PUT_LINE( RPAD(pRec.productCode,12,'-')||'  '||
                    RPAD(pRec.productName,40,' ')||'  '||
                    RPAD(pRec.quantityinstock,8,' ')||
                    LPAD(to_char(pRec.buyPrice,'$9,999.99'),10,' ')||v_indicator);
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('======================================');
  DBMS_OUTPUT.PUT_LINE('TOTAL PRODUCTS PROCESSED ' || PROD_CURSOR%ROWCOUNT); 
  DBMS_OUTPUT.PUT_LINE('# indicates products low in quantity -- less than :'||v_lowQty); 
  DBMS_OUTPUT.PUT_LINE('--- END OF REPORT ----');

  CLOSE PROD_CURSOR;
  -- cursor by default wll be closed when procedure ends
END;
/


