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


--======== TEXT VALUE FUNCTIONS ========--

--==== LEN ====--
-- Zwraca długość łańcucha znaków
SELECT LEN('Hello World')

--==== LEFT ====--
-- Zwraca określoną liczbę znaków z lewej strony łańcucha znaków
SELECT LEFT('Hello World', 7)

--==== RIGHT ====--
-- Zwraca określoną liczbę znaków z prawej strony łańcucha znaków
SELECT RIGHT('Hellow World', 9)

--==== UPPER ====--
-- Konwertuje łańcuch znaków na wielkie litery
SELECT UPPER('hello world')

--==== LOWER ====--
-- Konwertuje łańcuch znaków na małe litery
SELECT LOWER('HELLO WORLD')

--==== SUBSTRING ====--
-- Zwraca część łańcucha znaków rozpoczynając od określonej pozycji i o określonej długości
SELECT SUBSTRING('Hello World', 7, 5)

--==== REPLACE ====--
-- Zamienia wystąpienia określonego fragmentu łańcucha znaków na inny fragment
SELECT REPLACE('Hello World Hello', 'Hello', 'Hi')
--==== TRIM ====--
-- Usuwa spacje z początku i końca łańcucha znaków
SELECT TRIM('     Hello World    ')

--==== CONCAT ====--
-- Łączy dwa lub więcej łańcuchów znaków
SELECT CONCAT('Hello', ' ', 'World')

--==== CHARINDEX ====--
-- Zwraca pozycję określonego fragmentu w łańcuchu znaków
SELECT CHARINDEX('ld', 'Hello World')
-- jeżeli szukana fraza nie zostanie znaleziona, zapytanie zwróci 0
SELECT CHARINDEX('Yo', 'Hello World')


--======== TASKS - TEXT VALUE FUNCTIONS ========--

-- 1. Zwróć informacje: Imię, Nazwisko oraz inicjały osób 
SELECT FirstName, LastName, LEFT(FirstName, 1) + LEFT(LastName, 1) Initials
FROM SalesLT.Customer

-- 2. Stwórz zapytanie SQL, które wykorzystując kolumnę EmailAddress, zwróci jedynie część adresu emial, która
--    znajduje się przed znakiem '@' 
SELECT LEFT(EmailAddress, CHARINDEX('@', EmailAddress) -1) UserName
FROM SalesLT.Customer

-- 3. Napisz zapytanie SQL, które zwróci identyfikator produktów oraz ich opisy. Pod warunkiem, że długość
--    opisu przekracza 20 znaków i jednocześnie nie zawiera znaku zapytania '?'
SELECT ProductDescriptionID, [Description]
FROM SalesLT.ProductDescription
WHERE LEN([Description]) > 20 AND CHARINDEX('?', [Description]) = 0


--======== TIME AND DATA OPERATIONS ========--

--==== GETDATE ====--
-- zwraca bieżącą datę i czas
SELECT GETDATE()

--==== DATEADD ====--
-- dodaje określoną liczbę jednostek (dni, miesięcy, lat itp.) do określonej daty
SELECT DATEADD(DAY, 8, GETDATE())
-- możemy również podać wartość ujemną, która pozwala na odjęcie określoną liczbę jednostek od określonej daty
SELECT DATEADD(MONTH, -8, GETDATE())
-- jednostki, które można wybrać to
-- year, quarter, month, day, week, weekday, hour, minute, second, millisecond, microsecond, nanosecond

--==== DATEDIFF ====--
-- oblicza różnicę między dwiema datami w określonych jednostkach
SELECT DATEDIFF(DAY, '2025-06-01', '2025-07-27')

--==== DATEPART ====--
-- pobiera określoną część daty lub czasu, np. dzień, miesiąc, rok, itp.
SELECT DATEPART(MONTH, GETDATE())
-- alternatywa
SELECT  YEAR(GETDATE()) Year,
        MONTH(GETDATE()) Month,
        DAY(GETDATE()) Day

--==== CONVERT ====--
-- konwertuje wartości jednego typu danych na inne, na przykład z daty na ciąg znaków
SELECT CONVERT(VARCHAR, GETDATE(), 120)
-- liczba '120' jest kodem formatu daty używanym w funkcji CONVERT

--==== FORMAT ====--
-- umożliwia formatowanie dat i czasów zgodnie z określonym wzorcem
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm')


--======== TASKS - TIME AND DATA OPERATIONS ========--

-- 1. Obliczanie opóźnienia dostawy zamówienia, różnica między datą zamówienia, a datą dostawy w dniach
SELECT SalesOrderID, OrderDate, ShipDate, DATEDIFF(DAY, OrderDate, ShipDate) DeliveryDelaysInDays
FROM SalesLT.SalesOrderHeader

-- 2. Napisz zapytanie, które zwróci zamówienia z czerwca 2008
SELECT *
FROM SalesLT.SalesOrderHeader
WHERE YEAR(OrderDate) = 2008 AND MONTH(OrderDate) = 6

-- 3. Napisz zapytanie, które zwróci nazwę zamówienia w formacie
--    <SalesOrderNumber>-<OrderDate:yyyyMMdd>
SELECT SalesOrderNumber, OrderDate, CONCAT(SalesOrderNumber, '-', CONVERT(VARCHAR, OrderDate, 112)) OrderNrDate
FROM SalesLT.SalesOrderHeader

SELECT SalesOrderNumber, OrderDate, CONCAT(SalesOrderNumber, '-', FORMAT(OrderDate, 'yyyyMMdd')) OrderNrDate
FROM SalesLT.SalesOrderHeader

SELECT SalesOrderNumber, OrderDate, SalesOrderNumber + '-' + FORMAT(OrderDate, 'yyyyMMdd') OrderNrDate
FROM SalesLT.SalesOrderHeader


--======== CONDITIONAL FUNCTIONS ========--

--==== ISNULL ====--
/*
zwraca wartość podaną jako pierwszy argument, jeśli nie jest ona NULL, w przeciwnym wypadku zwraca wartość
podaną jako drugi argument
*/
SELECT ISNULL(NULL, 1) Result

SELECT ISNULL(MiddleName, 'n/a') MiddleName
FROM SalesLT.Customer

--==== COALESCE ====--
-- zwraca pierwszy niepusty argument, jesli wszystkie argumenty są puste, zwraca NULL
SELECT COALESCE(Title, MiddleName, 'n/a') [COALESCE]
FROM SalesLT.Customer

--==== NULLIF ====--
-- zwraca wartość NULL, jeśli dwa argumenty są równe, w przeciwnym razie zwraca pierwszy argument
SELECT NULLIF(1, 1) Result
SELECT NULLIF(1, 2) Result

--==== IIF ====--
-- skrót od 'Immediate If' - zwraca wartość w zależności od spełnienia warunku
SELECT IIF(1 > 0, 'True', 'False') Result

SELECT SalesOrderID, TotalDue, IIF(TotalDue > 10000, 'Big order', 'Small order') OrderSize
FROM SalesLT.SalesOrderHeader