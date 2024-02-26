drop table t4;
drop table t3;
drop table t2;
drop table t1;

create table t1(
a1 number(20),
b1 varchar(30),
c1 varchar(30),
d1 number(20),
primary key(d1)
);

create table t2(
p2 varchar(20),
q2 varchar(30),
r2 number(30),
d2 number(20),
primary key(d2)
);

create table t3(
a3 number(20),
b3 varchar(30),
c3 number(30),
d3 varchar(20),
d1 number(20),
primary key(d3),
foreign key(d1) references t1(d1)
);

create table t4(
a4 number(20),
b4 varchar(30),
c4 number(30),
d4 varchar(20),
d2 number(20),
d3 varchar(20),
primary key(d4),
foreign key(d2) references t2(d2),
foreign key(d3) references t3(d3)
);


insert into t1(a1,b1,c1,d1) values(2,'A','AA',1);
insert into t1(a1,b1,c1,d1) values(3,'B','BB',2);
insert into t1(a1,b1,c1,d1) values(4,'C','CC',3);
insert into t1(a1,b1,c1,d1) values(5,'D','DD',4);
insert into t1(a1,b1,c1,d1) values(6,'E','EE',5);


insert into t2(p2,q2,r2,d2) values('A','B',1,2);
insert into t2(p2,q2,r2,d2) values('C','D',2,3);
insert into t2(p2,q2,r2,d2) values('E','F',3,4);
insert into t2(p2,q2,r2,d2) values('G','H',4,5);
insert into t2(p2,q2,r2,d2) values('I','J',5,6);

insert into t3(a3,b3,c3,d3,d1) values(1,'A',2,'B',1);
insert into t3(a3,b3,c3,d3,d1) values(2,'C',3,'D',2);
insert into t3(a3,b3,c3,d3,d1) values(3,'E',4,'F',3);
insert into t3(a3,b3,c3,d3,d1) values(4,'G',5,'H',4);
insert into t3(a3,b3,c3,d3,d1) values(5,'I',6,'J',5);

insert into t4(a4,b4,c4,d4,d2,d3) values(1,'A',2,'B',2,'B');
insert into t4(a4,b4,c4,d4,d2,d3) values(2,'C',3,'D',3,'D');
insert into t4(a4,b4,c4,d4,d2,d3) values(3,'E',4,'F',4,'F');
insert into t4(a4,b4,c4,d4,d2,d3) values(4,'G',5,'H',5,'H');
insert into t4(a4,b4,c4,d4,d2,d3) values(5,'I',6,'J',6,'J');
