-- Retail Sales Analysis--
drop table if exists retail_sales;
create table retail_sales 
(
transactions_id	int primary key,
sale_date  date,
sale_time	time,
customer_id int,
gender varchar (15),
age int,
category varchar(15),
quantiy int,
price_per_unit float,
cogs float,
total_sale float

);

Select * from retail_sales;

Select couNT  (*) from retail_sales;

Select * from retail_sales
WHERE sale_date is NUlL
OR cogs IS NULL
OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE quantiy IS NULL
OR cogs IS NULL
OR total_sale IS NULL
OR price_per_unit IS NULL;

--data exploration--

--how many sale do we have?
Select count(*) as total_sales from retail_sales;

--hpow many cus we have?
Select count(DISTINCT customer_id) as total_sales from retail_sales;

--how many catagory?
SELECT count(DISTINCT category) as total_sales from retail_sales;

--DATA ANALYSIS
-- Q1.write quary to get all column for sale made on 2022-1-05
Select * from retail_sales where sale_date = '2022-11-05'

-- Q2. All transation where the category is clothing and qantity soled is more than in the month of nov-2022
Select  count(transactions_id)
from retail_sales where category = 'Clothing' 
and quantiy <10;

Select(transactions_id)
from retail_sales where category = 'Clothing' 
and quantiy <10;

Select (transactions_id)
from retail_sales where category = 'Clothing' and
quantiy < 10 and sale_date between 2022-11-01 and 2022-11-30;

Select (transactions_id)
from retail_sales where category = 'Clothing' ;

Select count(transactions_id)
from retail_sales where category = 'Clothing';

----real solution------
Select
*
from retail_sales WHERE category = 'Clothing' 
and to_char (sale_date,'YYYY-MM') = '2022-11'
and quantiy >= 4

-- Q3. Calculate the total sales of each category
Select
DISTINCT category, 
sum(total_sale)
from retail_sales
group by 1;

-- Q4. find the total no.of transection made by each gender in each category 
Select DISTINCT category , gender,
count(*) as total_no 
from retail_sales
group by 1 , 2;

-- Q5. find all the transections where total sales is greater than 100
Select *from retail_sales
WHERE total_sale >= 1000;

-- Q6. find the avg avg of customers who purchased items from the Beauty category
Select ROUND(avg (age),2) as avgage
from retail_sales where category='Beauty';

-- Q7. find the top 5 customers based on the highest total sales
Select customer_id, 
sum(total_sale) as total_sales
FROM retail_sales 
group by 1
order by 2 desc
limit 5;

-- Q8. find the no.of unique customers who purchased items from each category
Select category, 
count(DISTINCT customer_id) as unique_customers
FROM retail_sales 
group by 1;
