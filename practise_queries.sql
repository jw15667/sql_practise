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
