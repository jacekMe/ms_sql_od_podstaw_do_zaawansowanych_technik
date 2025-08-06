USE [AdventureWorksLT2017]
GO

--======== JOIN CLAUSE ========--

-- 1. Znajdź top 3 klientów pod względem łącznej kwoty wydatków
SELECT TOP 3 C.FirstName, C.LastName, SUM(SOH.TotalDue) TotalAmount
FROM SalesLT.Customer C
    INNER JOIN SalesLT.SalesOrderHeader SOH ON SOH.CustomerID = C.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY TotalAmount DESC

-- 2. Znajdź top 5 modeli produktów sprzedanych (z największą liczbą sprzedanych ilości) w stanie 'California'
SELECT TOP 5 PM.Name, COUNT(SOD.OrderQty) SoldCount
FROM SalesLT.ProductModel PM
    INNER JOIN SalesLT.Product P ON P.ProductModelID = PM.ProductModelID
    INNER JOIN SalesLT.SalesOrderDetail SOD ON SOD.ProductID = P.ProductID
    INNER JOIN SalesLT.SalesOrderHeader SOH ON SOH.SalesOrderID = SOD.SalesOrderID
    INNER JOIN SalesLT.Address A ON A.AddressID = SOH.BillToAddressID
WHERE A.StateProvince = 'California'
GROUP BY PM.Name
ORDER BY SoldCount DESC


