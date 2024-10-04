SELECT E.City AS [City]
FROM Employees AS E
WHERE E.City IS NOT NULL  

INTERSECT  

SELECT C.City AS [City]
FROM Customers AS C
WHERE C.City IS NOT NULL  


SELECT DISTINCT C.City AS [City]
FROM Customers AS C
WHERE C.City IS NOT NULL  
AND C.City NOT IN ( 
    SELECT E.City 
    FROM Employees AS E
    WHERE E.City IS NOT NULL
)
ORDER BY C.City;


SELECT DISTINCT C.City AS [City]
FROM Customers AS C
LEFT JOIN Employees AS E ON C.City = E.City 
WHERE E.City IS NULL 
AND C.City IS NOT NULL  
ORDER BY C.City;


SELECT P.ProductName AS [Product Name], SUM(OD.Quantity) AS [Total Order Quantity]
FROM Products AS P
JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID 
GROUP BY P.ProductName  
ORDER BY [Total Order Quantity] DESC;


SELECT C.City AS [Customer City], SUM(OD.Quantity) AS [Total Products Ordered]
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID 
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID  
JOIN Products AS P ON OD.ProductID = P.ProductID 
WHERE C.City IS NOT NULL  
GROUP BY C.City 
ORDER BY [Total Products Ordered] DESC;  


SELECT C.City AS [Customer City], COUNT(C.CustomerID) AS [Number of Customers]
FROM Customers AS C
WHERE C.City IS NOT NULL 
GROUP BY C.City  
HAVING COUNT(C.CustomerID) >= 2  
ORDER BY [Number of Customers] DESC;

SELECT C.City AS [Customer City], COUNT(DISTINCT OD.ProductID) AS [Number of Different Products Ordered]
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID  
JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID  
JOIN Products AS P ON OD.ProductID = P.ProductID  
WHERE C.City IS NOT NULL 
GROUP BY C.City  
HAVING COUNT(DISTINCT OD.ProductID) >= 2 
ORDER BY [Number of Different Products Ordered] DESC;  


SELECT C.CustomerID, C.City AS [Customer City], O.ShipCity AS [Ship City]
FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID  
WHERE C.City != O.ShipCity  
  AND C.City IS NOT NULL  
  AND O.ShipCity IS NOT NULL  
ORDER BY C.CustomerID;

WITH ProductCityQuantity AS (
    SELECT P.ProductID, P.ProductName, AVG(OD.UnitPrice) AS [Average Price], 
           C.City AS [Customer City], 
           SUM(OD.Quantity) AS [Total Quantity Ordered]
    FROM Products AS P
    JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID  
    JOIN Orders AS O ON OD.OrderID = O.OrderID 
    JOIN Customers AS C ON O.CustomerID = C.CustomerID  
    WHERE C.City IS NOT NULL 
    GROUP BY P.ProductID, P.ProductName, C.City 
)
SELECT TOP 5 PCQ.ProductName,  PCQ.[Average Price],  PCQ.[Customer City],  MAX(PCQ.[Total Quantity Ordered]) AS [Total Quantity Ordered]
FROM ProductCityQuantity AS PCQ
GROUP BY PCQ.ProductName, PCQ.[Average Price], PCQ.[Customer City]
ORDER BY [Total Quantity Ordered] DESC;


SELECT DISTINCT E.City AS [Employee City]
FROM Employees AS E
WHERE E.City IS NOT NULL  
  AND E.City NOT IN (
        SELECT DISTINCT O.ShipCity
        FROM Orders AS O
        WHERE O.ShipCity IS NOT NULL  
    );


	SELECT DISTINCT E.City AS [Employee City]
FROM Employees AS E
LEFT JOIN Orders AS O ON E.City = O.ShipCity  
WHERE E.City IS NOT NULL 
  AND O.ShipCity IS NULL; 


  WITH EmployeeMostOrders AS (
    SELECT TOP 1 E.City AS [Employee City], COUNT(O.OrderID) AS [Total Orders Sold]
    FROM Employees AS E
    JOIN Orders AS O ON E.EmployeeID = O.EmployeeID  
    WHERE E.City IS NOT NULL 
    GROUP BY E.City
    ORDER BY [Total Orders Sold] DESC  
),
CustomerMostQuantityOrdered AS (
    SELECT TOP 1 C.City AS [Customer City], SUM(OD.Quantity) AS [Total Quantity Ordered]
    FROM Customers AS C
    JOIN Orders AS O ON C.CustomerID = O.CustomerID 
    JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID 
    WHERE C.City IS NOT NULL 
    GROUP BY C.City
    ORDER BY [Total Quantity Ordered] DESC 
)
SELECT EO.[Employee City], CO.[Customer City]
FROM EmployeeMostOrders AS EO
JOIN CustomerMostQuantityOrdered AS CO ON EO.[Employee City] = CO.[Customer City]; 



WITH CTE AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY ContactName ORDER BY (SELECT NULL)) AS rn
    FROM Customers 
)
DELETE FROM CTE WHERE rn > 1;
