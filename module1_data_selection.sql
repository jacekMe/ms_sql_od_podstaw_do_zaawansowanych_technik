USE [AdventureWorksLT2017]
GO


--======== SELECT ========--
-- 1. Wybierz wszystkie pola z tabeli 'SalesLT.Customer'

SELECT *
FROM SalesLT.Customer;

-- 2. Wybierz unikalne nazwy miast z tabeli 'SalesLT.Address'

SELECT DISTINCT City
FROM SalesLT.Address;

-- 3. Wybierz imię, nazwisko oraz adres e-mail pierwszych 10 klientów.
--    Wyświetl rezultaty jako, 'FirstName', 'LastName', 'Email'

SELECT TOP 10 FirstName, LastName, EmailAddress Email
FROM SalesLT.Customer;


--======== WHERE ========--
-- 1. Pobierz wszystkie adresy, które znajdują się w konkretnym stanie ("California")

SELECT *
FROM SalesLT.Address
WHERE StateProvince = 'California';

-- 2. Znajdź wszystkie produkty, których cena sprzedaży przekracza 1000, ale maksymalnie wynosi 2000

SELECT *
FROM SalesLT.Product
WHERE ListPrice > 1000 AND ListPrice <= 2000;

-- 3. Znajdź wszystkich klientów, którzy mają wypełnione pole 'MiddleName' i 'Suffix' (niepuste)

SELECT *
FROM SalesLT.Customer
WHERE MiddleName IS NOT NULL AND Suffix IS NOT NULL;

-- 4. Pobierz wszystkie zamówienia, których data zakończenia sprzedaży jest późniejsza niż data zamówienia

SELECT *
FROM SalesLT.SalesOrderHeader
WHERE ShipDate > OrderDate;

-- 5. Znajdź wszystkie produkty, które były na wyprzedaży w 2005 roku, co najmniej dzień

SELECT *
FROM SalesLT.Product
WHERE SellStartDate < '2006-01-01' AND (SellEndDate > '2005-01-01' OR SellEndDate IS NULL)


--======== ORDER BY ========--
-- 1. Sortowanie szczegółów zamówienia według ilości zamówionej w kolejności malejącej, zwracając informację
--    z kolumn 'SalesOrderID', 'OrderQty' oraz 'UnitPrice', tylko dla zamówień, które mają ilość zamówionych
--    produktów większą niż 5

SELECT SalesOrderID, OrderQty, UnitPrice
FROM SalesLT.SalesOrderDetail
WHERE OrderQty > 5
ORDER BY OrderQty DESC;

-- 2. Sortowanie zamówień według daty zamówienia 'OrderDate' w kolejności rosnącej, dodatkowo jeśli zamówienia
--    mają tą samą datę to posortujemy je według ceny całkowitej 'SubTotal' w kolejności malejącej

SELECT *
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate ASC, SubTotal DESC;

-- 3. Sortowanie produktów po cenie 'ListPrice', w celu znalezienia i zwrócenia tylko najtańszego

SELECT TOP 1 *
FROM SalesLT.Product
ORDER BY ListPrice ASC;