
drop table dept;
drop table course;
drop table book;
drop table relation;


Create table dept(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id)
);
Create table course(
course_no varchar(20),
course_name varchar(50),
year_semister number(3),
credit number(20,4),
dept_id number(20),
primary key(course_no),
foreign key(dept_id) references dept(dept_id)
);
create table book(
book_no number(20),
book_name varchar(50),
author varchar(50),
book_edition number(4),
course_offering number(6),
primary key(book_no) 
);
create table relation(
book_no number(20),
course_no varchar(20),
primary key(book_no,course_no),
foreign key (book_no) references book(book_no),
foreign key (course_no) references course(course_no) 
);


insert into dept(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);

insert into course(course_no,course_name,year_semister,credit,dept_id)values('CSE1101','discreate math',11,3.00,3);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('CSE1201','Coordinate math',11,3.00,3);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('CSE3105','database systems',31,3.00,1);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('EEE1101','Basic electrical engineering',11,3.00,2);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('ME3101','solid mechanics',31,3.00,5);

insert into book(book_no,book_name,author,book_edition,course_offering)values(12,'discreate math','rosen',4,2);
insert into book(book_no,book_name,author,book_edition,course_offering)values(13,'database systems','korth',5,1);
insert into book(book_no,book_name,author,book_edition,course_offering)values(14,'data_communication','willim stallings',6,3);
insert into book(book_no,book_name,author,book_edition,course_offering)values(15,'solid mechanics','john abraham',3,2);
insert into book(book_no,book_name,author,book_edition,course_offering)values(16,'electrical engineering','boylsted',8,4);

insert into relation(book_no,course_no)values(14,'CSE1101');
insert into relation(book_no,course_no)values(16,'EEE1101');
insert into relation(book_no,course_no)values(15,'ME3101');
insert into relation(book_no,course_no)values(13,'CSE3105');


select * from dept;
select * from course;
select * from book;
select * from relation;

/* dept er na input dile j j course ache oigula dekhabe */

create or replace procedure courseProc(deptName dept.dept_name%type) is
cursor c is select course_name from course where dept_id = (select dept_id from dept where dept_name = deptName);
courseName course.course_name%type;
begin
open c;
fetch c into courseName;
while c%found loop
dbms_output.put_line('Course Name : ' || courseName);
fetch c into courseName;
end loop;
end;
/

set serveroutput on
begin
courseProc('EEE');
end;
/


select * from dept;
alter table dept rename column dept_id to department_id;


