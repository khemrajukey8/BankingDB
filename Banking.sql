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
 alter table customers
 modify Phone varchar(20);
 
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
 
 update customers
 set AccountCreationDate = '2025-06-29'
 where CustomerID = '101';
 
 update customers
 set AccountCreationDate = '2025-08-17'
 where CustomerID = '102';
 
 update customers
 set AccountCreationDate = '2025-07-20'
 where CustomerID = '104';
 
 update customers
 set AccountCreationDate = '2025-09-15'
 where CustomerID = '103';
 
 update customers
 set phone = '9356854045'
 where CustomerID = '101';
 
 select * from customers
 
 where AccountCreationDate > '2025-7-1';
 
 select FirstName, LastName, Phone
 from customers
 where  phone IN ('9552122251','9373248950');
 
 select FirstName, LastName, Phone
 from customers
 where  phone ='9552122251'or phone='9373248950'or phone='9356854045';
 
 -- SELECT *
-- FROM customers
-- WHERE Phone = '9356854045';

-- SELECT FirstName, LastName, Phone
-- FROM customers
-- WHERE TRIM(Phone) IN ('9552122251', '9373248950', '9356854045');
-- BETWEEN  OPERATOR

 select AccountID,Balance from accounts
 where Balance between 20000 and 30000;
 
  -- LIKE OPERATOR
   -- % match any number of zero , even 
SELECT *FROM customers
WHERE FirstName LIKE 'K%';

SELECT *FROM customers
WHERE LastName LIKE '%Y';

-- "_" match exactly one character. 

select * from customers
where  LastName like '____';

-- SORTING DATA
 
SELECT * FROM accounts
ORDER BY Balance asc; 

select BranchID, BranchName from branches
order by BranchName ;

-- the accounts table according to customers balance from highest to lowest  
select * from accounts
order by Balance desc;

-- USING TWO COLUMN sorting 
select * from accounts
order by AccountType desc , Balance desc;

select distinct AccountType from accounts;
-- select accounttype from accounts
-- where AccountType ='saving';

select distinct TrasactionType, AccountID FROM transaction;

select * from customers
limit 3;
select * from customers
limit 1 offset 2;

select * from accounts
order by Balance desc
limit 2;

select* from accounts
order by Balance desc
limit 1 offset 2 ;

select* from accounts
order by Balance desc
limit 2,1 ; -- here 2 specifies the row to skip and 1 return result .

insert into customers (CustomerID, FirstName, LastName , Email,Phone, AccountCreationDate, DateOfBirth)
values (105, 'Rohit', 'Borkar','rohitj@gmail.com','9656587868', '2025-09-15','2004-1-15' ),
(106, 'Tanmay', 'Khotele','tanmayk@gmail.com',NULL, '2025-10-25','2003-1-15' ),
(107, 'Rupesh', 'Lanje','rupeshl@gmail.com','9865754885', '2025-08-15','2005-1-15' ),
(108, 'Pranit', 'Kamble','pranitkamble@gmail.com',NULL, '2025-07-20','2004-08-15' ),
(109, 'Harsh', 'Mallani','harshmj@gmail.com','6589754585', '2025-07-30','2003-10-30' ),
(110, 'Ritesh', 'Ramteke','riteshr@gmail.com',NULL, '2025-02-22','2003-02-15' );

select * from customers
where  phone is null;

select * from customers
where  phone is not null;

INSERT INTO accounts
 (AccountID, AccountType, Balance, CustomerID, BranchID)
 VALUES
 (205, 'Current', 40000, 105, 2),
 (206, 'Saving', 10000, 106, 3),
 (207, 'Current', 35000, 107, 2),
 (208, 'Saving', 15000, 108, 3),
 (209, 'Current', 5000, 109, 2),
 (210, 'Saving', 17000, 110, 1);
 
 
 insert into transaction (TrasactionID, TrasactionDate, Amount , TrasactionType , AccountID)
values ( 404, '2026-05-18', '10000.10' , 'Deposit' , 204),
( 405, '2026-07-18' , '15000.00', 'Withdrawal' , 205),
( 406, '2026-07-25' , '5000.00' , 'Deposit' , 206),
( 407, '2026-05-20' , '10000.00', 'Withdrawal' , 207),
( 408, '2026-04-12' , '27000.00' , 'Deposit' , 208);

INSERT INTO loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(3005, 100000.00, 11.12, '2026-02-22', '2045-2-22'),

(3006, 200000.00, 9.25, '2026-03-14', '2031-03-14'),

(3007, 350000.00, 7.80, '2026-05-20', '2030-05-20'),

(3008, 150000.00, 8.50, '2026-11-19', '2029-11-19');

update loans
set CustomerID = '105'
where LoanID = '3005';

update loans
set CustomerID = '106'
where LoanID = '3006';

update loans
set CustomerID = '107'
where LoanID = '3007';

update loans
set CustomerID = '108'
where LoanID = '3008';

INSERT INTO loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate,CustomerID)
VALUES
(3004, 150000.00, 06.12, '2026-03-22', '2045-3-22','104');

select AccountID, AccountType, Balance,
case 
when balance >= 30000 then 'highest value '
else 'low value'
end as 'category'
from accounts;

-- categorize the deposits in the transaction table as per conditions given
-- if above 10000 (include)  high amount 
-- if 5000(included) to 10000   medium amount
-- if upto 5000 low amount 
 -- for transaction type withdrawal   "not applicacable"
 select * ,
CASE
	WHEN TrasactionType = 'Withdrawal' THEN 'Not Applicable'
	when Amount>=10000 then 'High Amount'
	when Amount >= 5000 AND Amount < 10000 then 'Medium Amount'
	when Amount <5000 then 'low amount'
	end as TransactionStatus
	from  transaction;

select * ,
case 
	when TrasactionType = 'deposit' and amount >=10000 then 'High Amount'
    when TrasactionType = 'deposit' and amount >=5000 then 'medium Amount'
    when TrasactionType = 'deposit' and amount <5000 then 'low Amount'
    else "not applicable"
    end as "TransactionCategory"
    from transaction;
    
    

SELECT * FROM branches;
select * from accounts;
select * from loans;
select * from customers;
select * from transaction;  

select CustomerID,length(firstname ) ,upper(lastname) from customers;
select CustomerID,lower(firstname ) ,lower(lastname) from customers;
select CustomerID,char_length(lastname)  from customers;
select LastName,length(LastName ) from customers ;
select char_length("नागपूर"); -- gives o/p in number of character 
select length("नागपूर" );-- gives o/p in number of bytes
-- concate function
select CustomerID , concat(firstname ,' ', lastname) as FullName from customers;
-- substring function 
select substring(FirstName,1,5) from customers;

select  CustomerID,CONCAT(SUBSTRING(FirstName, 1, 1), '. ', LastName) AS Full_Name 
from customers;

 -- trim function
 




-- Display the CustomerID, FirstName and Email of customers whose AccountCreationDate is after 1-Jan-2025.
select customerID , FirstName , Email from customers
where AccountCreationDate > 2025-01-01;

-- Display all Savings accounts having balance greater than ₹20,000.
select * from accounts
where AccountType ='saving' and Balance > 20000;

-- Display customers whose Phone number is NOT NULL
select * from customers
where phone is not null;

-- Display distinct Account Types available in the Accounts table
select distinct AccountType from accounts;

-- Display customers whose FirstName starts with 'R'.
select * from customers
where FirstName like 'R%' ;

-- Display accounts having Balance between ₹20,000 and ₹60,000.
select * from accounts
where balance between 20000 and 60000;

-- Display all Deposit transactions whose amount is greater than ₹3000.
select * from transaction 
where TrasactionType ='deposit' and Amount > 3000;

--  Display customers whose CustomerID is IN (101,103,106,109).
select * from customers
where CustomerID in (101,103,106,109);

-- Display first 5 customers ordered by CustomerID
select * from customers
order by CustomerID
limit 5;

-- Display customers after skipping first 3 records.
select * from customers
limit 100 offset 3;

-- Level 2 (Medium) Display Savings accounts having balance between ₹20,000 and ₹80,000. 

SELECT 
    *
FROM
    accounts
WHERE
    AccountType = 'saving'
        AND Balance BETWEEN 20000 AND 8000;

--  Display customer names whose phone number is NULL and account was created after 2025-01-01.
select FirstName,LastName from customers
where phone is null and AccountCreationDate > 2025-01-01;

-- Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.

select * from customers
where FirstName like 'A%' or LastName like  'S%'; 

-- Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000.
select * from accounts
where AccountType ='saving' or 'salary' and Balance > 10000;

-- Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
select * from customers
where CustomerID in (101,102,105,109) and phone is not null ;

-- Level 3 (Intermediate)
-- Display customers whose FirstName starts with 'P' and Phone IS NULL.
select * from customers
where FirstName like 'T%' and phone is null ;  

-- Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
select * from accounts
where Balance  not between  20000 and 50000;  
 
 -- Display customers whose CustomerID is NOT IN (101,102,103).
 select * from customers
 where CustomerID NOT IN (101,102,103);
 
 -- Display transactions that are Withdrawal and amount is less than ₹5000
 select * from transaction
 where TrasactionType ='withdrawal' and Amount < 5000;
 
 -- Display customers whose email ends with gmail.com and phone number is available.
 select * from customers
 where email like '%gmail.com' and phone is not null ;
 
 -- Display distinct transaction types whose amount is greater than ₹5000.
 select distinct TrasactionType  from  transaction
 where Amount > 5000;
 
 -- Display all Savings accounts belonging to Branch 1 or Branch 3.
 select * from accounts
 where AccountType ='saving' and BranchID in (1,3);
  -- Display first 4 Deposit transactions after skipping first 2 deposits.
  select * from transaction
  limit 4 offset 2;
  
  -- Level 4 (Advanced Filtering)
-- Display customer names whose phone number is NULL OR email starts with s.
select FirstName,LastName from customers
where phone is null or Email like 'p%';

-- Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 1.
select * from accounts
where AccountType ='saving' and Balance >10000 and BranchID in (1) ;
-- Display Current accounts having balance between ₹40,000 and ₹1,00,000.  
select * from accounts
where AccountType='current' and Balance between 40000 and 100000;
 -- Display transactions whose amount is IN (2000,3000,5000,7000).
 select * from transaction
 where amount in (20000,30000,5000,10000);
 
 -- Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.
 select * from customers
 where (FirstName like 'R%' or FirstName like 'P%') and ( phone is not null and CustomerID > 103);
 
 -- Level 5 (Challenge Questions)
-- Display first 5 customers whose FirstName starts with A or R, ordered by CustomerID
select * from customers
where FirstName like 'R%' or FirstName like 'A%' 
order by CustomerID 
limit 5;

-- Display Savings and current accounts whose balance is greater than ₹15,000 and less than ₹60,000.
select * from accounts
where AccountType in('saving' , 'current') and Balance  > 15000 and  balance < 60000;

--  Display customers whose CustomerID is IN (101,103,105,107,109) and DateOfBirth is between 1994 and 2000.
select * from customers
where CustomerID in (101,103,105,107,109) and DateOfBirth between '1994-01-01' AND '2000-12-31';

-- Display transactions whose amount is greater than ₹2000 but less than ₹8000 and TransactionType is not Withdrawal.
select * from transaction
where Amount >2000 and Amount < 8000 and TrasactionType != 'withdrawal';

-- Display customers whose phone number is NULL or FirstName contains 'an'.
SELECT *
FROM Customers
WHERE Phone IS NULL
   OR FirstName LIKE '%an%'; 
-- Display distinct AccountTypes where balance is greater than ₹20,000.    
select DISTINCT AccountType
FROM Accounts
WHERE Balance > 20000;

-- Display customers after skipping first 2 records and display only the next 4 records.
select * from customers
limit 4 offset 2;

-- Display customers whose last name ends with 'kar' and email contains gmail.  
select * from customers
where LastName like '%kar' and  Email like '%gmail%';

-- Display accounts whose BranchID is IN (1,2) and balance is between ₹20,000 and ₹70,000.
select * from accounts 
where BranchID in (1,2) and Balance between 20000 and 70000 ;

-- Display all customers whose first name starts with S, phone number is not NULL, and account was created between 1-Jan-2025 and 31-Dec-2025.
select* from customers
where FirstName like 'K%' and phone is not null and AccountCreationDate between 2025-01-01 and 2025-12-31;  

-- Tricky Level 1
-- Display all customers whose first name starts with 'R' or 'S' but whose phone number is NULL.
select * from customers
where (FirstName like 'R%' or FirstName like 'S%' ) and phone is null;

-- Display all accounts that are not Savings accounts and have a balance greater than ₹30,000.
select * from accounts
where not AccountType ='SAVING'  AND Balance > 30000;

-- Display customers whose CustomerID is not 101, 102, or 103.
select * FROM customers
where CustomerID not in (101,102,103); 

-- Display customers whose email does not end with "gmail.com"
select * from customers
where  email not like '%gmail.com';


 





 


 


