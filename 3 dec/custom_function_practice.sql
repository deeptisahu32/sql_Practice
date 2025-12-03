------------------------CUSTOM FUNCTION-----------------------------------------------------------------
--------------1. scaler function-----------------------------

select * from purchase;  ---- through scalar func calculate total

create function mul_price_qty(@a int,@b int)
returns int
as
begin
declare @c int
set @c=@a*@b
return @c
end

--use function

select dbo.mul_price_qty(2,3);

-- use in any query

select productid,purchasedate,price,qty,dbo.mul_price_qty(price,qty) as totals from purchase;

----------------------------using inline function that function return table-----------------------------------

select * from customers;

create function getbyaddress(@a varchar(20))
returns table
as
return
(
select * from customers where caddress=@a
)

--use function

select * from getbyaddress('kanpur');

--2 we can use this inline function when we have to join multiple tables and some table as same
--- like we have customers-orders-product
---- then customers-orders-sales
--- so here customers and orders are combine in all joins so we can create a function of that two tables
-- the  that fucntion we can use as a table with all 

select * from customers;
select * from Orders;
select * from Products;



alter function cust_order_join()
returns table
as
return
(
select c.*,o.orderid,o.orderdate,o.product,o.price,o.qty from customers as c
join Orders as o
on
c.custid=o.custid
)

select * from dbo.cust_order_join();

-- now we have cust_order_join function which contain all data of two tables

select cof.*,p.productid,p.product from dbo.cust_order_join() as cof
join Products as p
on
cof.custid=p.custid;

-----------------------------multi-statement-table---------------------------------------------
select * from employees;

create FUNCTION fn_Employees
   (@length nvarchar(9))
RETURNS @tbl_Employees TABLE
   (EmployeeID int PRIMARY KEY NOT NULL,
   [Employee Name] Nvarchar(61) NOT NULL)
AS
BEGIN
   IF @length = 'ShortName'
      INSERT @tbl_Employees SELECT EmpID, EmpName
      FROM Employees
   ELSE IF @length = 'LongName'
      INSERT @tbl_Employees SELECT EmpID,
      (EmpName + ' ' + empname) FROM Employees
   RETURN
END

SELECT * FROM dbo.fn_Employees('LongName')

SELECT * FROM dbo.fn_Employees('ShortName') 