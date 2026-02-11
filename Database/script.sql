-- Firebird Database Script

-- Drop existing tables
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

-- Create tables
CREATE TABLE Users (
    UserID INTEGER NOT NULL PRIMARY KEY,
    UserName VARCHAR(50),
    UserEmail VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INTEGER NOT NULL PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductPrice NUMERIC(10, 2)
);

CREATE TABLE Orders (
    OrderID INTEGER NOT NULL PRIMARY KEY,
    UserID INTEGER,
    OrderDate TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create generators
CREATE SEQUENCE Users_Seq;
CREATE SEQUENCE Products_Seq;
CREATE SEQUENCE Orders_Seq;

-- Create triggers
CREATE TRIGGER Users_BI FOR Users
BEFORE INSERT AS
BEGIN
    IF (NEW.UserID IS NULL) THEN
        NEW.UserID = GEN_ID(Users_Seq, 1);
END;

CREATE TRIGGER Products_BI FOR Products
BEFORE INSERT AS
BEGIN
    IF (NEW.ProductID IS NULL) THEN
        NEW.ProductID = GEN_ID(Products_Seq, 1);
END;

CREATE TRIGGER Orders_BI FOR Orders
BEFORE INSERT AS
BEGIN
    IF (NEW.OrderID IS NULL) THEN
        NEW.OrderID = GEN_ID(Orders_Seq, 1);
END;