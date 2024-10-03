

SELECT P.ProductID, P.ProductName, O.OrderDate
FROM Products AS P
JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID
JOIN Orders AS O ON OD.OrderID = O.OrderID
WHERE O.OrderDate >= DATEADD(YEAR, -27, GETDATE())
ORDER BY O.OrderDate DESC;

SELECT TOP 5 C.postalcode, COUNT(OD.ProductID) AS TotalProductsSold
FROM Orders AS O
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
JOIN Customers AS C ON O.CustomerID = C.CustomerID
GROUP BY C.postalcode
ORDER BY TotalProductsSold DESC;

SELECT TOP 5 C.PostalCode, COUNT(OD.ProductID) AS TotalProductsSold
FROM Orders AS O
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
JOIN Customers AS C ON O.CustomerID = C.CustomerID
WHERE O.OrderDate >= DATEADD(YEAR, -27, GETDATE()) 
GROUP BY C.PostalCode
ORDER BY TotalProductsSold DESC

SELECT C.City, COUNT(C.CustomerID) AS NumberOfCustomers
FROM Customers AS C
GROUP BY C.City
ORDER BY NumberOfCustomers DESC

SELECT C.City, COUNT(C.CustomerID) AS NumberOfCustomers
FROM Customers AS C
GROUP BY C.City
HAVING COUNT(C.CustomerID) > 2 

SELECT C.ContactName,  O.OrderDate
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID  
WHERE O.OrderDate > '1998-01-01'  
ORDER BY O.OrderDate DESC

WITH MostRecentOrders AS 
(
    SELECT CustomerID, 
           MAX(OrderDate) AS MostRecentOrderDate
    FROM Orders
    GROUP BY CustomerID
)
SELECT C.ContactName, 
       MRO.MostRecentOrderDate
FROM Customers AS C
JOIN MostRecentOrders AS MRO 
ON C.CustomerID = MRO.CustomerID
ORDER BY MRO.MostRecentOrderDate DESC


SELECT C.ContactName, COUNT(OD.ProductID) AS ProductsBought
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID  
GROUP BY C.ContactName
ORDER BY ProductsBought DESC



SELECT C.CustomerID, COUNT(OD.ProductID) AS ProductsCount
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID  
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID 
GROUP BY C.CustomerID
HAVING COUNT(OD.ProductID) > 100  
ORDER BY ProductsCount DESC


SELECT S.CompanyName AS [Supplier Company Name], SH.CompanyName AS [Shipping Company Name]
FROM Suppliers AS S
CROSS JOIN Shippers AS SH  
ORDER BY S.CompanyName, SH.CompanyName


SELECT O.OrderDate AS [Order Date],  P.ProductName AS [Product Name]
FROM Orders AS O
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID 
JOIN Products AS P ON OD.ProductID = P.ProductID 



SELECT E1.EmployeeID AS [Employee 1 ID], 
       CONCAT(E1.FirstName, ' ', E1.LastName) AS [Employee 1 Name], 
       E2.EmployeeID AS [Employee 2 ID], 
       CONCAT(E2.FirstName, ' ', E2.LastName) AS [Employee 2 Name], 
       E1.Title AS [Title]  
FROM Employees AS E1
JOIN Employees AS E2 ON E1.Title = E2.Title  
WHERE E1.EmployeeID <> E2.EmployeeID 
ORDER BY E1.Title, E1.EmployeeID, E2.EmployeeID; 


SELECT M.EmployeeID AS [Manager ID], CONCAT(M.FirstName, ' ', M.LastName) AS [Manager Name], 
COUNT(E.EmployeeID) AS [Number of Employees]
FROM Employees AS M
JOIN Employees AS E ON M.EmployeeID = E.ReportsTo  
GROUP BY M.EmployeeID, M.FirstName, M.LastName 
HAVING COUNT(E.EmployeeID) > 2 
ORDER BY M.EmployeeID;


SELECT C.City AS [City], 
       C.CompanyName AS [Name], 
       C.ContactName AS [Contact Name], 
       'Customer' AS [Type]  
FROM Customers AS C

UNION ALL

SELECT S.City AS [City], 
       S.CompanyName AS [Name], 
       S.ContactName AS [Contact Name], 
       'Supplier' AS [Type]  
FROM Suppliers AS S

ORDER BY City, Type;