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
 alter table customers
 add DateOfBirth DATE;
 desc customers;
 alter table customers modify Phone varchar(20);
 
 alter table accounts
 add constraint chk_MinBalance 
 check (Balance >=1000);
 
 drop table acccountbranches; 
 
 alter table accounts
 add CustomerID INT;
 
 alter table accounts
 add constraint  FK_Accounts_Customers
 foreign key (customerID)
 references customers(customerID);
 desc accounts;
 
 alter table accounts
 add constraint primary key (AccountID);
 desc accounts;
 
 alter table customers
 modify FirstName varchar(50) NOT NULL ;
 desc customers;

alter table customers
ADD constraint uq_email 
unique (email);

alter table branches
add constraint pk_branchID
primary key(BranchID);
desc branches;

alter table accounts
add BranchID INT;

 alter table accounts
 add constraint fk_accounts_branch
foreign key (BranchID)
references Branches(BranchID);

desc accounts;

 alter table transaction
 add AccountID INT;
 
 alter table transaction
 add constraint fk_transaction_accounts
 foreign key(AccountID)
 references accounts(AccountID);
 
 desc transaction;
 
 alter table loans
 add constraint pk_loanloans
 primary key(loanID);
 
 alter table loans
 add  CustomerID INT;
 
 alter table loans
 add constraint fk_loan_Customer
 foreign key(CustomerID)
 references customers(CustomerID);
 
 desc loans;
 
--  select
-- 	 constraint_name,
--      constraint_type
--      from information_schema.table_constraints
--      where table_schema = 'bankingdb'
--      and table_name = 'accounts';

 


 
 
 
 
 