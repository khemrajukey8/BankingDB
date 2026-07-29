-- show databases;
-- create DATABASE BankingDB;
 -- USE bankingdb;
 CREATE TABLE Customers (
 CustomerID INT PRIMARY KEY,
 FirstName varchar(50),
 LastName varchar(50),
 Email varchar(100),
 Phone varchar(15),
 AccountCreationDate date
 );
 
 describe Customers;
 
 select* from Customers;
 
 Create table accounts (
 AccountID INT,
 AccountType varchar(50),
 Balance DECIMAL (10,2)
 );
 desc accounts;
 
 create table Trasaction (
 TrasactionID INT,
 TrasactionDate DATE,
 Amount DECIMAL (10,2),
 TrasactionType varchar(20)
 );
 
 desc Trasaction;
 ALTER TABLE Trasaction
RENAME TO Transaction;

create table Branches (
BranchID INT ,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);

 desc Branches;
 
 create table Acccountbranches (
 AssignmentDate DATE 
 );
 
 CREATE TABLE Loans (
 LoanID INT,
 LoanAmount decimal(10,2),
 InterestRate decimal(5,2),
 StartDate DATE ,
 EndDate DATE 
 );
 desc Loans;
 
 
 
 
 
 