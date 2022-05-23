--table for customer's monthly cummulative purchase
drop table customers_monthly;

create table CUSTOMERS_MONTHLY
(CustomerNumber number(11) NOT NULL, 
 YearNo         number(4) NOT NULL,
 MonthNo        number(2) NOT NULL,
 Monthly_Amount Number(9,2),
primary key (CustomerNumber,YearNo,MonthNo)
);
