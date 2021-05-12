use master;
-- 1. 
SELECT * FROM dbo.Shippers;

-- 2. 
Select * FROM dbo.Categories;

--3. 
Select FirstName, LastName, HireDate from dbo.Employees
where Title = 'Sales Representative';

--4.
Select FirstName, LastName, HireDate from dbo.Employees
where Title = 'Sales Representative' and Country = 'USA';

--5. 
Select OrderID, OrderDate from dbo.Orders;

--6. 
Select SupplierID, ContactName, ContactTitle from dbo.Suppliers
where ContactTitle != 'Marketing Manager';

--7.
Select ProductID, ProductName from dbo.Products
where ProductName like '%queso%';

-- 8.
Select OrderID, CustomerID, ShipCountry from dbo.Orders
where ShipCountry like 'France' or ShipCountry like 'Belgium';

-- 9.
Select OrderID, CustomerID, ShipCountry from dbo.Orders
where ShipCountry IN('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- 10.
Select FirstName, LastName, Title, BirthDate from dbo.Employees
order by BirthDate;

-- 11. 
Select FirstName, LastName, Title, DateOnlyBirthDate = convert(date, BirthDate) from dbo.Employees
order by DateOnlyBirthDate;

-- 12. 
Select FirstName, LastName, FullName = concat(FirstName, ' ', LastName) from dbo.Employees;

-- 13.
Select OrderID, ProductID,UnitPrice, Quantity, TotalPrice = UnitPrice * Quantity from dbo.OrderDetails; 

-- 14. 
Select Count(Distinct(CustomerID)) from dbo.Customers;

-- 15. 
Select FirstOrder = Min(OrderDate) from dbo.Orders;

-- 16.
Select Country from dbo.Customers
Group by Country;

-- 17.
Select ContactTitle, TotalContactTitle = count(*) from dbo.Customers
Group by ContactTitle
Order by TotalContactTitle;

-- 18.
Select ProductID, ProductName, CompanyName from dbo.Products
INNER JOIN dbo.Suppliers
ON dbo.Products.SupplierID = dbo.Suppliers.SupplierID;

-- 19.
Select OrderID, OrderDate, CompanyName from dbo.Orders
INNER JOIN dbo.Shippers
ON dbo.Orders.ShipVia = dbo.Shippers.ShipperID;

-- 20
SELECT CategoryName, TotalProducts = count(*) from dbo.Categories
INNER JOIN dbo.Products
on dbo.Products.CategoryID = dbo.Categories.CategoryID
group by CategoryName
order by count(*) desc;

-- 21. 

Select Country, City, TotalCustomers = count(*) from dbo.Customers
Group By Country, City
Order by count(*) desc;

-- 22.
Select ProductID, ProductName, UnitsInStock, ReorderLevel from dbo.Products
where UnitsInStock <= ReorderLevel;


-- 23.
Select ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from dbo.Products
where UnitsInStock + UnitsOnOrder <= ReorderLevel and Discontinued = 0;

-- 24. 
Select CustomerID, CompanyName, Region from Customers
Order By
CASE
	When Region is null then 1
	else 0
END, Region;

-- 25. 
select TOP 3 ShipCountry, AverageFreight = avg(Freight) from Orders
Group By ShipCountry
Order By AverageFreight desc;

-- 26. 
Select TOP 3 ShipCountry, AverageFreight = avg(Freight) from Orders
where OrderDate >= '2015-01-01' and OrderDate < '2016-01-01'
Group By ShipCountry
Order by AverageFreight desc;

-- 27. 
Select Top 3 ShipCountry, AverageFreight = avg(Freight) from Orders
Where
	OrderDate between '20150101' and '20151231'
Group By ShipCountry
Order By AverageFreight desc;

select * from Orders
where year(OrderDate) = '2015'
order by OrderDate desc;

-- 28. 
SELECT Top 3
	ShipCountry, AverageFreight = avg(Freight)
From Orders 
where OrderDate >= Dateadd(yy, -1, (Select Max(OrderDate) from Orders))
Group by ShipCountry
Order by AverageFreight desc;


-- 29.
Select 
	Employees.EmployeeID, Employees.LastName, Orders.OrderID, Products.ProductName, OrderDetails.Quantity
From 
	Employees
Inner Join Orders
	On Employees.EmployeeID = Orders.EmployeeID
Inner Join OrderDetails
	On Orders.OrderID = OrderDetails.OrderID
Inner Join Products
	On OrderDetails.ProductID = OrderDetails.ProductID
Order by
	Orders.OrderID, Products.ProductID;

-- 30.
Select Customers_CustomerID  = Customers.CustomerID, Orders_CustomerID = Orders.CustomerID 
From Customers
left join Orders
	On Orders.CustomerID = Customers.CustomerID
Where OrderID is null;

-- 31. 
Select Customers.CustomerID, Orders.CustomerID 
From Customers
left join Orders
	On Orders.CustomerID = Customers.CustomerID
	and Orders.EmployeeID = 4
Where
	Orders.CustomerID is null
Order by
	Customers.CustomerID;

