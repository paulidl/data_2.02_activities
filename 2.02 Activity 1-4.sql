-- 2.02 Activity 1: Simple queries
-- Keep working on the bank database. (In case you need to load data again, refer to files_for_lab to get the database.)

use bank;

-- 1. Select districts and salaries (from the district table) where salary is greater than 10000. 
-- Suggestion is to use the case study extended here (you have it already after getting the 2.01 activity) to work out which columns are required here. 
-- Return columns as district_name and average_salary.

select * from bank.district;
select A2 as district_name, A11 as average_salary from bank.district where A11 > 10000;

-- 2. Select those loans whose contract finished and were not paid.
-- Hint: You should be looking at the loan column and you will need the extended case study information to tell you which value of status is required.

select * from bank.loan;
select * from loan where status = "B";

-- 3. Select cards of type junior. Return just first 10 in your query.

select * from bank.card;
select * from bank.card where type = "junior" order by card_id asc limit 10;

-- 2.02 Activity 2: Simple queries

-- 1. Select those loans whose contract finished and not paid back. 
-- Return the debt value from the status you identified in the last activity, together with loan_id and account_id.

select * from bank.loan;
select loan_id, account_id, amount from bank.loan where status = "B";

-- 2. Calculate the urban population for all districts.
-- Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. Return columns as district_name and urban_population.

select * from bank.district;
select A2 as district_name, round(A10*A4/100) as urban_population from bank.district;

-- 3. On the previous query result - re-run it but filtering out districts where the rural population is greater than 50%.

select A2 as district_name, round(A10*A4/100) as urban_population from bank.district where A10<50;

-- 2.02 Activity 3: Simple queries

-- 1. Get all junior cards issued last year.
-- Hint: Use the numeric value (980000).

select * from bank.card;
select * from bank.card where type = "junior" and left(issued,2)=98;

-- 2. Get the first 10 transactions for withdrawals that are not in cash. 
-- You will need the extended case study information to tell you which values are required here, and you will need to refer to conditions on two columns.

select * from bank.trans;
select * from bank.trans where type = "VYDAJ" and operation = "VYBER KARTOU" order by trans_id asc limit 10;

-- 3. Refine your query from last activity on loans whose contract finished and not paid back - filtered to loans where they were left with a debt bigger than 1000. 
-- Return the debt value together with loan_id and account_id. Sort by the highest debt value to the lowest.

select * from bank.loan;
select loan_id, account_id, amount from bank.loan where status = "B" and (amount-payments) > 1000 order by (amount-payments) desc;

-- 2.02 Activity 4: Simple queries

-- 1. Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).

select * from bank.trans;
select max(amount) as biggest_transaction, min(amount) as smallest_transaction from bank.trans where amount > 0;

-- 2. Get account information with an extra column year showing the opening year as 'YY'. Eg., 1995 will show as 95.
-- Hint: Look at the first two characters of the string date in the account table.

select * from bank.account;
select *, left(date,2) as opening_year from bank.account;
