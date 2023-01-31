create table STUDENT(USN int primary key,SName varchar(20), Address varchar(40),Phone int , Gender varchar(6));
create  table SEMSEC(SSID int primary key,Sem int,Sec char(1));
create table CLASS(USN INT ,FOREIGN KEY(USN) references STUDENT(USN), SSID INT, foreign key (SSID) REFERENCES SEMSEC(SSID));
create table SUBJECT(Subcode char(6) primary key ,Title varchar(30), Sem int , Credits int);
create table IAMARKS(USN INT, foreign key(USN) references STUDENT(USN), Subcode char(6), foreign key(Subcode) references SUBJECT(Subcode) ,SSID int ,foreign key(SSID) REFERENCES SEMSEC(SSID) ,Test1 int, Test2 int , Test3 int , FinalIA int);
 
insert into STUDENT values(5601, 'Manjunath',' Frazer town ,Bengalore',856412,'male' );
insert into STUDENT values(5602, 'Trisha', 'M.G.Road, Chennai', 894561,'female');
insert into STUDENT values(5609, 'Rakshith','Jayanagar ,Bengalore',856412,'male' );
insert into STUDENT values(5644, 'Trisha', 'Rajajinagar, Agra', 894561,'female');
insert into STUDENT values(5622, 'Trisha', 'Thanisandara, Thiruvanthpuram', 894561,'female');
insert into STUDENT values(5633, 'Yash', 'KGF, Kolar', 44887,'male');

insert into SEMSEC VALUES(6001,4,'A');
insert into SEMSEC VALUES(6002,3,'B');
insert into SEMSEC VALUES(6003,7,'C');
insert into SEMSEC VALUES(6010,9,'E');
insert into SEMSEC VALUES(6007,6,'A');
insert into SEMSEC VALUES(6009,4,'C');

insert into CLASS values(5601,6002);
insert into CLASS values(5602,6001);
insert into CLASS values(5609,6003);
insert into CLASS values(5644,6003);
insert into CLASS values(5622,6010);
insert into CLASS values(5633,6009);



insert into SUBJECT values('2sa011', 'English', 5, 9 );
insert into SUBJECT values('2sa212', 'Mathematics',4, 4 );
insert into SUBJECT values('2sa089', 'Science', 8, 6 );
insert into SUBJECT values('2sa325', 'Python', 5, 9 );
insert into SUBJECT values('2sa012', 'SQL', 6, 7 );


insert into IAMARKS values(5601,'2sa011',6002,25,24,23,89);
insert into IAMARKS values(5602,'2sa212',6001,18,21,29,87);
insert into IAMARKS values(5609,'2sa089',6003,27,24,19,79);
insert into IAMARKS values(5644,'2sa325',6003,19,26,18,65);
insert into IAMARKS values(5622,'2sa011',6010,23,24,28,72);
insert into IAMARKS values(5644,'2sa212',6003,19,26,18,65);
insert into IAMARKS values(5644,'2sa325',6003,19,26,18,65);


select  S.USN, SName, Address, Phone, Gender
from    SEMSEC SC,STUDENT S, CLASS C
where   S.USN = C.USN AND C.SSID= SC.SSID AND SC.SEM = 4 AND SC.SEC = 'C';

create view  jabir as
select  COUNT(Gender) , SC.Sem , SC.Sec
from    SEMSEC SC, STUDENT S, CLASS C
where   S.USN = C.USN AND C.SSID= SC.SSID 
group by SC.Sem,SC.Sec,Gender ;

create view Test_Marks1 as
select Test1, Subcode
from   IAMARKS 
where  USN = 5644;

select * from Test_Marks1;
select * from IAMARKS;

select Avg(FinalIA)
from ( select FinalIA
	   from IAMARKS
       order by FinalIA DESC limit 2) as gre
;

select  BOOK_ID
from BOOKM
ORDER BY BOOK_ID DESC limit 2,1;