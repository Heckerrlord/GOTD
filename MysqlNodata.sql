-- Create the database
CREATE DATABASE J6Store;

-- Use the database
USE J6Store;

-- Create the Accounts table
CREATE TABLE Accounts (
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Fullname VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Photo VARCHAR(50) NOT NULL,
    Token VARCHAR(50) NOT NULL,
    PRIMARY KEY (Username)
);

-- Create the Authorities table
CREATE TABLE Authorities (
    Id INT AUTO_INCREMENT NOT NULL,
    Username VARCHAR(50) NOT NULL,
    RoleId VARCHAR(10) NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the Categories table
CREATE TABLE Categories (
    Id CHAR(4) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Note VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    Id BIGINT AUTO_INCREMENT NOT NULL,
    OrderId BIGINT NOT NULL,
    ProductId INT NOT NULL,
    Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the Orders table
CREATE TABLE Orders (
    Id BIGINT AUTO_INCREMENT NOT NULL,
    Username VARCHAR(50) NOT NULL,
    CreateDate DATETIME NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the Products table
CREATE TABLE Products (
    Id INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Image VARCHAR(50) NOT NULL,
    Price FLOAT NOT NULL,
    Quality INT NOT NULL,
    CreateDate DATE NOT NULL,
    Available BIT NOT NULL,
    CategoryId CHAR(4) NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the Roles table
CREATE TABLE Roles (
    Id VARCHAR(10) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id)
);

-- Create the Students table
CREATE TABLE Students (
    email VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    marks FLOAT NOT NULL,
    gender BIT NOT NULL,
    country VARCHAR(2) NOT NULL,
    PRIMARY KEY (email)
);

