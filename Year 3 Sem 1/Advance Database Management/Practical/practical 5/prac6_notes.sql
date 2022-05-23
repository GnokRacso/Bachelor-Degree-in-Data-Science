alter table employees add 
( Salary Number(7,2) Default 0.00,
  Sal_Code number(1) Default 1 );

create table Salary_Grade
(Grade number(2) not null unique,
 Min_Salary number(6,2) not null,
 Max_Salary number(7,2) not null );

insert into salary_grade values(1,1800.00,3500.00);
insert into salary_grade values(2,3000.00,6000.00);
insert into salary_grade values(3,5500.00,8500.00);

--Create trigger to check salary--
Create or replace trigger check_emp_salary
  before insert or update of salary on employees
  for each row
declare
  vmax number;
  vmin number;
begin
  select min_salary, max_salary into vmin, vmax
  from salary_grade
  where grade = :new.sal_code;
  if (:new.salary between vmin and vmax) then
    raise_application_error(-20101, 'Salary is not in the valid range.');
  end if;
end;
/

 insert into employees(employeenumber,lastname,firstname,  salary, sal_code)
  values (1901, 'Sam','Lim', 5000, 2 );
 insert into employees(employeenumber,lastname,firstname, salary, sal_code)
  values (1902, 'Adam','Tim', 8000, 2 );
update employees set salary = 6300 where employeenumber = 1901;

--modify procedure to check salary--
CREATE OR REPLACE procedure Add_New_Emp(vEmpNo  IN number,                                                                                     
          vLastName  IN varchar2,  vFirstName IN varchar2,  vDOB IN varchar2, 
          vsalary in number, vsal_code in number) AS
 
   TOO_YOUNG EXCEPTION;
   PRAGMA exception_init(TOO_YOUNG, -20100);
   INVALID_SALARY EXCEPTION;
   PRAGMA exception_init(INVALID_SALARY, -20101);
BEGIN
   insert into employees(employeenumber,lastname,firstname,hired_date,dob, salary, sal_code) values
   (vEmpNo,vLastName,vFirstName,SYSDATE,to_date(vDOB,'yyyy/mm/dd'), vsalary, vsal_code);
   dbms_output.put_line( 'Successfully added '||vLastName||','||vFirstName||' as employee.' ); 
   EXCEPTION
      WHEN TOO_YOUNG THEN
      dbms_output.put_line( 'Cannot add '||vLastName||','||vFirstName||' as employee.'|| 
                                 chr(10) || 'Not yet 18 years old! ');
      WHEN INVALID_SALARY THEN
      dbms_output.put_line( 'Cannot add '||vLastName||','||vFirstName||' as employee.'|| 
                                 chr(10) || 'Salary not in the valid range! ');
END;
/
exec Add_New_Emp (1903, 'Mary','Tan', '2000/03/17', 5000,2);
exec Add_New_Emp (1907, 'Pin','Jian', '2004/03/17', 6000,2); 
exec Add_New_Emp (1908, 'Jimmy','Tan', '2000/08/23', 8000, 2); 


--Excercise
create or replace trigger trg_check_emp
  before insert on employees
  for each row
declare
  v_actualAge number := 0;
  vmax number;
  vmin number;
begin
  v_actualAge := months_between(SYSDATE, :new.DOB)/12;
  if(v_actualAge) < 18 THEN
    raise_application_error(-20100, 'Not yet 18 years old.');
  end if;

  select max_salary, min_salary into vmax, vmin
  from salary_grade
  where grade = :new.sal_code;
  if not(:new.salary between vmin and vmax) then
    raise_application_error(-20101, 'Salary is not in the valid range.');
  end if;
end;
/