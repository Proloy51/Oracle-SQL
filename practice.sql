

drop table employee;

create table employee(name varchar(30),id number);

insert into employee(name,id)values('Barek',1);
insert into employee(name,id)values('Tarek',2);
insert into employee(name,id)values('Garek',3);
insert into employee(name,id)values('Farek',4);
insert into employee(name,id)values('Marek',5);

select * from employee;

select * from employee where id in(2,3,5);

select * from employee where id > any(2,3);

select table_name from user_tables;
show user;


select * from employee where id > any(1,2);

select name,id,id+10 from employee;

select upper(name),name,id from employee;

select * from employee;

select lower(name),id/2,id from employee;

select initcap(name),id/2,id from employee;

select floor(id/2),id/2,id from employee;

select ceil(id/2),id/2,id from employee;

select to_char(id),id from employee;

select to_number(id),id from employee;

alter table employee add frac number;

desc employee;

update employee set frac=id/2 where id=1;

select * from employee;

update employee set frac=id/2 where id=2;

select * from employee;

update employee set frac=id/2 where id=3;

select * from employee;

update employee set frac=id/2 where id=4;

select * from employee;

update employee set frac=id/2 where id=5;

select * from employee;

alter table employee rename column frac to fraction;

select * from employee;

rename employee to emp;

select name,id,fraction,round(fraction,2) from emp;

select count(*) from emp;

select count(*) id from emp;

select id,power(id,2),mod(id,2) from emp;

alter table emp rename column nid to emp_id;

select * from emp;

select replace(name,'k','keka'),name,emp_id,fraction from emp;

select max(emp_id) from emp;

select min(emp_id) from emp;

select avg(emp_id) from emp;

insert into emp(name,emp_id) values('Narek',6);

select * from emp;

update emp set fraction=emp_id/2 where emp_id=6;

select * from emp;

select max(emp_id) from emp;

select ceil(avg(emp_id)) from emp;

select max(emp_id),min(emp_id),avg(emp_id) from emp where emp_id >=4 and emp_id<=5;

select count(*) from emp;

select count(*) from emp where emp_id=2 or emp_id=3 or emp_id=5;

select * from emp where emp_id in(2,3,5);

select count(*) from emp where emp_id in(2,3,5);

select sum(emp_id) from emp where emp_id in(2,3,5);

select * from emp;

alter table emp drop column fraction;

select * from emp;

insert into emp(name,emp_id)values('Arpita',6);
insert into emp(name,emp_id)values('Proloy',5);
insert into emp(name,emp_id)values('Dip',4);
insert into emp(name,emp_id)values('nobo',1);

select * from emp;

select emp_id,count(emp_id) from emp group by emp_id; 

alter table emp add salary number;

alter table emp rename column salary to sal;

update emp set sal=10000 where name='Arpita';
update emp set sal=11000 where name='Proloy';
update emp set sal=12000 where name='Dip';
update emp set sal=13000 where name='nobo';
update emp set sal=14000 where name='Barek';
update emp set sal=15000 where name='Tarek';
update emp set sal=16000 where name='Garek';
update emp set sal=17000 where name='Farek';
update emp set sal=18000 where name='Marek';
update emp set sal=19000 where name='Narek';

select * from emp;

select emp_id,count(emp_id),avg(sal) as avg_salary from emp where emp_id>=3 and emp_id <=5 group by emp_id;

select emp_id,count(emp_id),avg(sal) as avg_salary from emp group by emp_id having count(emp_id)>=2;

select * from emp;


select emp_id,count(emp_id),avg(sal) from emp where emp_id>=3 group by emp_id order by emp_id desc;

select * from emp where emp_id > some(select emp_id from emp where emp_id>4);

select table_name from user_tables;

--new table start

create table student(Name varchar2(30),Department char(3),Roll number not null);

insert into student(Name,Department,Roll)values('Proloy','CSE',1907051);
select * from student;

alter table student rename column Department to dept;
desc student;

rename student to stu;

insert into stu(Name,dept,roll)values('Mamanur','CSE',1807051);
select * from stu;

alter table stu add constraint unique_roll unique (roll);

insert into stu(Name,dept,roll)values('Tushar','CSE',1607051);

select * from stu;

alter table stu add constraint primary_name primary key (Name);

insert into stu(Name,dept,roll)values('Saniyat','EEE',1805051);

select * from stu;

--for foreign key

select * from dept;

alter table dept drop column name;

alter table dept add buildings number;

update dept set buildings=2 where dept_id=7;
update dept set buildings=3 where dept_id=5;
update dept set buildings=5 where dept_id=9;

select * from dept;

select dept_name from dept where dept_name like 'E_%';

select dept_name from dept where dept_name like '__%';

alter table dept add constraint primary_dept_id primary key(dept_id);

select * from dept;

create table course(course_no varchar2(20),course_title varchar2(50),dept_id number,
 foreign key(dept_id) references dept(dept_id));
 
insert into course(course_no,course_title,dept_id)values('CSE 3103','Peripherals and Interfacing',7);
insert into course(course_no,course_title,dept_id)values('CSE 3109','Database Systems',9);     

select * from course;

select dept_name from dept where dept_id=
(select dept_id from course where course_title='Peripherals and Interfacing');

select * from dept,course;

select d.dept_name from dept d inner join course c on d.dept_id = c.dept_id;

create table stud(dept_id varchar2(20),dept_name varchar2(20));
insert into stud(dept_id,dept_name)values('1','CSE');
insert into stud(dept_id,dept_name)values('2','EEE');
insert into stud(dept_id,dept_name)values('3','ESE');

select * from stud;

create table stud_info(dept_id varchar2(20),dept_name varchar2(20));

insert into stud_info(dept_id,dept_name)values('1','CSE');
insert into stud_info(dept_id,dept_name)values('2','CSE');
insert into stud_info(dept_id,dept_name)values('6','MSE');

select * from stud_info;

select dept_id,dept_name from stud minus select dept_id,dept_name from stud_info;

