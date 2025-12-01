create table student
(
stuid int,
studentname varchar(20),
age int,
class int
);
insert into Student values
(102,'Deepti',23,4),
(103,'Shyam',45,3),
(104,'Reena',12,6),
(105,'Vaibhav',23,2),
(106,'Sakashi',23,3),
(107,'Pooja',23,2);

select * from student;

--- create view for id,name,age----

create view studentv1 as 
select stuid,studentname,age from student;

select * from studentv1;

-- alter view name---

alter view studentv1 as select stuid,studentname,age,class from student
where age=23;

select * from studentv1;
select * from student;

-- insert into view table--

insert into studentv1(stuid,studentname) values
(108,'Jayant');

select * from studentv1;
select * from student;

-- update in view---

update student set age=22
where stuid=102;

select * from studentv1;
select * from student;

-- insert values in table---
insert into student values
(109,'Rishu_Sahu',23,4);

select * from student;
-- show only details where name contains undersocre

create view studentv2 as select * from student
where studentname like '%[_]%';

select * from studentv2;

sp_helptext studentv2;

-- now create view which can hide the definitions we can use wit encryption

create view studentv3
with encryption
as select * from student;

sp_depends studentv3;

-- using with check option

create view studentv4 as 
select stuid,studentname,age from student where age=23
with check option;

select * from studentv4;

insert into studentv4 values
(110,'d1',22);   -- it will not work becuase i used check option with condtion where age =23

insert into studentv4 values
(110,'d1',23);  -- it will work 



-- schema binding , to use of schema binding nobody can delete table where we have created lots of view

create view studentv5 
with schemabinding
as select stuid,studentname,age,class from dbo.student
where age=23;

drop table student;  -- we can not drop table 

--- create view with all

create view studentv6 with encryption,
schemabinding as select stuid,studentname,age from dbo.student
where age=23
with check option


---------------------------------using subquries--------------------------------------
select max(totalage) as maxage from(select sum(age) as totalage from student 
group by studentname)as t;

select * from student;


---------------------------------------CTE------------------------------------------

with cte1 as(
select sum(age) as totalage,class from student
group by class
)
select * from cte1;

--- unsing ranking rank(),dense_rank(),rownumber()

create table products
(
pid int primary key,
pname varchar(20),
price int,
totalstock int
)

insert into products values(10,'books',120,20)
insert into products values(20,'cd',220,60)
insert into products values(30,'pen',50,100)
insert into products values(40,'mouse',1000,45)
insert into products values(50,'keyboard',2200,5)

select * from products;

CREATE TABLE EmployeeSales (
    EmpId INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    SalesAmount INT,
    SalesMonth VARCHAR(20)
);

INSERT INTO EmployeeSales VALUES
(1, 'Amit',   'IT',        50000, 'January'),
(2, 'Neha',   'IT',        75000, 'January'),
(3, 'Rohit',  'IT',        75000, 'January'), 
(4, 'Kiran',  'IT',        30000, 'January'),
(5, 'Pooja',  'HR',        40000, 'January'),
(6, 'Sanjay', 'HR',        40000, 'January'),
(7, 'Meera',  'HR',        60000, 'January'),
(8, 'Vinay',  'Sales',     90000, 'January'),
(9, 'Simran', 'Sales',     85000, 'January'),
(10,'John',   'Sales',     85000, 'January');

select * from EmployeeSales;

--- unsing ranking rank(),dense_rank(),rownumber()

select * ,rank()over(order by salesamount desc) as rankbyamount from EmployeeSales;
select * ,dense_rank()over(order by salesamount desc) as rankbyamount from EmployeeSales;
select * ,row_number()over(order by salesamount desc) as rankbyamount from EmployeeSales;

--ranking using partition 

select * ,rank()over(partition by department order by salesamount desc) as rankbyamount from EmployeeSales;
select * ,dense_rank()over(partition by department order by salesamount desc) as rankbyamount from EmployeeSales;
select * ,row_number ()over(partition by department order by salesamount desc) as rankbyamount from EmployeeSales;

----- programming---------
--using if condition

declare @a varchar(12)
set @a='deepti'
print @a;

declare @a int,@b int
set @a=12
set @b=10
print @a+@b;

declare @a int
set @a=12
if @a=1
print 'not match'
else if @a=2
print 'good'
else
print 'matched';

declare @b int
set @b=12
if @b=12
begin
print 'not match'
print 'Hi'
end
else if @b=2
print 'good'
else
print 'matched';

-- typecasting and concat

declare @b int
set @b=12
if @b=12
begin
print 'mathced with '+cast(@b as varchar)
print concat('mathced with ',@b)
print 'Hi'
end
else if @b=2
print 'good'
else
print 'matched';


------Looping------ only while

declare @a int
set @a=0
while(@a<10)
begin
print @a
set @a=@a+1
end;

--stop loof in 5

declare @a int
set @a=0
while(@a<10)
begin
if(@a=5)
break
set @a=@a+1
print @a
end;

---- switch case-------

select * from EmployeeSales;

select empid,empname,
case
when department='IT' then 'IT department'
when department='HR' then 'HR department'
else 'Sales Department'
end as departmentname
from employeesales;

----- eror handling------

declare @a int
set @a=10
print @a/0; ----it will give error

begin try
declare @a int
set @a=10
print @a/0
end try
begin catch
print 'we can not devide by zero'
end catch;

begin try
declare @a int
set @a=10
print @a/0
end try
begin catch
print 'we can not devide by zero'
--if we don't know whats error so we can pass some build in function
print error_message()
print error_line()
print error_number()
print error_severity()
print error_procedure()
end catch;


----- rollup and cube it is for subtotal and grand total-----

select * from EmployeeSales;

select empname,Department,sum(salesamount) as total from EmployeeSales
group by rollup(empname,Department);

select empname,Department,sum(salesamount) as total from EmployeeSales
group by cube(empname,Department);



