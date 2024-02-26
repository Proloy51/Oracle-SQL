/*set serveroutput on
declare 
dept_id dept.dept_id%type;
dept_name DEPT.DEPT_NAME%type;
buildings number;
begin
select dept_id,dept_name,buildings into dept_id,dept_name,buildings from dept where dept_id=7;
dbms_output.put_line('DEPT_id: '||dept_id|| ' DEPT_name: '||dept_name || ' no_of_buildings: '||buildings);
end;
/*/

--select * from dept;


desc dept;

set serveroutput on
declare
var1 number :=10;
var2 varchar2(20):='ECE';
var3 number := 7;
begin
insert into dept values(var2,var1,var3);
end;
/

select * from dept;


set serveroutput on
declare 
v1 number;
v2 number;
v3 number;

begin
v1 := &num1;
v2 := &num2;
v3 := v1+v2;
dbms_output.put_line('Summation is : ' || v3);
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


set serveroutput on
declare 
i number;
begin
