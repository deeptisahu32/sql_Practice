---------------some built in procedure -----------------------------------
sp_help
sp_depends
sp_helpdb
sp_helptext
sp_rename

---------------------- now we can create own procedure using store procedure concept --------------------------------

select * from student;

----------------- create procedures -----------------------

create procedure sp_student
as
select * from student;

sp_student; ---- execute procedure


------------------- create procedure with paramneter means when user type the thatt value so print that studnet-------------

create procedure getbyage(@a int)
as
select * from student
where age=@a

exec getbyage 22;
exec getbyage 23;

------------------ how to drop procedure --------------------------

drop procedure sp_student;

------------------------ how to alter procedeure ------------------------------
create procedure sp_student     
as
select * from student;    -----  iwant this procedure print only some column

alter procedure sp_student
as
select stuid,studentname from student;

exec sp_student;

--------------------- how we create procedure for programming ---------------------------

-- create procedure for adding two numbers

create procedure addnum(@a int ,@b int)
as
print @a+@b

exec addnum 10,20;

-------------------------- can procedure returns value------------------------------

create procedure addnum1(@a int ,@b int)
as
return @a+@b

declare @result int
exec @result=addnum1 10,20
print @result;

--------------------------- can procedure return multiple value---------------------

create procedure addproduct(@a int,@b int,@c int output,@d int output)
as 
set @c=@a+@b
set @d=@a*@b

declare @m int
declare @n int
exec addproduct 10,20,@m output,@n output
print @m
print @n

--------------------------------- how to create procedure for try catch block---------------------------------
----- always when we write nay programming ant try catch we have to write always in procedures--------------------

create procedure devide(@a int,@b int)
as
begin try
print @a/@b
end try
begin catch
print 'error occured :' +error_message()
end catch

exec devide 12,0;

--------------------------- inserting some values in new table from procedure of old table---------------------
--- for that both table sturcture should be same


create procedure getbyage1(@a int)  -- we created that procedure in old student table
as
select * from student
where age=@a

--- now suppose we have same sturucture of table

select * into newstudent from student;

delete from newstudent;
select * from newstudent;  -- now i have same structure of student table

-- now i want that getbyage1 procedure what i have created it whatever ouput gave that insert in newstudent

insert into newstudent exec getbyage1 22;

select * from newstudent;

-------------------------  how to insert new record in table by procedure-------------------------------------
create table testing
(
custid int identity (10,10),
custname varchar(20),
age int
)

insert into testing values('Ashok',23)
insert into testing values('Logeshwaran',23)

select * from testing


create procedure myproc(@cname varchar(20),@ag int)
as
insert into testing values(@cname,@ag)
return scope_identity()

-- i want to know what values has been assiged for custid 

/**
declare @res int
exec @res = myproc 'deepa',22
print @res
**/

declare @res int
exec @res =myproc 'deep',23
print @res


select * from testing
------------------------------------------------------------
-- how to pass table names dynamically.

create procedure displaydata(@tbl varchar(20))
as
declare @myquery nvarchar(100)
set @myquery = 'select * from ' + @tbl
exec sp_executesql @myquery -- runs the select command

displaydata 'student';