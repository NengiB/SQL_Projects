/*select * from [HumanResources].[Employee]
where JobTitle = 'Design Engineer'
select * from [HumanResources].[EmployeePayHistory]
select * from person.person
where firstname = 'Rob' or firstname = 'Roberto'
select top 10 * from [Sales].[SalesOrderDetail]
select COUNT(*) from [HumanResources].[EmployeePayHistory]*/ 

-- Drop a table called 'student' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[student]', 'U') IS NOT NULL
DROP TABLE [dbo].[student]
GO

CREATE TABLE student 
(studentid varchar(15) not null,
firstname varchar (20) not null,
lastname varchar(20) not null,
emailaddress varchar(50) not null,
Fax varchar(10) null)

insert student 
VALUES
('1','Timothy','Ikegwu','ikeg@gmail.com','780000')

select * from student

TRUNCATE table student

select * from [Sales].[SalesOrderDetail]
where ProductID = 776
and SalesOrderID = 43659
or SalesOrderID = 43665

select * from [Sales].[SalesOrderDetail]
where SalesOrderID in (43659,
43665)

select * from [Sales].[SalesOrderDetail]
where ProductID = 776
and SalesOrderID = 43659
or SalesOrderID = 43665

select * from [Sales].[SalesOrderDetail]
where SalesOrderID in (43659,
43665)

select * from [Production].[Product]
where name like 'B%'

select * from [Production].[Product]
where name like 'B[A-E]%'

select * from [Production].[Product]
where rowguid LIKE '9C21AED2_%_%'

SELECT *
FROM [Sales].[SalesTerritory]
WHERE [CountryRegionCode] LIKE 'A_'

SELECT *
FROM [Sales].[SalesTerritory]
WHERE [group] LIKE 'E[ur]%';

SELECT *
FROM [Sales].[SalesTerritory]
WHERE [group] LIKE 'E[ur]%'

SELECT *
FROM [Sales].[SalesTerritory]
WHERE name LIKE '[!DR]%';

SELECT *
FROM [Sales].[SalesTerritory]
where name like ''

select count(*) from [Sales].[SalesTerritory]

select sum(quantity) , productid --SafetyStockLevel , name
from [Production].[ProductInventory]
group by ProductID

select sum(linetotal) as linetotal ,DueDate
from [Purchasing].[PurchaseOrderDetail]
group by DueDate
order by DueDate desc

select max(duedate) as lastest , min(duedate) as ealiestdate 
from Purchasing.PurchaseOrderDetail

select * from [Person].[Person]

select * from employeedepartment
where firstname = 'Terri'
and lastname = 'Duffy'

select a.name,c.jobtitle ,c.[NationalIDNumber] ,d.[FirstName] ,d.LastName
from [HumanResources].[Department] a
inner join [HumanResources].[EmployeeDepartmentHistory] b
on a.DepartmentID = b.DepartmentID
inner join [HumanResources].[Employee] c
on b.BusinessEntityID = c.BusinessEntityID
inner join [Person].[Person] d
on b.BusinessEntityID = d.BusinessEntityID

Select SUM(LineTotal) as TotalSales from [Sales].[SalesOrderDetail]
Select linetotal as SalesTotal from [Sales].[SalesOrderDetail]
Select * from [Sales].[SalesOrderDetail]
Select  SUM(LineTotal) as TotalSales , productid , [ModifiedDate]
from [Sales].[SalesOrderDetail]
group by productid , [ModifiedDate]
/*having SUM(LineTotal) > = 1000000*/
order by [ModifiedDate] , TotalSales desc

/*Segmentation based on total line order*/
select a.*,
case when a.linetotal > 0 and a . linetotal < 5000 then 'Bronze'
    when a.linetotal >= 5000 and a . linetotal < 10000 then 'Silver'
    when a.linetotal >= 100000 and a . linetotal < 20000 then 'Gold'
    when a.linetotal > 30000 then 'Platimum' else 'Other'
    end as SalesSegment
    /*into #salesegment*/ from [Sales].[SalesOrderDetail] a

    select top 2* from [HumanResources].[Department] a
    select top 2 * from [HumanResources].[EmployeeDepartmentHistory] b

    select a.name , c.jobtitle , c. nationalidnumber , d. firstname , d.lastname
    from [HumanResources].[Department] a
    inner join [HumanResources].[EmployeeDepartmentHistory] b
    on a.DepartmentID = b.DepartmentID
    inner join [HumanResources].[Employee]  C
    on b.BusinessEntityID = c.BusinessEntityID
    inner join [Person].[Person] D
    on b.BusinessEntityID = d.BusinessEntityID

    select top 1 * from [Person].[Person]
    select top 1 * from [Person].[EmailAddress]
    select top 1 * from [Person].[PersonPhone]

    select a.Title, a.firstname, a.lastname, b.emailaddress, c.phonenumber
    from [Person].[Person] A
    inner join [Person].[EmailAddress] B
    on a.BusinessEntityID = b.BusinessEntityID
    inner join [Person].[PersonPhone] C
    on a.BusinessEntityID = c.BusinessEntityID

    Classify phoneNumbertypeid 1 as Cellphonephone
phoneNumbertypeid 2 as Landline
phoneNumbertypeid 3 as Fax mnumber

select * from [Person].[PersonPhone]



/*Segmentation based on phonenumbertypeid*/
select a.*,
case when a.PhoneNumberTypeID = 1 then 'Cellphonephone'
    when a.PhoneNumberTypeID = 2 then 'Landline'
    when a.PhoneNumberTypeID = 3 then 'Fax mnumber'
    end as PhoneType
    /*into #PhoneType*/ from [Person].[PersonPhone] a


    select * from [Production].[Location]
    union
    select * from [Production].[Location]

select * from [Production].[Location]
    union all
    select * from [Production].[Location]

Select [BusinessEntityID] from  [Person].[Person]
intersect
select [BusinessEntityID] from [Person].[EmailAddress]


select BusinessEntityID from [Person].[BusinessEntity]
except 
select BusinessEntityID from [Person].[BusinessEntityAddress]


select * from [Production].[Location]

select * into #test from [Production].[Location]

select * from #test

--drop table #test


begin tran
update #test
set name = 'Tool Crib'
where locationid = 1

select * from #test
where locationid = 1 
ROLLBACK tran


insert #test
(name , costrate, availability ,modifieddate)
VALUES('Test',1.0,2.00,'2022-11-26')

delete from #test
where name = 'Tool Cribs'

select * from #test
union 
select * from [Production].[Location]


select * from [Production].[Location]
where name like 'paint%'

select * from [Production].[Location]
where name like '% shop'

update #test 
set CostRate = 2.5
where LocationID = 3


select * from [Production].[Location]
where name ! = 'Paint shop'

select * from #test
where name like 'paint %'
and CostRate = 2.5


select * from #test
where name like 'paint %'
or CostRate > 20
and Availability < 100

select count(*) AS Entities_Without_Email from 
(select BusinessEntityID AS Entities_Without_Email from [Person].[BusinessEntity]
except 
select BusinessEntityID from [Person].[EmailAddress]) temp;


select top 1 * from [Production].[Product]

select top 1 * from [Production].[ProductCostHistory]

select a.Name , a.ListPrice , b. StandardCost, (a.  ListPrice - b. StandardCost) as ProfitMargin
    from [Production].[Product] a
    inner join [Production].[ProductCostHistory] b
    on a.ProductID = b.ProductID
    order by ProfitMargin Desc

   select * from [Person].[Person]
    
   select [BusinessEntityID] , ([FirstName] +' '+ [LastName]) as Name from [Person].[Person] 
union
select [BusinessEntityID], [Name] from [Sales].[Store]
order by BusinessEntityID


select GETDATE()

select REPLACE(convert(varchar(7),birthdate,120), '-', '_')
from [HumanResources].[Employee]

select [BirthDate] from [HumanResources].[Employee]

select datediff(Year,birthdate,getdate()) as Age
from [HumanResources].[Employee]

select birthdate, datepart( year,birthdate) as Year , datepart( month,birthdate) as Month, datepart( day,birthdate) as Day
from [HumanResources].[Employee]

select datepart( year,birthdate) as Year
from [HumanResources].[Employee]
where datepart( year,birthdate) > 1970

select datename( MONTH,birthdate)
from [HumanResources].[Employee]

select birthdate, dateadd (year, 2, birthdate)
from [HumanResources].[Employee]

select ISDATE('2020-01-01')

select birthdate ,convert(varchar(4),(datepart(Year,birthdate))) +'_'+ convert(varchar(2),datepart(Month,birthdate)) as Age
from [HumanResources].[Employee]

select  replace(convert(varchar(7),birthdate,120),'-','_')
from [HumanResources].[Employee]


with cte AS
(
    select [BusinessEntityID] , [ModifiedDate], RN = ROW_NUMBER() OVER(partition by [BusinessEntityID], [ModifiedDate] order by [BusinessEntityID] , [ModifiedDate]) 
from [Sales].[SalesPerson]
)
select * from cte

select * into #test from [HumanResources].[Employee]

IF OBJECT_ID(N'dbo.#test', N'U') IS NOT NULL  
   DROP TABLE [dbo].[#test];  
GO

IF NOT EXISTS ( SELECT 1 FROM [Sales].[SalesPerson] WHERE BusinessEntityID = 274  )
BEGIN
    --INSERT INTO Users (FirstName, LastName) VALUES ('John', 'Smith')
 SELECT * FROM [Sales].[SalesPerson] WHERE BusinessEntityID = 274  

END

select [BusinessEntityID] from [Person].[BusinessEntity]
where [BusinessEntityID]  not in (select [BusinessEntityID] from [Person].[EmailAddress]
 )


select a.* , b.[SalesYTD]
from [Person].[BusinessEntity] a
left join [Sales].[SalesPerson] b
on a.[BusinessEntityID] = b.[BusinessEntityID]

select * from [Sales].[SalesPerson]
where [BusinessEntityID] = 274
EXCEPT
select [BusinessEntityID] from [Person].[BusinessEntity]
where [BusinessEntityID] = 274

IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'HumanResources' AND name like 'Employee')  
   DROP TABLE [dbo].[Employee];  
GO