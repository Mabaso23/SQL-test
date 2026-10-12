
--1--
SELECT * FROM Customers, Orders, Suppliers;

--######################--
 

--2--
SELECT ContactName
FROM Customers
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactName ASC;

--######################--

--3--
SELECT * FROM Orders
WHERE OrderDate >= '1997-05-19'
AND OrderDate < '1997-05-20';

--######################--

--4--
SELECT CompanyName, Fax, Phone, Country, HomePage
FROM Suppliers
ORDER BY Country DESC, CompanyName ASC;

--######################--

--5--
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products
WHERE UnitsInStock = 0;

--######################--

--6--
SELECT ContactName, Address, City
FROM Customers
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

--######################--

--7--
SELECT AVG(UnitPrice) AS AveragePrice,
       MIN(UnitPrice) AS MinimumPrice,
       MAX(UnitPrice) AS MaximumPrice
FROM Products;

--######################--

--8--
SELECT FirstName, LastName
FROM Employees
WHERE ReportsTo IS NULL;

--######################--

--9--
SELECT ShipPostalCode, OrderID, OrderDate,
       RequiredDate, ShippedDate, ShipAddress
FROM Orders
WHERE ShipPostalCode LIKE '98124%';

--######################--

--10--
SELECT LastName, FirstName, City
FROM Employees
WHERE City <> 'Seattle';

--######################--

--11--
SELECT ContactName, ContactTitle, CompanyName
FROM Customers
WHERE ContactTitle NOT LIKE '%Sales%';

--######################--

--12--
SELECT CustomerID, SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200;

--######################--

--13--
SELECT S.SupplierID, S.CompanyName,
       C.CategoryName, P.ProductName, P.UnitPrice
FROM Products P
INNER JOIN Suppliers S
    ON P.SupplierID = S.SupplierID
INNER JOIN Categories C
    ON P.CategoryID = C.CategoryID;

--######################--

--14--
SELECT O.OrderID, E.FirstName, E.LastName
FROM Orders O
INNER JOIN Employees E
    ON O.EmployeeID = E.EmployeeID
WHERE O.ShippedDate > O.RequiredDate;

--######################--

--15--
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) < 200;

--######################--

--16--
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders
WHERE OrderDate > '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15;

--######################--

--17--
SELECT P.ProductName, P.UnitPrice, S.CompanyName
FROM Products P
INNER JOIN Suppliers S
    ON P.SupplierID = S.SupplierID;

--######################--

--18--
SELECT P.ProductName,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalCost
FROM [Order Details] OD
INNER JOIN Products P
    ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
HAVING SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) > 200;

--######################--

--19--
SELECT OrderID,
       COUNT(OrderID) AS NumberofOrders
FROM [Order Details]
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

--######################--

--20--
SELECT S.SupplierID, P.ProductName, S.CompanyName
FROM Products P
INNER JOIN Suppliers S
    ON P.SupplierID = S.SupplierID
WHERE S.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux'
)
ORDER BY S.SupplierID ASC;