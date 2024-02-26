
create table ROLE(
role_id number,
role_name varchar2(20) not null,
description varchar2(50),
primary key(role_id));


create table user_info(
user_id number,
first_name varchar2(20) not null,
last_name varchar2(20) not null,
user_name varchar2(30) not null,
email varchar2(256) unique not null,
password varchar2(50) not null,
phone varchar2(15),
role_id number,
primary key(user_id),
foreign key(role_id) references ROLE(role_id)
);


create table ROOM(
room_id number,
room_no number,
room_name varchar2(40) unique not null,
room_image varchar2(256),
per_day_price number not null,
description varchar2(100),
capacity number,
category varchar2(20),
type varchar2(40),
primary key(room_id));


create table orders(
order_id number,
room_id number,
date_of_checking date not null,
date_of_checkout date not null,
user_id number,
tax number,
discount number,
total number,
note varchar2(60),
payment_method varchar2(30) not null,
CONSTRAINT check_date check(
date_of_checkout > date_of_checking),
primary key(order_id),
foreign key(room_id) references ROOM(room_id),
foreign key(user_id) references user_info(user_id));


alter table role add age integer check(age>=18);
alter table role modify role_age number check(role_age>=18);
alter table role rename column age to role_age;
alter table role drop column role_age;

insert into role(role_id,role_name,description)values(1, 'Admin', 'Can access and manage all system features.');
insert into role(role_id,role_name,description)values(2, 'Guest', 'Has limited access to view system information.');


insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(101,'John','Doe','johndoe','johndoe@example.com','password123','555-1234',1);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(102,'Jane','Smith','janesmith','janesmith@example.com','mypassword','555-5678',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(103,'Bob','Johnson','BobJohnson','bobjohnson@example.com','passwordbob','555-1235',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(104,'Alice','Lee','AliceLee','alicelee@example.com','passwordalice','555-1236',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(105,'David','Kim','DavidKim','davidkim@example.com','passworddavid','555-1237',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(106,'Alice','Len','AliceLen','alicelen@example.com','passwordalicelen','555-1238',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(107,'Shane','Watson','ShaneWatson','shanewatson@example.com','passwordshane','555-1239',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(108,'Erling','Haland','ErlingHaland','erlinghaland@example.com','passworderling','555-1240',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(109,'Tino','Best','TinoBest','tinobest@example.com','passwordtino','555-1241',2);
insert into user_info(user_id,first_name,last_name,user_name,email,password,phone,role_id)values(110,'Robert','Leo','RobertLeo','robertleo@example.com','passwordshane','555-1242',2);



insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(1,101,'Garden View','room3.jpg',100,'Room with a view of the garden',2,'Standard','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(2,102,'Ocean View','room4.jpg',150,'Room with a view of the ocean',2,'Deluxe','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(3,103,'Executive Suite','room1.jpg',300,'Spacious suite with a separate living room and study',1,'Suite','Single Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(4,104,'River View','room7.jpg',400,'Room with a view of the river',2,'Luxurious','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(5,105,'Penthouse','room9.jpg',400,'Luxurious penthouse with a private terrace',2,'Premium','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(6,106,'Window View','room10.png',100,'Room with a view of the garden',1,'Standard','Single Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(7,107,'Road View','room11.jpg',150,'Room with a view of the townside',2,'Deluxe','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(8,108,'Expensive Suite','room1.jpg',300,'Spacious suite with a separate living room and study',1,'Suite','Single Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(9,109,'City View','room7.jpg',400,'Room with a view of the river',2,'Luxurious','Double Room');
insert into room(room_id,room_no,room_name,room_image,per_day_price,description,capacity,category,type)values(10,110,'Pool view','room9.jpg',400,'Luxurious penthouse with a private terrace',2,'Premium','Double Room');



insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (1, 1, to_date('2023-04-01','YYYY-MM-DD'), to_date('2023-04-05','YYYY-MM-DD'), 101, 20.00, 0.00, 500.00, 'Early check-in requested', 'Credit Card');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (2, 2, to_date('2023-04-15','YYYY-MM-DD'), to_date('2023-04-20','YYYY-MM-DD'), 102, 60.00, 25.00, 700.00, 'Late check-out requested', 'Cash');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (3, 3, to_date('2023-04-01','YYYY-MM-DD'), to_date('2023-04-05','YYYY-MM-DD'), 103, 84.00, 0.00, 900.00, 'Additional bed requested', 'Debit Card');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (4, 4, to_date('2023-06-10','YYYY-MM-DD'), to_date('2023-06-15','YYYY-MM-DD'), 104, 30.00, 50.00, 670.00, 'Room upgrade to deluxe requested', 'Cash');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (5, 5, to_date('2023-07-01','YYYY-MM-DD'), to_date('2023-07-03','YYYY-MM-DD'), 105, 12.00, 0.00, 320.00, 'Room upgrade to deluxe requested', 'Credit Card');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (6, 6, to_date('2023-04-01','YYYY-MM-DD'), to_date('2023-04-05','YYYY-MM-DD'), 101, 20.00, 0.00, 500.00, 'Early check-in requested', 'Credit Card');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (7, 7, to_date('2023-04-15','YYYY-MM-DD'), to_date('2023-04-20','YYYY-MM-DD'), 102, 60.00, 25.00, 700.00, 'Late check-out requested', 'Cash');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (8, 8, to_date('2023-04-01','YYYY-MM-DD'), to_date('2023-04-05','YYYY-MM-DD'), 103, 84.00, 0.00, 900.00, 'Additional bed requested', 'Debit Card');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (9, 9, to_date('2023-06-10','YYYY-MM-DD'), to_date('2023-06-15','YYYY-MM-DD'), 104, 30.00, 50.00, 670.00, 'Room upgrade to deluxe requested', 'Cash');
insert into orders (order_id, room_id, date_of_checking, date_of_checkout, user_id, tax, discount, total, note, payment_method)values (10,10, to_date('2023-07-01','YYYY-MM-DD'), to_date('2023-07-03','YYYY-MM-DD'), 105, 12.00, 0.00, 320.00, 'Room upgrade to deluxe requested', 'Credit Card');


set serveroutput on
declare
cursor c is select * from role;
role_row role%rowtype;
begin
open c;
fetch c into role_row.role_id,role_row.role_name,role_row.description;
while c%found loop
dbms_output.put_line('Role id : ' || role_row.role_id || ' Role Name : ' || role_row.role_name || ' Description : ' || role_row.description);
fetch c into role_row.role_id,role_row.role_name,role_row.description;
end loop;
close c;
end;
/


set serveroutput on
declare
cursor c is select * from user_info;
user_info_row user_info%rowtype;
begin
open c;
fetch c into user_info_row.user_id,user_info_row.first_name,user_info_row.last_name,user_info_row.user_name,user_info_row.email,user_info_row.password,user_info_row.phone,user_info_row.role_id;
while c%found loop
dbms_output.put_line('User id : ' || user_info_row.user_id || ' First Name : ' || user_info_row.first_name || ' Last Name : ' || user_info_row.last_name || ' User Name : ' || user_info_row.user_name || ' Email : ' || user_info_row.email || ' Password : ' || user_info_row.password || ' Phone : ' || user_info_row.phone || ' Role Id : ' || user_info_row.role_id);
fetch c into user_info_row.user_id,user_info_row.first_name,user_info_row.last_name,user_info_row.user_name,user_info_row.email,user_info_row.password,user_info_row.phone,user_info_row.role_id;
end loop;
close c;
end;
/

create or replace procedure checkinProc(username user_info.user_name%type) is
cursor c is select date_of_checking from orders where user_id = (select user_id from user_info where user_name = username);
checkindate orders.date_of_checking%type;
begin
open c;
fetch c into checkindate;
while c%found loop
dbms_output.put_line('Checking Date : ' || checkindate);
fetch c into checkindate;
end loop;
close c;
end;
/


set serveroutput on
begin
checkinProc('johndoe');
end;
/


select * from role;
select * from user_info;
select * from room;
select * from orders;