CREATE TABLE categories (
    categoryID INT PRIMARY KEY,
    categoryName VARCHAR(255),
    description TEXT
);

CREATE TABLE customers (
    customerID CHAR(5) PRIMARY KEY,
    companyName VARCHAR(255),
    contactName VARCHAR(255),
    contactTitle VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    employeeName VARCHAR(255),
    title VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    reportsTo INT REFERENCES employees(employeeID)
);

CREATE TABLE order_details (
    orderID INT,
    productID INT,
    unitPrice DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    PRIMARY KEY(orderID, productID)
);

CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    customerID CHAR(5) REFERENCES customers(customerID),
    employeeID INT REFERENCES employees(employeeID),
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipperID INT,
    freight DECIMAL(10,2)
);

CREATE TABLE products (
    productID INT PRIMARY KEY,
    productName VARCHAR(255),
    quantityPerUnit VARCHAR(255),
    unitPrice DECIMAL(10,2),
    discontinued INT,
    categoryID INT REFERENCES categories(categoryID)
);

CREATE TABLE shippers (
    shipperID INT PRIMARY KEY,
    companyName VARCHAR(255)
);

SELECT 
    orders.orderID, orders.customerID, orders.employeeID, 
    orders.orderDate, orders.requiredDate, orders.shippedDate, 
    orders.shipperID, orders.freight, order_details.productID,
    order_details.unitPrice, order_details.quantity, 
    order_details.discount, customers.companyName, 
    customers.contactName, customers.contactTitle, 
    customers.city AS customerCity, customers.country AS customerCountry,
    employees.employeeName, employees.title, 
    employees.city AS employeeCity, employees.country AS employeeCountry,
    employees.reportsTo, categories.categoryID, categories.categoryName, 
    categories.description, products.productName, 
    products.quantityPerUnit, products.unitPrice AS productUnitPrice, 
    products.discontinued, shippers.companyName AS shipperCompany
FROM orders
JOIN order_details ON orders.orderID = order_details.orderID
JOIN customers ON orders.customerID = customers.customerID
JOIN employees ON orders.employeeID = employees.employeeID
JOIN products ON order_details.productID = products.productID
JOIN categories ON products.categoryID = categories.categoryID
JOIN shippers ON orders.shipperID = shippers.shipperID;


CREATE TABLE joined_data (
    orderid INT,
    customerid CHAR(5),
    employeeid INT,
    orderdate DATE,
    requireddate DATE,
    shippeddate DATE,
    shipperid INT,
    freight DECIMAL(10,2),
    productid INT,
    unitprice DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    companyname VARCHAR(255),
    contactname VARCHAR(255),
    contacttitle VARCHAR(255),
    customercity VARCHAR(255),
    customercountry VARCHAR(255),
    employeename VARCHAR(255),
    title VARCHAR(255),
    employeecity VARCHAR(255),
    employeecountry VARCHAR(255),
    reportsto INT,
    categoryid INT,
    categoryname VARCHAR(255),
    description TEXT,
    productname VARCHAR(255),
    quantityperunit VARCHAR(255),
    productunitprice DECIMAL(10,2),
    discontinued INT,
    shippercompany VARCHAR(255)
);

COPY joined_data
FROM 'C:\Users\Matthew Phelps\Desktop\Data Projects\Supplier SQL Project\Northwind Traders/joined_data.csv'
DELIMITER ',' 
CSV HEADER
NULL 'NULL';