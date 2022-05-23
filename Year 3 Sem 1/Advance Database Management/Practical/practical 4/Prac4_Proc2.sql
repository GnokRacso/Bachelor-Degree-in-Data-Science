/*
CREATE TABLE orders(
 orderNumber	number(11) NOT NULL,
 orderDate	date NOT NULL,
 requiredDate	date NOT NULL,
 shippedDate	date DEFAULT NULL,
 status		varchar(15) NOT NULL,
 comments	varchar(500),
 customerNumber	number(11) NOT NULL,
 PRIMARY KEY (orderNumber)
);
CREATE TABLE orderdetails(
 orderNumber		number(11)  NOT NULL,
 productCode		varchar(15) NOT NULL,
 quantityOrdered	number(4)   NOT NULL,
 priceEach		number(7,2) NOT NULL,
 orderLineNumber	number(3)   NOT NULL,
 PRIMARY KEY (orderNumber,productCode)
);

*/

CREATE OR REPLACE PROCEDURE prc_order_details AS
/*
   v_orderNo		ORDERS.orderNumber%TYPE;
   v_orderDate		ORDERS.orderDate%TYPE;
   v_requiredDate	ORDERS.requiredDate%TYPE;
   v_shippedDate	ORDERS.shippedDate%TYPE;
   v_custNo		ORDERS.customerNumber%TYPE;
   v_productCode	ORDERDETAILS.productCode%TYPE;
   v_qtyOrd		ORDERDETAILS.quantityOrdered%TYPE;
   v_priceEach		ORDERDETAILS.priceEach%TYPE;
*/
cursor order_cursor is
       select customerNumber, orderNumber, orderDate, requiredDate, shippedDate
       from ORDERS;

cursor orderDetail_cursor (v_orderNo NUMBER) is
       select productCode, quantityOrdered, priceEach
       from ORDERDETAILS
       where orderNumber = v_orderNo;

order_total number(12,2) :=0;
        
BEGIN
/* OPEN order_cursor;
   FETCH order_cursor
         INTO v_custNo, v_orderNo, v_orderDate, v_requiredDate, v_shippedDate;
   WHILE order_cursor%FOUND
*/
   FOR order_rec in order_cursor LOOP
      DBMS_OUTPUT.PUT_LINE('Customer No : '||order_rec.customerNumber);
      DBMS_OUTPUT.PUT_LINE('Order    No : '||order_rec.orderNumber);
      DBMS_OUTPUT.PUT_LINE('Order Date     : '||order_rec.orderDate);
      DBMS_OUTPUT.PUT_LINE('Shipped        : '||order_rec.shippedDate);
      DBMS_OUTPUT.PUT_LINE('Required Date  : '||order_rec.requiredDate);
      dbms_output.put_line(chr(10));

      FOR orderdetail_rec in orderDetail_cursor(order_rec.orderNumber) LOOP
         DBMS_OUTPUT.PUT_LINE(orderdetail_rec.productCode||'***'||orderdetail_rec.quantityOrdered||'***'||orderdetail_rec.priceEach);
         order_total := order_total + orderdetail_rec.quantityOrdered;
      END LOOP;
   END LOOP;
   /* OPEN orderDetail_cursor;
      FETCH orderDetail_cursor
            INTO v_productCode, v_qtyOrd, v_priceEach;*/
   /* WHILE orderDetail_cursor%FOUND
      LOOP
         DBMS_OUTPUT.PUT_LINE(v_productCode||'***'||v_qtyOrd||'***'||v_priceEach);

         FETCH orderDetail_cursor
            INTO v_productCode, v_qtyOrd, v_priceEach;
      END LOOP;
      CLOSE orderDetail_cursor; */
   dbms_output.put_line(RPAD('-',50,'-'));
   dbms_output.put_line(chr(10)||'Total amount of order is '|| order_total);
   dbms_output.put_line(chr(10));

   /*  FETCH order_cursor
         INTO v_custNo, v_orderNo, v_orderDate, v_requiredDate, v_shippedDate;
   END LOOP;
   CLOSE order_cursor; */
END;
/
