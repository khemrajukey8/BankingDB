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

select * from customers;

insert into customers (CustomerID , FirstName  ,LastName , Email , Phone , AccountCreationDate)
values (101, 'Rose' , 'Ukey' , 'khemrajukey7@gmail.com', '9552122251', '2003-04-15');
select* from customers;

update customers
set DateOfBIrth ='2003-10-05'
where customerID = '101';

update customers
set FirstName ='Khemraj'
where customerID = '101';

select*from customers;

insert into accounts
(AccountID ,customerID, AccountType, Balance)
 values (201,101,'saving',25000);
 select * from accounts;
 
 insert into customers 
values (102, 'Raj' , 'Raut' , 'khemrajukey8@gmail.com', '9552122251', '2003-04-15','1998-05-18');

insert into customers 
values (103, 'Nadira' , 'Ukey' , 'nadiraukey20@gmail.com', '9373248950', '2001-10-20','1998-10-20'),
(104, 'Komal' , 'Tekam' , 'komaltakem@gmail.com', '8408819296', '2015-04-15','2003-03-14');
select*from customers;

INSERT INTO branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Main Branch', 'Near Ganesh Bus Stand, Nagpur', '9565458237'),
(2, 'Civil Lines Branch', 'Civil Lines, Nagpur', '9373248950'),
(3, 'Dharampeth Branch', ' Dharampeth, Nagpur', '7122233447');

 
  INSERT INTO accounts
 (AccountID, AccountType, Balance, CustomerID, BranchID)
 VALUES
 (202, 'Current', 50000, 102, 2),
 (203, 'Saving', 15000, 103, 3);
 
 UPDATE accounts
SET BranchID = 1
WHERE AccountID = 201;

INSERT INTO loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(3001, 1500000.00, 10.12, '2026-01-15', '2046-01-15'),

(3002, 500000.00, 9.25, '2026-02-10', '2031-02-10'),

(3003, 300000.00, 7.80, '2026-05-05', '2030-05-05'),

(3004, 200000.00, 11.50, '2026-01-20', '2029-01-20');

update loans
set CustomerID = '101'
where loanID = 3001;

update loans
set CustomerID = '102'
where loanID = 3002;

update loans
set CustomerID = '103'
where loanID = 3003;

DELETE FROM loans
WHERE LoanID = 3004;

insert into transaction (TrasactionID, TrasactionDate, Amount , TrasactionType , AccountID)
values ( 401, '2026-05-18', '10000.10' , 'Deposit' , 201),
( 402, '2026-06-20' , '20000.00', 'Withdrawal' , 202),
( 403, '2026-06-25' , '30000.00' , 'Deposit' , 203);

UPDATE accounts 
SET 
    balance = balance + 5000
WHERE
    accountID = 202;

update accounts
set balance = '30000'
where accountID = 201;

UPDATE customers 
SET 
    email = 'khemraj.ukey7@gmail.com',
    phone = 9373248950
WHERE
    customerID = 101;
    
SELECT 
    customerID,FirstName, LastName, Phone
FROM
    customers;
    
SELECT 
    *
FROM
    accounts
WHERE
    AccountType = 'Saving';
    
SELECT 
    *
FROM
    accounts
WHERE
    balance <=30000 ;
    
insert into branches
values (4, 'sadar Branch', 'Medical Square ' , 8408819296);
 insert into accounts
 values (204, 'Current' ,25000, 104, 4);
 
 select * from accounts 
 where AccountType != 'saving';
 
 select * from accounts 
 where not AccountType = 'saving';
 
 select * from accounts
 where Balance >=30000 and AccountType = 'Saving' ; 
 
 select * from accounts
 where Balance >=30000 && AccountType = 'Saving' ; 
 
 

SELECT * FROM branches;
select * from accounts;
select * from loans;
select * from customers;
select * from transaction;



 


 


