Create table dept(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id)
);

insert into dept(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);

select * from dept;


set serveroutput on
declare
dept_name varchar2(20);
begin
select dept_name into dept_name from dept where dept_id=1;
dbms_output.put_line('Department Name : ' || dept_name);
end;
/


set serveroutput on
declare
cursor dept_cursor is select * from dept;
dept_row dept%rowtype;
begin
open dept_cursor;
if dept_cursor%isopen then
dbms_output.put_line('Yes, Cursor is open');
else
dbms_output.put_line('No, Cursor is Close');
end if;
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student; 
while dept_cursor%found loop
dbms_output.put_line('Department ID : ' || dept_row.dept_id  || ' Department Name : ' || dept_row.dept_name || ' Faculty : ' || dept_row.faculty || ' No of students : ' || dept_row.no_of_student);
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student; 
end loop;
close dept_cursor;
if dept_cursor%isopen then
dbms_output.put_line('Yes, Cursor is open');
else
dbms_output.put_line('No, Cursor is Close');
end if;
end;
/

set serveroutput on
declare
i number;
begin
for i in 1 .. 10 loop
dbms_output.put_line(i);
end loop;
end;
/


set serveroutput on
declare
i number := 1;
begin
while i<=10 loop
dbms_output.put_line(i);
i := i+1;
end loop;
end;
/


select * from dept;


-- Startg Procedure

-- without parameter

create or replace procedure dept_proc_without_para is 
dpt_name varchar2(20);
begin
select dept_name into dpt_name from dept where dept_id=51;
dbms_output.put_line('Department Name is : ' || dpt_name);
exception
when no_data_found then
dbms_output.put_line('Id does not exist in the dept table');
end;
/

set serverout on
begin
dept_proc_without_para;
end;
/

-- end without procedure


--start with parameter procedure

create or replace procedure dept_proc(id in number) is
dpt_name varchar(20);
begin
select dept_name into dpt_name from dept where dept_id=id;
dbms_output.put_line('Department Name is : ' || dpt_name);
exception
when no_data_found then
dbms_output.put_line('Id does not exist in the dept table');
end;
/


set serveroutput on
begin
dept_proc(15);
end;
/

--end without parameter procedure


--start with parameter procedure

create or replace procedure dept_proc_with_para(id in number,inc_percent in number,output out number) is
begin
select dept_id into output from dept where dept_id = id;
output := (output*inc_percent)/100;
dbms_output.put_line(output);
end;
/

set serveroutput on 
declare 
a number := 5;
b number := 50;
c number;

begin
dept_proc_with_para(a,b,c);
end;
/

--end with parameter procedure

--Function


--function without parameter start
create or replace function display
return varchar2
is
begin
return 'Hi, This is Proloy here.';
end;
/

set serveroutput on
begin
dbms_output.put_line(display);
end;
/

--function without parameter end


--function with parameter start

create or replace function squarefunction(num in number) 
return number
is
begin
return num*num;
end;
/


set serveroutput on
declare 
n number;
value number;
begin
n := 12;
value := squarefunction(n);
dbms_output.put_line('Square of ' || n || ' is : ' || value);
end;
/

select * from dept;

create or replace procedure sqre(num in number) is
total number;
begin
total := num*num;
dbms_output.put_line(total);
if(total > 10 and total <20) then
dbms_output.put_line('The square of the number is greater than 10 and less than 20');
elsif(total > 20 and total < 30) then
dbms_output.put_line('The square of the number is greater than 20 and less than 30');
else
dbms_output.put_line('Can be anything except the above situation');
end if;
end;
/

set serveroutput on
declare
n number;
begin
select dept_id into n from dept where dept_name = 'ME';
sqre(n);
end;
/




create table dept2(
dept_id number,
dept_name varchar2(20),
faculty varchar2(20),
no_of_student number);

select * from dept;


create or replace trigger dept_trigger 
before 
insert or delete or update 
on dept 
referencing old as o new as n
for each row
enable 
declare
begin
insert into dept2(dept_id,dept_name,faculty,no_of_student)values(:n.dept_id,:n.dept_name,:n.faculty,:n.no_of_student);
end;
/

select * from dept;

select * from dept2;

update dept set no_of_student=120 where dept_id=2;

insert into dept(dept_id,dept_name,faculty,no_of_student)values(10,'NAME','CE',60);



set serveroutput on
declare
dept_id dept.dept_id%type;
dept_name dept.dept_name%type;
no_of_students number;

begin
select dept_id,dept_name,no_of_student into dept_id,dept_name,no_of_students from dept where dept_id=5;
dbms_output.put_line('dept_id : ' || dept_id  || 'dept_name : ' || dept_name || 'Number of students : ' || no_of_students);
end;
/

select * from dept;

set serveroutput on
declare
cursor dept_cursor is select * from dept;
dept_row dept%rowtype;

begin
open dept_cursor;
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student;
while dept_cursor%found loop
dbms_output.put_line('dept_id : ' || dept_row.dept_id  || 'dept_name : ' || dept_row.dept_name || 'Faculty : ' || dept_row.faculty || 'Number of student : ' || dept_row.no_of_student);
dbms_output.put_line('Row count : ' || dept_cursor%rowcount);
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name.dept_row.faculty,dept_row.no_of_student;
end loop;
close dept_cursor;
end;
/

create table book(
book_no number,
book_name varchar2(20));

insert into book(book_no,book_name) values(12,'EEE basics');
insert into book(book_no,book_name) values(16,'CSE basics');


set serveroutput on
declare
  counter number;
  book_name2 book.book_name%type;
  type namearray is varray(5) of book.book_name%type;
  a_name namearray := namearray();
  
begin
  counter := 1;
  for x in 12..16
  loop
  select book_name into book_name2 from book where book_no = x;
  a_name.extend();
  a_name(counter) := book_name2;
  counter := counter+1;
  end loop;
  
  counter := 1;
  while counter <= a_name.count 
  loop
  dbms_output.put_line(a_name(counter));
  counter := counter+1;
  end loop;
  
  end;
  /
  
  
select * from dept;
insert into dept(dept_id,dept_name,faculty,no_of_student) values(12,'ESE','CE',30);
insert into dept(dept_id,dept_name,faculty,no_of_student) values(14,'TE','CE',30);
insert into dept(dept_id,dept_name,faculty,no_of_student) values(15,'le','CE',60);



set serveroutput on
declare
cursor dept_cursor is select dept_name,no_of_student from dept;
nos number;
dept varchar2(20);

begin
open dept_cursor;
fetch dept_cursor into dept,nos;
while dept_cursor % found loop
if nos=120 then
dbms_output.put_line(dept || ' is a Large department');

elsif nos = 60 then
dbms_output.put_line(dept || ' is Medium department');

else 
dbms_output.put_line(dept || ' is Small department');
end if;
fetch dept_cursor into dept,nos;
end loop;

close dept_cursor;
end;
/


select * from dept;




set serveroutput on
create or replace procedure getnofs  is
cursor c is select no_of_student from dept;
nos dept.no_of_student%type;
begin
open c;
fetch c into nos;
while c%found loop 
if nos=120 then
dbms_output.put_line('The department is a large department');
elsif nos=60 then
dbms_output.put_line('The department is a medium department');
else 
dbms_output.put_line('The department is a small department');
end if;
fetch c into nos;
end loop;
close c;
end;
/



set serveroutput on
declare
begin
getnofs;
end;
/


update dept set no_of_student=60 where dept_id=3;


/* A frunction will return the minimum of 2 numbers and then print the square of the minimum numnber*/


create or replace function min_min(num1 in number,num2 in number) return number is
minvalue number;
square number;
begin
if num1 > num2 then
minvalue := num2;
else
minvalue := num1;
end if;
return minvalue;
end;
/


set serveroutput on
declare
minval number;
squareval number;
begin
minval := min_min(2,3);
dbms_output.put_line('Minimum value is : ' || minval);
squareval := minval*minval;
dbms_output.put_line('Square of minimum value is : ' || squareval);
end;
/



/* Multiplication table */


create or replace procedure mulproc(n in number) is
begin
for i in 1..10 loop
dbms_output.put_line(n || ' x ' || i || ' = ' || (n*i));
end loop;
end;
/

set serveroutput on
begin
mulproc(10);
end;
/

