USE [AdventureWorksLT2017]
GO

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

