--String Functions
--LEN()
SELECT LEN('SQL Server') AS LengthResult;

-- CONCAT()
SELECT CONCAT('Hello ', 'World') AS FullText;

 --REPLACE()
SELECT REPLACE('SQL SERVER TRAINING', 'SERVER', 'Database') AS NewText;

--SUBSTRING()
SELECT SUBSTRING('Microsoft SQL Server', 11, 3) AS ExtractedText;
-- Output: SQL


select SUBSTRING('helloworld',2,3)

 --UPPER()
SELECT UPPER('sql server') AS UpperCaseText;

-- LOWER()
SELECT LOWER('SQL SERVER') AS LowerCaseText;

-- RIGHT()
SELECT RIGHT('SQLSERVER', 6) AS LastCharacters;
-- Output: SERVER

--LEFT()
SELECT LEFT('DATABASE', 4) AS FirstCharacters;
-- Output: DATA

--Aggregate Functions


CREATE TABLE Sales1(
   Id INT,
   Amount INT
);

INSERT INTO Sales1 VALUES
(1, 100), (2, 300), (3, 250), (4, 150);

--MAX()
SELECT MAX(Amount) AS MaxAmount FROM Sales1;

--MIN()
SELECT MIN(Amount) AS MinAmount FROM Sales1;

-- SUM()
SELECT SUM(Amount) AS TotalAmount FROM Sales1;

-- COUNT()
SELECT COUNT(*) AS TotalRows FROM Sales1;

-- AVG()
SELECT AVG(Amount) AS AverageAmount FROM Sales1;

-- Numeric Functions
--SQRT()
SELECT SQRT(144) AS SquareRoot;

-- ROUND()
SELECT ROUND(123.4567, 2) AS RoundedValue;
-- Output: 123.46

 select POWER(2, 3);
-- Output: 8

-- RAND()
SELECT RAND() AS RandomNumber;       -- Random number between 0 and 1

select getdate()
--date function
SELECT DATENAME(year, GETDATE()) as Year,
       DATENAME(week, GETDATE()) as Week,
       DATENAME(dayofyear, GETDATE()) as DayOfYear,
       DATENAME(month, GETDATE()) as Month,
       DATENAME(day, GETDATE()) as Day,
       DATENAME(weekday, GETDATE()) as WEEKDAY



SELECT DATEADD(DAY, 10, '2024-01-01');
SELECT DATEADD(MONTH, -2, '2024-06-15');
SELECT DATEADD(YEAR, 1, GETDATE())


select DATEDIFF(DAY, '2024-01-01', '2024-01-02')
SELECT DATEDIFF(YEAR, '2010-01-01', GETDATE());
SELECT DATEDIFF(MONTH, '2024-01-01', '2024-06-01');

--cast functions
-- 1.cast
-- 2.convert

declare  @x int
set @x= 10
--print 'you have entered ' + cast(@x as varchar)-- no formatting
print 'you have entered ' + convert(varchar(10),@x)-- supports formatting


-- what is formatting?

declare @a date
set @a = '1-1-2000'
--print 'the date u have entered is' + cast(@a as varchar)
print 'you have entered ' + convert(varchar(10),@a,111)
print 'you have entered ' + convert(varchar(10),@a,109)
print 'you have entered ' + convert(varchar(10),@a,112)
print 'you have entered ' + convert(varchar(10),@a,113)
print 'you have entered ' + convert(varchar(10),@a,108)
