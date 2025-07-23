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
 
--==== EXPONENTIATION ====--
-- Oblicz kwadrat ceny katalogowej każdego produktu
SELECT Name, ListPrice,
    POWER(ListPrice, 2) ListPriceSquared
FROM SalesLT.Product
WHERE ListPrice > 0


--======== MATHEMATICAL FUNCTIONS ========--

--==== ABS ====--
-- Zwraca wartość bezwzgledną danej liczby
SELECT ABS(-10) absolute_value

--==== ROUND ====--
-- Zaokrągla daną liczbę do określonej liczby miejsc po przecinku
SELECT ROUND(3.14159, 2) rounded_value

--==== CEILING ====--
-- Zaokrągla daną liczbę w górę do najbliższej liczby całkowitej
SELECT CEILING(4.3) rounded_up_value

--==== FLOOR ====--
--  Zaokrągla daną liczbę w dół do najbliższej liczby całkowitej
SELECT FLOOR(4.7) rounded_down_value

--==== SQRT ====--
-- Zwraca pierwiastek kwadratowy dane liczby
SELECT SQRT(25) square_root

--==== EXP ====--
-- Podnosi liczbę 'e' do potęgi danej liczby
SELECT EXP(2) exponentiation

--==== LOG ====--
-- Zwraca logarytm naturalny danej liczby
SELECT LOG(10) natural_logarithm

--==== POWER ====--
-- Podnosi podaną liczbę do określonej potęgi
SELECT POWER(2, 3) result

--==== SIGN ====--
-- Zwraca znak danej liczby
SELECT SIGN(3240) sign_value


