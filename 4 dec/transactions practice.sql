/**
how to enable and disble trigger
----------------------------------

Disable a Particular Trigger:

Syntax:

ALTER TABLE Table_Name DISABLE TRIGGER Trigger_Name
 
Example:

ALTER TABLE Employee DISABLE TRIGGER TR_Insert_Salary
 

---------------------------------------------------------------------------

Enable a Particular Trigger:

Syntax:

ALTER TABLE Table_Name ENABLE TRIGGER Trigger_Name
 
Example:

ALTER TABLE Employee ENABLE TRIGGER TR_Insert_Salary
 



--------------------------------------------------------------------------


Disable All Trigger of a table:

We can disable and enable all triggers of a table using previous query, but replacing the "ALL" instead of trigger name.

Syntax:

ALTER TABLE Table_Name DISABLE TRIGGER ALL 
 
Example:

ALTER TABLE Demo DISABLE TRIGGER ALL




------------------------------------------------------------------------------------


 
Enable All Trigger of a table:

Syntax:

ALTER TABLE Table_Name ENABLE TRIGGER ALL
 
Example:

ALTER TABLE Demo ENABLE  TRIGGER ALL


-----------------------------------------------------------------------------
 
Disable All Trigger for database:

Using sp_msforeachtable system stored procedure we enable and disable all triggers for a database.
 
Syntax: 

Use Database_Name 
Exec sp_msforeachtable "ALTER TABLE ? DISABLE TRIGGER all"
 
Example:

Use Demo
Exec sp_msforeachtable "ALTER TABLE ? DISABLE TRIGGER all"

-----------------------------------------------------------------------------
 
Enable All Trigger for database:

Syntax:

Use Database_Name
Exec sp_msforeachtable "ALTER TABLE ? ENABLE TRIGGER all"
 
Example:

Use Demo
Exec sp_msforeachtable "ALTER TABLE ? ENABLE TRIGGER all"

-------------------------------------------------------------------------------


Trigger Execution order

EXEC sys.sp_settriggerorder @triggername = 'TRIGGER_FIRST',  
   @order = 'FIRST',  
   @stmttype = 'INSERT',  
   @namespace = NULL  
Now we set the order of TRIGGER_SECOND.
EXEC sys.sp_settriggerorder @triggername = 'TRIGGER_SECOND',  
   @order = 'LAST',  
   @stmttype = 'INSERT',  
   @namespace = NULL  

**/

----------------------------------------------------------------
-- insert of keyword and views

create table a1
(
custid int,
custname varchar(12)
)
create table b1
(
custid int,
product varchar(12)
)

create view testview1
as
select a1.* , b1.product from a1 inner join b1 on a1.custid = b1.custid


select * from testview1



Create trigger tr1
on testview1  
Instead Of Insert  
as  
Begin  
insert into A1 (custid,custname)
Select custid, custname from inserted  

insert into b1 (custid,product)
Select custid,product from inserted
End


insert into testview1 values(1,'ajay','books')


select * from a1
select * from b1



------------------------------------


create table a2
(
custid int,
custname varchar(12)
)


create trigger tr
on a2  
Instead Of Insert  
as  
Begin 
insert into a2 select custid , left(custname,2) from inserted
end

insert into a2 values(1,'vijay')





===================================




alter trigger mytrig1 on newstudentstbl
instead of insert
as
begin
-- u have to manully write insert command inside the trigger
insert into  newstudentstbl select studentid,upper(studentname),age,upper(saddress) from inserted
end

-- it will not be inserted
insert into newstudentstbl values(1200,'kanishka',23,'chennai')



==========================================================================================================

--simple transaction demo



create table TableA
(
custid int primary key,
custname varchar(20)
)

create table TableB
(
custid int primary key,
custname varchar(20)
)

-- without transaction
insert into TableA values(200,'vijay')
insert into TableB values(100,'viju')

select * from tableA
select * from TableB

-- with transaction
begin transaction
insert into TableA values(300,'Ram')
insert into TableB values(100,'rahim')
if(@@ERROR > 0)
rollback transaction
else
commit transaction

==============================================================================================================

--save point demo


BEGIN TRANSACTION;

INSERT INTO Employees VALUES (1, 'John');

SAVE TRANSACTION SP1;

INSERT INTO Employees VALUES (2, 'Sara');

-- Rollback the second insert only
ROLLBACK TRANSACTION SP1;

COMMIT TRANSACTION;
=============================

BEGIN TRANSACTION;

INSERT INTO Accounts VALUES (101, 'Amit', 5000);

SAVE TRANSACTION DepositSave;

BEGIN TRY
    -- This will cause an error (division by zero)
    DECLARE @x INT = 1/0;
    
    UPDATE Accounts SET Balance = Balance + 2000 WHERE AccID = 101;
END TRY
BEGIN CATCH
    PRINT 'Error occurred... rolling back to savepoint';
    ROLLBACK TRANSACTION DepositSave;
END CATCH;

COMMIT TRANSACTION;



