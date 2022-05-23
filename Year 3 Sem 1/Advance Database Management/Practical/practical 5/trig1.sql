CREATE OR REPLACE TRIGGER TRG_UPT_ORDERS_AMT
AFTER INSERT ON orderDetails
FOR EACH ROW
DECLARE
   v_OrderAmount   NUMBER := 0.00;
   v_TotalDiscount NUMBER := 0.00;
   v_FinalTotal    NUMBER := 0.00;
   v_discount      number(2,2);
BEGIN
   select discount into v_discount
   from Orders
   where orderNumber = :new.orderNumber;

   v_OrderAmount   := :new.priceEach * :new.quantityOrdered;
   v_TotalDiscount := ROUND(v_OrderAmount * v_discount,2);
   v_FinalTotal    := v_OrderAmount - v_TotalDiscount;

   UPDATE ORDERS
   SET OrderAmount   = OrderAmount + v_OrderAmount,
       TotalDiscount = TotalDiscount + v_TotalDiscount,
       FinalTotal    = FinalTotal + v_FinalTotal
   WHERE orderNumber = :new.orderNumber;
END;
/