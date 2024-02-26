create or replace PROCEDURE name is
dept_name dept.dept_name%type;
begin
select dept_name into dept_name from dept where dept_id=2;
dbms_output.put_line('Departmant name is : ' || dept_name);
end;
/

select * from dept;

set serveroutput on
begin
name;
end;
/



create or replace procedure name2(DEPTID in dept.dept_id%type) is
deptRow dept%rowtype;
begin
select dept_name,dept_id,faculty,no_of_student into deptRow.dept_name,deptRow.dept_id,deptRow.faculty,deptRow.no_of_student from dept where dept_id=DEPTID;
dbms_output.put_line(deptRow.dept_name ||  deptRow.dept_id ||  deptRow.faculty ||  deptRow.no_of_student);
end;
/


set serveroutput on
begin
name2(1);
end;
/



set serveroutput on
declare 
counter number;
type namearray is varray(5) of dept.dept_name%type;
a_name namearray := namearray();
deptName dept.dept_name%type;

begin
counter := 1;
for x in 1..15 loop

if x>3 then
continue;

else
select dept_name into deptName from dept where dept_id=x;
a_name.extend();
a_name(counter) := deptName;
counter := counter+1;

end if;
end loop;

counter := 1;
while counter<=a_name.count loop
dbms_output.put_line('Departmant Name : ' || a_name(counter));
counter := counter+1;
end loop;

end;
/


create table Employees(
emp_id integer,
name varchar2(20),
email varchar2(50),
salary number);


insert into Employees values(1,'Proloy','proloy@gmail.com',150);
insert into Employees values(1,'Abtahe','abtahe@gmail.com',200);

insert into Employees values(3,'Ratul','ratuly@gmail.com',150);
insert into Employees values(4,'Adnan','adnan@gmail.com',200);
select * from employees;




select * from Employees;
update Employees set email='ratul@gmail.com' where emp_id=3;


set serveroutput on
declare
cursor c is select name,email from Employees;
Name Employees.name%type;
Email Employees.email%type;

begin
open c;
fetch c into Name,Email;
while c%found loop
dbms_output.put_line('Name : ' || Name || ' Email : ' || Email);
fetch c into Name,Email;
end loop;
close c;
end;
/



create or replace function emailfun(id in Employees.emp_id%type)
return varchar as
Email Employees.email%type;

begin
select email into Email from Employees where emp_id=id;
return Email;
end;
/


set serveroutput on
declare
Email Employees.email%type;
begin
Email := emailfun(4);
dbms_output.put_line('Email Adress : ' || Email);
end;
/







create table branch(
branch_name varchar2(20),
branch_city varchar2(20),
asset number,
primary key(branch_name));



create table account(
account_no number,
branch_name varchar2(20),
balance number,
primary key(account_no),
foreign key(branch_name) references branch(branch_name));


insert into branch values('KUET','Khulna',100);
insert into branch values('CUET','Chittagong',200);
insert into branch values('RUET','Rajhshahi',300);


insert into account values(101,'KUET',15000);
insert into account values(102,'CUET',600);
insert into account values(103,'RUET',800);

delete from account;


update account set balance = 15000 where account_no=101;
select * from account;

select branch_name from account where (select avg(balance) from account)  < 1200 ;


create table Loan(
loan_no number,
branch_name varchar2(20),
amount number,
primary key(loan_no));


insert into Loan values(1001,'KUET',1000);
insert into Loan values(1002,'CUET',2000);
insert into Loan values(1003,'RUET',3000);

insert into Loan values(1004,'KUET',1500);
insert into Loan values(1005,'RUET',500);



select loan_no from Loan where branch_name='RUET' and amount>1200;

update account set balance = ((select balance from account where balance>10000)*0.06);



select max(balance) from account where balance < (select max(balance) from account);


select branch_name from account where (select avg(balance) from account) > 1200;


select substr('Proloy Karmakar',6,12) from dual;

select instr('Proloy Karmakar','Kar',7,1) from dual;


select * from branch;

update branch set branch_name='KUET',branch_city='Khulna' where asset=100;



create table product(
product_id integer,
acutal_price number,
profit number,
primary key(product_id));

create table purchase(
p_id number,
sell_price number,
foreign key(p_id) references product(product_id));



insert into product values(1,950,0);
insert into product values(4,400,0);
insert into product values(5,120,0);


insert into purchase values(4,500);
insert into purchase values(1,1000);
insert into purchase values(4,520);
insert into purchase values(5,130);
insert into purchase values(1,980);
insert into purchase values(5,150);
insert into purchase values(1,1050);


create or replace procedure testproc(prod_id in number)as
cursor c is select sell_price from purchase where p_id=prod_id;
A_price product.acutal_price%type;
price number;
total number;


begin
total:=0;
select acutal_price into A_price from product where product_id=prod_id;
open c;
fetch c into price;
while c%found loop
total := total + price;
fetch c into price;
end loop;

update product set profit = (total-A_price) where product_id=prod_id;
end;



set serveroutput on
begin
testproc(4);
end;
/




alter table product add total_sell_price number;

update product set total_sell_price = 0 where product_id=1;
update product set total_sell_price = 0 where product_id=4;
update product set total_sell_price = 0 where product_id=5;


create or replace trigger testtrig 
after insert on purchase
for each row 


begin
update product set total_sell_price = (select sum(sell_price) from purchase where p_id =: new.p_id) where product_id = (select p_id from purchase where p_id =: old.p_id);
end;
/



insert into purchase values(1,500);

select * from product;










