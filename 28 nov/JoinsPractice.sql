select * from Orders;
select * from customers;

-- joins topic --

-- 1. using inner join

select * from customers as c
join Orders as o
on c.custid=o.custid;

-- 2. using Left outer join , left tabel is customers and right table is orders

select * from customers as  c
left join Orders as o
on c.custid=o.custid;

-- 3.using Right outer join 

select * from Orders as o
right join customers as c
on c.custid=o.custid;

-- 4. using full outer join

select * from customers as c
full outer join Orders as o
on c.custid=o.custid;

-- 5. using cross outer join

select * from customers cross join Orders;

-- 6. self join

select b.* from customers as a,customers as b 
where b.age<a.age
and a.custname='Deepti';

-- UNION All,Union,Except,intersect

select * into samecustomers from customers;

select * from customers;
select * from samecustomers;

-- union all --

select * from samecustomers
union all
select * from customers;

-- union --

select * from samecustomers
union
select * from customers;

-- except ----

select * from customers
except
select * from samecustomers;

-- intersect--

select * from customers
intersect
select * from samecustomers;


