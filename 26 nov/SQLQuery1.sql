-- creating Scheama --
create database db2;

-- createing table ---
create table students(
studentid int,
studentname varchar(20),
studentAge tinyint,
stundentMarks int,
studentGrade char
);

--insert data in table --
insert into students values
(1,'Rishi',23,90,'A'),
(2,'Rajat',12,89,'B'),
(3,'Jayant',13,56,'C');

-- show the table --

select * from students;

insert into students values
(4,'Prashanti',27,99,'A'),
(5,'Ashrita',22,89,'A'),
(6,'Raju',56,78,'B');

-- update details---
update students set studentGrade='B'
where studentid=4;

-- delete record--
delete from students where studentid=6;
--select ways
select * from students where studentid>3;

select * from students
order by stundentMarks desc;

select * from students
order by stundentMarks desc,studentname asc;

select * from students
where studentAge between 22 and 27;

select * from students
where studentname like 'A%';

select sum(stundentMarks) from students;

select sum(stundentMarks) from students
having sum(stundentMarks)>60;

select studentAge,sum(stundentMarks) from students
group by studentAge;

--custom id--

exec sp_addtype box,'varchar(20)',null;
create table india(custid int,custname box);

