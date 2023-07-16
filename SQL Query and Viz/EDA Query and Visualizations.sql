-- Exploratory Data Analysis Queries

--Daily Sales:
SELECT 
    DATE(orderdate) as SalesDay, 
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    SalesDay
ORDER BY 
    SalesDay;


--Monthly Sales:
SELECT 
    DATE_TRUNC('month', orderdate) as SalesMonth, 
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    SalesMonth
ORDER BY 
    SalesMonth;
	
--Yearly Sales:
SELECT 
    DATE_TRUNC('year', orderdate) as SalesYear, 
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    SalesYear
ORDER BY 
    SalesYear;

--Sales by category:
SELECT 
    categoryname, 
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    categoryname
ORDER BY 
    TotalSales DESC;


--Sales by country:
SELECT 
    customercountry,
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    customercountry
ORDER BY 
    TotalSales DESC;


--Sales by shipper company:
SELECT 
    shippercompany,
    SUM(unitprice * quantity) as TotalSales
FROM 
    joined_data
GROUP BY 
    shippercompany
ORDER BY 
    TotalSales DESC;


-- Best selling product:
SELECT 
    productname, 
    SUM(quantity) as TotalQuantity
FROM 
    joined_data
GROUP BY 
    productname
ORDER BY 
    TotalQuantity DESC
LIMIT 5;


-- Worst selling product:
SELECT 
    productname, 
    SUM(quantity) as TotalQuantity
FROM 
    joined_data
GROUP BY 
    productname
ORDER BY 
    TotalQuantity ASC
LIMIT 5;


-- Key Customers
SELECT 
    customerid, 
    COUNT(*) as NumberOfOrders, 
    SUM(unitprice * quantity) as TotalSpent
FROM 
    joined_data
GROUP BY 
    customerid
ORDER BY 
    TotalSpent DESC
LIMIT 20;
	
-- Consistency of shipping costs across providers:
SELECT 
    shippercompany, 
    AVG(freight) as AverageFreight
FROM 
    joined_data
GROUP BY 
    shippercompany
ORDER BY 
    AverageFreight;

