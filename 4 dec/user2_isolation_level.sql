-- read uncommited 

begin transaction
update test set cname='ram' 
where cid=1

--dont commit (even without committing window1 can see updated record)

-- 2 read commited -- it will solve the problem OF UPDATE  
-- means you can not update the record untill you commit

begin transaction
update tests set cname='Deep' 
where cid=1  -- it will not work

--window1 will wait ultil update is  commited from window2
--(update, insert can happen)

begin transaction
update tests set cname='Deep' 
where cid=1
commit  -- now it will work


-- 3 repeatable

begin transaction
update tests set cname='abc' 
where cid=1
commit

-- window2 cannot update where cid=12 (update is blocked)(new insert can happen)

-- 4 
begin transaction 
insert into tests values(2,'kiran')
commit


-- now even new insertion is blocked





