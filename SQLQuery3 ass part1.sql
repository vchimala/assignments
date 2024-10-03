SELECT COUNT(*) AS ProductCount
FROM Production.Product

select count(*) as productsubcategoryid
from Production.Product
where productsubcategoryid is not null

SELECT ProductSubcategoryID , COUNT(*) AS CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

SELECT COUNT(*) AS ProductsWithoutSubcategory
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory
GROUP BY ProductID

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

SELECT ProductID, Shelf,SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID, Shelf
HAVING SUM(Quantity) < 100

SELECT ProductID, AVG(Quantity) AS AverageQuantity
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID

SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf

SELECT Color, Class, AVG(ListPrice) AS AverageListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

SELECT CR.Name AS Country, SP.Name AS Province
FROM Person.CountryRegion AS CR
JOIN Person.StateProvince AS SP
ON CR.CountryRegionCode = SP.CountryRegionCode

SELECT CR.Name AS Country, SP.Name AS Province
FROM Person.CountryRegion AS CR
JOIN Person.StateProvince AS SP
ON CR.CountryRegionCode = SP.CountryRegionCode
WHERE CR.Name IN ('Germany', 'Canada')

