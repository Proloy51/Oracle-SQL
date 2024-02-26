create table order1(
order_id number,
customer_id number,
order_date date,
total_amount number(10,2));

insert into order1(order_id,customer_id,order_date,total_amount)values(1,100,to_date('2022-01-01','YYYY-MM-DD'),100.00);
insert into order1(order_id,customer_id,order_date,total_amount)values(2,101,to_date('2022-01-05','YYYY-MM-DD'),250.00);
insert into order1(order_id,customer_id,order_date,total_amount)values(3,102,to_date('2022-01-10','YYYY-MM-DD'),75.50);
insert into order1(order_id,customer_id,order_date,total_amount)values(4,100,to_date('2022-01-15','YYYY-MM-DD'),300.00);
insert into order1(order_id,customer_id,order_date,total_amount)values(5,101,to_date('2022-01-20','YYYY-MM-DD'),50.00);

select * from order1;


create table customer_revenue(
total_revenue number(10,2));

create or replace trigger revenue_trigger 
after update or insert on order1 
for each row ENABLE
begin
update customer_revenue set total_revenue = (select sum(total_amount) from order1);
end;

insert into order1(order_id,customer_id,order_date,total_amount)values(6,110,to_date('2022-01-20','YYYY-MM-DD'),50.00);

select * from customer_revenue;

select * from role;
select * from  user_info;
select * from room;
select * from orders;


/* room name is given you have to answer who is in the room */

create or replace procedure find_who(roomname in room.room_name%type) is
userName user_info.user_name%type;
checkindate orders.date_of_checking%type;
checkoutdate orders.date_of_checkout%type;
begin
select user_name into userName from user_info where user_id = (select user_id from orders where room_id = (select room_id from room where room_name = roomname));
select date_of_checking,date_of_checkout into checkindate,checkoutdate from orders where room_id = (select room_id from room where room_name = roomname);
dbms_output.put_line('User Name is : ' || userName || ' Check in Date : ' || checkindate || ' Check out Date : ' || checkoutdate);
end;
/


set serveroutput on
begin
find_who('Ocean View');
end;
/



create table student1(
student_name varchar(20),
dept_name varchar(20));


insert into student1(student_name,dept_name)values('Proloy','CSE');
insert into student1(student_name,dept_name)values('Ratul','ESE');
insert into student1(student_name,dept_name)values('Abtahe','CSE');
insert into student1(student_name,dept_name)values('Adnan','CSE');
insert into student1(student_name,dept_name)values('Mahi','BECM');
insert into student1(student_name,dept_name)values('Humayun','BECM');


select * from student1;

select dept_name,count(student_name) from student1 group by dept_name having count(student_name) >= 2 order by(count(student_name));
