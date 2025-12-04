-- read uncommited 
create table tests (cid int,cname varchar(20));
insert into tests values(1,'Raj')

select * from tests;

set transaction isolation level read uncommitted
select * from tests where cid=1
waitfor delay '00:00:10'
select * from tests where cid=1   -- it will update name 

-- read commited demo

set transaction isolation level read committed
select * from tests where cid=1
waitfor delay '00:00:10'
select * from tests where cid=1


-- it will not show any output untill i will use commit word on that update code which is in second file

-- 3 reapeatable read demo


set transaction isolation level Repeatable Read
begin transaction
select * from tests where cid=1
waitfor delay '00:00:5'
select * from tests where cid=1
commit transaction



-- 4  serializable demo


set transaction isolation level serializable -- no insert is allowed
begin transaction 
select * from tests where cid >=2
commit

