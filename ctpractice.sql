select table_name from user_tables;
drop table table1;
drop table table2;


create table table1(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id));

create table table2(
course_no varchar(20),
course_name varchar(50),
year_semester number(3),
credit number(10),
dept_id number(20),
primary key(course_no),
foreign key(dept_id) references table1(dept_id));

insert into table1(dept_id,dept_name,faculty,no_of_student)values(7,'CSE','EE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);


select * from table1;



insert into table2(course_no,course_name,year_semester,credit,dept_id)values('CSE1101','Discrete Math',11,3,7);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('CSE3105','Database Systems',31,3,7);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('EEE1101','Basic Electrical Engineering',11,3,3);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('ME3101','Solid Mechanics',31,3,5);


select * from table2;

select dept_name from table1 where dept_id=
(select dept_id from table2 where course_name='Basic Electrical Engineering');


delete from table2 where dept_id=3;


select * from table2;


delete from table1 where dept_id=2;
delete from table1 where dept_id=7;


drop table table1;
drop table table2;

create table table1(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id));


create table table2(
course_no varchar(20),
course_name varchar(50),
year_semester number(3),
credit number(10),
dept_id number(20),
primary key(course_no),
foreign key(dept_id) references table1(dept_id)
on delete cascade);

insert into table1(dept_id,dept_name,faculty,no_of_student)values(7,'CSE','EE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into table1(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);

select * from table1;


insert into table2(course_no,course_name,year_semester,credit,dept_id)values('CSE1101','Discrete Math',11,3,7);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('CSE3105','Database Systems',31,3,7);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('EEE1101','Basic Electrical Engineering',11,3,3);
insert into table2(course_no,course_name,year_semester,credit,dept_id)values('ME3101','Solid Mechanics',31,3,5);


select * from table2;

delete from table1 where dept_id=7;


select table_name from user_tables;

select * from student;

drop table student;

create table student(
student_name varchar(20) not null,
id number unique not null,
age number check(age>=20 and age<=30));

alter table student rename column student_name to stu_name;

select * from student;

alter table student rename column id to stu_id;

desc student;

insert into student(stu_name,stu_id,age)values('Proloy Karmakar',51,22);
insert into student(stu_name,stu_id,age)values('Sakib Hasan Topu',52,23);
insert into student(stu_name,stu_id,age)values('Dipto Saha',53,24);

select * from student;


select table_name from user_tables;


create table artist(
artist_id number,
name varchar2(20),
primary key(artist_id));


create table album(
album_id number,
artist_id number,
title varchar2(50),
release_year number,
primary key(album_id),
foreign key(artist_id)references artist(artist_id));


create table song(
song_id number,
album_id number,
artist_id number,
title varchar2(50),
song_length number(3,2),
primary key(song_id),
foreign key(album_id)references album(album_id),
foreign key(artist_id)references artist(artist_id));

alter table song rename column title to somg_title;

alter table song add release_date date;

select * from song;
