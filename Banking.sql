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
select FirstName, substring(FirstName,-2,-1) from customers;

select  CustomerID,CONCAT(SUBSTRING(FirstName, 1, 1), '. ', LastName) AS Full_Name 
from customers;
 -- Trim Function 
 select length("  Hello World  ");
 select length(trim("  Hello World  "));
 select length(trim(substring("Hello World",6)));
 
 -- Replace Function  is a case- sensitive Original , From str , To Str i work left to right 
 select replace("Mat mat Mat","M","C");
SELECT REPLACE('SQL Server','Server','Database');

-- Math Function     avg function
select avg (balance)from accounts
where AccountType ='saving' ;
 
 -- ROUND FUNCTION  
select round(avg(balance),3) from accounts
where AccountType='saving';
 
select round(balance)from accounts
where AccountType ='saving' ; 

-- CEIL FUNCTION 
select ceil(avg(balance))from accounts
where AccountType ='saving' ; 

-- FLOOR FUNCTION 
select floor(avg(balance))from accounts
where AccountType ='current' ;

select floor(amount)from transaction
where TrasactionType='deposit' ; 

select ceil(amount)from transaction
where TrasactionType='deposit' ; 

select avg(amount)from transaction
where TrasactionType='deposit' ;  

select  floor(avg(amount))from transaction
where TrasactionType='deposit' ; 

select  ceil(avg(amount)) as AverageDeposit from transaction
where TrasactionType='deposit' ; 

-- absolute function it remove the sign 
select abs(-2541); 
select abs(-41); 
select abs(2.541); 

-- MOD FUNCTION 
SELECT MOD(10, 3);
SELECT 10 % 3;
select (7/3);

-- POWER FUNCTION LIKE CUBE 
SELECT POWER(2, 3);

-- SQRT — Square root
SELECT SQRT(25);

-- Date and Time Fuction  
-- Now() function 
select now();
SELECT CURDATE();
SELECT curtime();
SELECT DATE('2026-08-12 08:30:15'); -- extract date from datetime
SELECT TIME('2026-08-12 08:30:15'); -- extract time from datetime

SELECT YEAR('2026-08-12'); -- Get YEAR 
SELECT MONTH('2026-08-12'); -- get month 
SELECT DAY('2026-08-12'); --     get day

select DateOfBirth,year(dateofbirth) as Year ,
month(dateofbirth) as Month ,
day(dateofbirth) as Day ,
dayname(dateofbirth) as DayName,
monthname(dateofbirth) as MonthName from customers; 
SELECT dayname('2026-08-12'); -- get dayname
SELECT MONTHNAME('2026-08-12'); -- get month name 

SELECT 
    FirstName,
    DOB,
    FLOOR(DATEDIFF(CURDATE(), DOB) / 365) AS Age
FROM customers;

--  fullname , dateofbirth , age 
select concat(FirstName," ",LastName) as FullName , DateOfBirth ,floor(datediff(curdate(), (dateofbirth)) /365) as age from customers;

-- dateADD function
select  concat(FirstName," ",LastName) as FullName , accountcreationdate , date_add(accountcreationdate,interval 365 day) as KYCRenewal from customers;

-- Count Function 
select count(*)  as Total_Customer from customers;
select count(Phone)  as Total_Customer from customers;

-- SUM FUNCTION 
select sum(Balance) as Total_Balance from accounts;
select sum(balance) as SavingBalance
from accounts
where AccountType='saving' ; 

-- Avg() Function
select avg(amount) as AverageAmount from transaction;
select avg(amount) as AverageDepositAmount from transaction
where trasactiontype ='deposit' ;

-- Max() Function
select max(balance) as MaximumBalance from accounts
where AccountType='saving';

select min(balance) as MaximumBalance from accounts
where AccountType='saving';

SELECT 
    AccountType, AVG(balance) AS AvgBalance
FROM
    accounts
GROUP BY AccountType;

SELECT 
    trasactionType, SUM(amount) AS Total_Amount
FROM
    transaction
GROUP BY TrasactionType;

SELECT 
    BranchID, AccountType,
    COUNT(Balance) AS TotalAccount,
    SUM(balance) TotalBalance,
    round(AVG(balance),2) AS AvgBalance
FROM
    accounts
GROUP BY BranchID,AccountType;

SELECT 
    BranchID, accounttype, COUNT(*)
FROM
    accounts
GROUP BY BranchID , accounttype
order by BranchID;

-- Having Clouse  

SELECT 
    BranchID, accounttype, COUNT(*) as NoOfAccounts
FROM
    accounts
GROUP BY BranchID , accounttype
having NoOfAccounts > 2 and AccountType='saving' ;

update customers
set AccountCreationDate ='2026-07-12'
where CustomerID='105';

update customers
set AccountCreationDate ='2026-08-17'
where CustomerID='107';

update customers
set AccountCreationDate ='2026-09-18'
where CustomerID='109';

-- Yearwise_Total_Number_Of_Account 
select year(AccountCreationDate) as Years , count(*) as Total_Account
from customers
group by Years
order by Years ;

-- today learn join and type of join in sql   
-- INNER JOIN  
SELECT 
    Customers.CustomerID,
    Customers.FirstName,
    Accounts.AccountType,
    Accounts.Balance
FROM Customers
INNER JOIN Accounts
    ON Customers.CustomerID = Accounts.CustomerID;
-- find all customer having loan with their name , interest rate and loan amount     
 
 select c.FirstName,c.LastName ,l.InterestRate , l.LoanAmount
 from customers c
 inner join loans l
 on c.CustomerID=l.CustomerID;
 
 select c.CustomerID ,concat( c.FirstName," ",c.LastName )as Full_Name ,l.InterestRate , l.LoanAmount
 from customers c
 inner join loans l
 on c.CustomerID=l.CustomerID;
 
 -- find the brwnch name for all the accountID 
 -- include accountID, accounttype and branchname, branchaddress
 select a.AccountID,a.AccountType ,b.BranchName,b.BranchAddress
 from accounts a
 inner join branches b
 on a.branchid =b.branchid
 where AccountType='saving';
 
 -- find all the customers (name,phone ) where account typ , balancee is deposit 
 select concat(c.firstname,c.lastname)as Full_Name ,c.Phone , a.Accounttype ,a. Balance
 from customers c 
 inner join accounts a 
 on c.CustomerID=a.CustomerID
 where AccountType='saving' and phone is not null;
 
 insert into customers(CustomerID,FirstName,LastName,Email,Phone,AccountcreationDate,DateOfBirth)
 values (111,'Vikram','Joshi','vikram@gmail.com','6545857595',NULL,'2000-01-12'),
 (112,'Anajli','Raut','anjalim@gmail.com','5465875952',NULL,'2003-05-12'),
 (113,'Suresh','Pawar','suresh@gmail.com','36545854595',NULL,'2002-06-10');
 
 insert into customers (CustomerID,FirstName,LastName,Email,Phone,AccountcreationDate,DateOfBirth)
 values (114,'Raj','Ukeyi','raj1@gmail.com','1545654585','2026-07-12','2000-01-12');
 
update customers
set phone = '6585459575'
where customerid ='113';

-- LEFT JOIN 
select c.FirstName,c.lastname,c.phone ,a.accounttype,a.balance
     from customers c
     left join accounts a
     on c.CustomerID=a.CustomerID;
   --   WHERE AccountType IS NOT NULL AND Balance IS NOT NULL;
 
 select c.FirstName,c.lastname,c.phone ,a.accounttype,a.balance
     from accounts a
     left join customers c
     on c.CustomerID=a.CustomerID;
     
     -- Right Join   
     
     select c.FirstName,c.lastname,c.phone ,a.accounttype,a.balance
     from customers c
     right join accounts a
     on c.CustomerID=a.CustomerID;
     
     insert into branches
     values(5,'Nashik Branch','College Road ,Nashik','6575849552');
     
     insert into accounts(accountid,accounttype,balance,customerid,branchid)
     values(211,'saving',20000,111,4),
     (212,'Cureent',35000,112,2);
     
update accounts
    set accounttype = 'Current'
    where customerid =112;
     
 insert into transaction 
 values (409,'2023-07-25',25000,'Withdrawal',204),
 (410,'2026-07-25',2000,'Deposit',205),
 (411,'2026-02-20',35000,'Withdrawal',204),
 (412,'2025-07-25',50000,'Deposit',207),
 (413,'2026-08-15',40000,'Withdrawal',206),
 (414,'2026-08-25',60000,'Deposit',208),
 (415,'2026-05-20',25000,'Withdrawal',205);
 
 insert into accounts
 values(213,'saving',20000,109,2);
 
 insert into accounts
 values(214,'saving',20000,107,2);
 
 insert into accounts
 values(215,'current',60000,101,1);
 
 -- 
 select c.CustomerID,concat(c.FirstName ," ", c.LastName) as FullName,a.AccountID,a.AccountType,a.Balance
 from customers c
 inner join accounts a
 on c.CustomerID=a.CustomerID
 ORDER BY c.CustomerID;
 


--  1. Display customers who do not have a Current account.
SELECT c.FirstName,c.LastName,a.Accounttype 
FROM Customers c
inner JOIN Accounts a
ON c.customerid = a.customerid
WHERE a.accounttype <> 'Current';

-- 2. Display Customername,Accountcreation date,Accounttype,Balancefor customers whose account was created in 2025.
select c.FirstName,c.LastName,c.AccountCreationDate,a.Accounttype,a.Balance 
from customers c
inner join accounts a
on a.CustomerID=c.CustomerID
where year(c.AccountCreationDate) = 2025; 

-- 3. Display:Customername,Accountcreation date,Accounttype and calculate the number of days since account creation.
select c.FirstName,c.LastName,c.AccountCreationDate,a.Accounttype,DATEDIFF(CURDATE(), c.AccountCreationDate) AS Number_Of_Day
from customers c 
inner join accounts a 
on c.CustomerID=a.CustomerID;

-- 4. Find the number of accounts held by each customer.
select c.CustomerID,c.FirstName,c.LastName,count(a.accountid) 
from customers c 
left join accounts a 
on a.customerid=c.CustomerID
group by c.CustomerID,c.FirstName;

-- 5. Find the total balance held by each customer.
select c.CustomerID,concat(c.FirstName," ",c.LastName) as Full_Name,sum(a.balance) as Total_Balance
from customers c 
left join accounts a 
on a.customerid=c.CustomerID
group by c.CustomerID,Full_Name;

-- 6. Find the number of customers for each account type.
select a.accounttype,count(c.CustomerID)
from customers c 
left join accounts a 
on a.CustomerID =c.CustomerID
group by a.AccountType;

-- 7. Find the total balance for each account type.
select accounttype , sum(balance) as Total_Balance 
from accounts
group by AccountType;
-- 8. Find the highest balance held by each account type.
select AccountType,max(Balance) as Highest_Balance
from accounts
group by AccountType;

-- 9. Find the number of customers for each branch.
SELECT a.BranchID, COUNT( c.CustomerID) AS NumberOfCustomers
FROM Customers c
inner JOIN Accounts a
ON c.CustomerID = a.CustomerID
GROUP BY a.BranchID;

-- 10. Find customers whose total account balance is greater than ₹40,000.
SELECT c.CustomerID,c.FirstName,c.LastName,
    SUM(a.Balance) AS TotalBalance
FROM Customers c
inner join Accounts a
    ON c.CustomerID = a.CustomerID
GROUP BY 
    c.CustomerID,c.FirstName,c.LastName
HAVING SUM(a.Balance) > 40000;
-- 11. Find customers who have more than one account.
select c.CustomerID ,c.FirstName,c.LastName ,count(a.AccountID)
from customers c
inner join  accounts a
on c. customerid=a.CustomerID
group by c.CustomerID ,c.FirstName,c.LastName 
having count(a.AccountID) > 1;

-- 12. Find customers who do not have an account.
select c.CustomerID,c.FirstName,c.LastName
from customers c
left join accounts a
on c.CustomerID=a.CustomerID
where a.CustomerID is null ;

-- 13. Find customers who do not have any loan.
select c.CustomerID,c.FirstName,c.LastName
from customers c
left join loans l
on c.CustomerID=l.CustomerID
where l.CustomerID is null ;

-- 14. Find customers who have never performed a transaction.
select c.CustomerID,concat(c.FirstName," ",c.LastName ) as FullName , count(t.AccountID) as NoOfTransaction
from customers c
inner join accounts a
on c.CustomerID=a.CustomerID
left join transaction t
on t.AccountID = a.AccountID
group by (c.CustomerID)
having NoOfTransaction = 0 ;


-- 15. Display all branches and their account count, including
-- branches that have zero accounts. 
SELECT b.BranchID,b.BranchName,COUNT(a.AccountID) AS TotalAccount
FROM Branches b
LEFT JOIN Accounts a
ON b.branchid = a.branchid
GROUP BY b.BranchID
having TotalAccount >2;

-- 16 Display all savings accounts customers along with their branches 

SELECT c.CustomerID,CONCAT(c.FirstName, ' ', c.LastName) AS FullName,a.Accounttype ,b.Branchname
FROM Customers c
left join  Accounts a
    ON c.CustomerID = a.CustomerID
inner join Branches b
    ON a.BranchID = b.BranchID
WHERE a.AccountType = 'Saving';

-- Full Outer Join in SQL 

select * from customers c 
left join accounts a 
on c.CustomerID =a.CustomerID
union 
select * from customers c 
right join accounts a 
on c.CustomerID =a.CustomerID;

-- SELF JOIN AND CREATE TABLE  

CREATE TABLE Employees( EmployeeID INT PRIMARY KEY,
EmployeeName varchar (50) NOT NULL,
ManagerID int ,
Department varchar(50),
salary DECIMAL(10,2),
JoiningDate DATE,
BranchID INT ,

foreign key (ManagerID)
references Employees(EmployeeID),

foreign key (BranchID)
references Branches(BranchID)
);
SELECT * FROM Employees;
alter table Employees
rename column salary to Salary ;

INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 1),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 2),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 3),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 4),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 5),
    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 1),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 2),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 3),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 4),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 5),
    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 1),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 2),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 3),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 4),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 5),
    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 1),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 2),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 3),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 4),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 5);
SELECT 
    e.EmployeeID,
    e.employeename AS Employee,
    m.employeename AS Manager,e.BranchID
FROM
    employees e
LEFT JOIN
    employees m 
ON e.ManagerID = m.employeeid;
     
SELECT 
    e.EmployeeID,
    e.employeename AS Employee,
    m.employeename AS Manager,b.BranchID,b.BranchName
FROM
    employees e
LEFT JOIN
    employees m 
ON e.ManagerID = m.employeeid
inner join branches b 
on b.BranchID=e.BranchID
order by EmployeeID asc;

-- display to report sneha verma 
-- find the all the employee who report to shena verma 
select e.EmployeeID,e.Department,e.EmployeeName as EmployeeName   
from employees e
left join employees m
on e.ManagerID =m.EmployeeID
where e.ManagerID = 4;


-- Find all customers having balance more than average balance  in saving account

select avg(Balance) as AverageBalance from accounts
where AccountType ='saving' ;

select  concat(c.firstname," ",c.lastname) as FullName   ,avg(a.balance) as Average,a.AccountType
from customers c 
left join accounts a 
on c.CustomerID=a.CustomerID
where a.AccountType = 'saving'
group by FullName 
having Average > 18375;

-- SUBQUERIS
-- SCALAR SUBQUERIS  
select concat(c.firstname," ",c.lastname) as FullName   ,avg(a.balance) as Average,a.AccountType
from customers c 
left join accounts a 
on c.CustomerID=a.CustomerID
where a.AccountType = 'saving' 
group by FullName
having avg(a.Balance) > ( select avg(Balance)  from accounts
where AccountType ='saving' );

select AccountID , CustomerID from accounts
where  Balance >
 ( select avg(Balance)  from accounts );
 
 select AccountID , CustomerID from accounts
 where AccountType = 'saving' and balance > (select avg(balance) from accounts
 where AccountType='saving') ;
 
 select c.FirstName, a.AccountID ,c.CustomerID from customers c
 inner join accounts a 
 on a.CustomerID = c.CustomerID
where  accounttype ='saving' and  a.Balance >
 ( select avg(Balance)  from accounts
  where accounttype ='saving');
  
  -- find the account having highest balance  
SELECT AccountID,customerid,balance
FROM Accounts
WHERE Balance = (
    SELECT MAX(Balance)
    FROM Accounts
);

-- find the customers whose year of birth is earlier than average year of birth pf all customers
SELECT FirstName,LastName,YEAR(DateOfBirth) AS BirthYear,dateofbirth
FROM Customers
WHERE ( year(DateOfBirth)) < (
    SELECT floor(AVG(YEAR(DateOfBirth)))
    FROM Customers
);

  
select * from employees;   
show databases;    
SHOW TABLES;
SELECT * FROM branches;
select * from accounts;
select * from loans;
select * from customers;
select * from transaction;  
 
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

-- Display accounts whose balance is not between ₹20,000 and ₹50,000. 
select * from accounts
where Balance not between 20000 and 50000;

-- Display all transactions except Deposit transactions.
select * from transaction
where TrasactionType <> 'deposit';  

-- Display customers whose first name contains the letter 'a' but does not start with 'A' 
SELECT *
FROM Customers
WHERE FirstName LIKE '%a%'
  AND FirstName NOT LIKE 'A%';
  
  -- Display customers who have phone numbers available but were created before 2025. 
 select * from customers
 where phone is not null and AccountCreationDate < 2025;
 
 -- Display first 3 Savings accounts after skipping the first 2 Savings accounts. 
 select * from accounts
 where AccountType ='saving'
 -- order by AccountID 
 limit 3 offset 2 ;
 
 -- Tricky Level 2
-- Display customers whose CustomerID is between 101 and 110 but not equal to 105 or 108
select * from customers
where CustomerID between 101 and 110 and CustomerID not in (105,108);

-- Display transactions whose amount is greater than ₹2000 but not equal to ₹5000.
select * from transaction
where Amount > 2000 and Amount not in (5000); 

-- Display customers whose last name starts with 'S' and email contains gmail but phone number is NULL. 
 select * from customers
 where LastName like 'B%' and Email like '%gmail%' and phone is null;
 
 -- Display accounts having balance between ₹15,000 and ₹60,000 but not belonging to Branch 2.
 select * from accounts
 where Balance between 15000 and 60000 and branchid not in (2);
  
  -- Display accounts whose AccountType is Savings or Salary but balance is not between ₹10,000 and ₹40,000. 
  select * from accounts
  where AccountType ='saving' or AccountType ='salary ' and Balance not between 10000 and 40000;
  
  -- Display customers whose DateOfBirth is after 1995 but before 2000.
  select * from customers
  where year(DateOfBirth) > 1995 and year(DateOfBirth )<2000;
  
  -- Display customers whose email contains gmail but FirstName does not contain 'a'. 
  select * from customers
  where email like '%gmail%' and FirstName not like '%a%';
  
  -- Display only the next 5 customers after skipping the first 4 customers 
  select * from customers
  limit 4,5;
  
-- Tricky Level 3 (Logical Confusion)
-- Display all Savings accounts having balance greater than ₹20,000 OR belonging to Branch 1.
-- (Students often mistakenly use AND.)
select * from accounts
where AccountType ='saving' and( Balance > 20000 or BranchID = 1 );


 
  
 

 





 


 


