------------------------------------------cursor--------------------------------------------

----- create normal cursor----

create table forcursor
(
id int identity(1,1) primary key,
name varchar(20),
salary decimal(10,2)
)
insert into forcursor values
('Ram',230000),
('Raj',340000),
('Rishi',12000),
('Komal',11000),
('Rajat',1200);


-- create cursor
--step 1
declare @cname varchar(20)
declare @Sal decimal(10,2)

-- step 2

declare cursor_name cursor for 
select name,salary from forcursor

-- step 3

open cursor_name

-- step 4

fetch next from cursor_name into @cname,@sal
print @cname
print @sal
print @@fetch_status
fetch next from cursor_name into @cname,@sal
print @cname
print @sal
print @@fetch_status
fetch next from cursor_name into @cname,@sal
print @cname
print @sal
print @@fetch_status
fetch next from cursor_name into @cname,@sal
print @cname
print @sal
print @@fetch_status
fetch next from cursor_name into @cname,@sal
print @cname
print @sal
print @@fetch_status

-- step 5

close cursor_name

-- step 6

deallocate cursor_name

------ create cursor with loops --------------------

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor for
select name,salary from forcursor

open cursor_name

fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
print @cname + ' '+cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end

close cursor_name
deallocate cursor_name

----------------------- types of cursor--------------------

--- 1. static cursor

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor static for
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
waitfor delay '00:00:5'
print 'STATIC: ' +@cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name   ----- one row inserting in same time but that row will not display


--------------- dynamic cursor --------------------

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor dynamic for
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
waitfor delay '00:00:5'
print 'dynamic: ' +@cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name  --- it will welcoming new values in running timw

------------- key set cursor -------------------------

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor keyset for
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
waitfor delay '00:00:5'
print 'keyset: ' +@cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name 

-------------- forword only ------------------------
-- we can perform action within cursor for all values
declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor forward_only for
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
update forcursor set salary=salary+1000
where current of cursor_name
print @cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name 


--------------------- fast_farword 

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor keyset for
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
--update forcursor set salary=salary+1000
--where current of cursor_name
print @cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name 

--------------------- scroll-----------------------

declare @cname varchar(20)
declare @sal decimal(10,2)

declare cursor_name cursor fast_farword
select name,salary from forcursor

open cursor_name
fetch next from cursor_name into @cname,@sal
while @@FETCH_STATUS=0
begin
update forcursor set salary=salary+1000
where current of cursor_name
print @cname + ' ' +cast(@sal as varchar)
fetch next from cursor_name into @cname,@sal
end
close cursor_name
deallocate cursor_name 



