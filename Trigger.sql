select * from t1;
select * from t2;

insert into t2(id,avg,total)values(1,1,2);

create or replace trigger triggy
after insert on t1
enable
declare 
average t2.avg%type;
TotalMarks t2.total%type;
begin
select avg(marks) into average from t1;
select sum(marks) into TotalMarks from t1;

update t2 set avg=average where id=1;
update t2 set total=TotalMarks where id=1;
end;
/

insert into t1(name,marks)values('Rahim',2);
insert into t1(name,marks)values('karim',100);

select * from t2;








create or replace procedure do(ID_no in number) is
cursor c is select name,dept,home_town from student where id=ID_no;
NAME student.name%type;
DEPT student.dept%type;
HOMETOWN student.home_town%type;
begin
open c;
fetch c into NAME,DEPT,HOMETOWN;
while c%found loop
dbms_output.put_line('Name : ' || NAME || ' Department : ' || DEPT || ' Home Town : ' || HOMETOWN);
fetch c into NAME,DEPT,HOMETOWN;
end loop;
close c;
end;
/


set serveroutput on
begin
do(3);
end;
/


