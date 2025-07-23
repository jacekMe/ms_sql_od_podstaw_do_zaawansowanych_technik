USE [AdventureWorksLT2017]
GO


--======== MATHEMATICAL OPERATORS ========--

--==== ADDITION ====--
-- Oblicz pełną cenę produktu po doliczeniu opłaty manipluacyjnej w wysokości 5 jednostek
SELECT Name, ListPrice, ListPrice + 5 FinalPriceWithFee
FROM SalesLT.Product
WHERE ListPrice > 0

--==== SUBTRACTION ====--
-- Oblicz marżę zysku dla produktów
SELECT Name, ListPrice, StandardCost, ListPrice - StandardCost ProfitMargin
FROM SalesLT.Product

--==== MULTIPLICATION ====--
-- Oblicz cenę końcową dla zamówienia
SELECT OrderQty, UnitPrice, OrderQty * UnitPrice TotalPrice
FROM SalesLT.SalesOrderDetail
WHERE OrderQty > 1

--==== DIVISION ====--
-- Oblicz stosunek ceny katalogowej do kosztu standardowego dla każdego produktu
SELECT Name, ListPrice, StandardCost, 
    ListPrice / NULLIF(StandardCost, 0) PriceToCostRatio
FROM SalesLT.Product
WHERE ListPrice > 0 AND StandardCost > 0

--==== MODULO ====--
-- Znajdź produkty, których identyfikator jest liczbą parzystą
SELECT ProductID, Name
FROM SalesLT.Product
WHERE ProductID % 2 = 0
 
--==== MULTIPLICATION ====--
-- Oblicz kwadrat ceny katalogowej każdego produktu
SELECT Name, ListPrice,
    POWER(ListPrice, 2) ListPriceSquared
FROM SalesLT.Product
WHERE ListPrice > 0

