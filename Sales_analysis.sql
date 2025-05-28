Create database company;
use company;
select *from sales;

-- Q1: Find all the orders shipped via 'economy' mode with a total amount greater than 25000;

select order_id from sales where Ship_mode='economy' and total_amount>25000;

-- Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

select* from sales where Category='Technology' and country='Ireland' and order_date>'01-01-2020';

-- Q3: List the top 10 most profitable sales transactions in descending order.

Select * from sales order by unit_profit desc limit 10;

Select * from sales order by unit_profit desc limit 10,20; -- --skip first 10 records and gives nxt 20 records

-- Q4: Find all customers whose name starts with 'j' and ends with 'n'.

select order_id,customer_name from sales where customer_name like 'j%n';

-- Q5: Retrive all the product names that contain 'Acco' anywhere in the name.

Select order_id,product_name from sales where product_name like '%acco%';

-- Q6: Get the top 5 cities with the highest total sales amount.

Select city,sum(total_amount) from sales group by city order by sum(total_amount) desc limit 5;
-- When aggregate functions are used it is better to use alias names
Select city,sum(total_amount) as total_sales from sales group by city order by total_sales desc limit 5;

-- Q7: Display the second set of 10 records for customer_name and total_amount in decreasing order.

select  customer_name,total_amount from sales order by total_amount desc  limit 10,10;

-- Q8: Find the total revenue,average unit cost, and total no of orders.

select sum(total_amount) as `Total Revenue` ,avg(unit_cost) as `Average Unit Cost` , count(order_id) as `Total Orders` from sales;

-- Q9: Count the no of unique regions.

Select count(distinct(region)) as Unique_Regions from sales;

-- Q10: Find the no of orders placed by each customer.

select customer_name , count(order_id) as order_count from sales group by customer_name order by order_count desc;

-- Q11: Rank 5 products based on total sales using RANK().

select product_name ,sum(Total_amount) as Total_Sales, RANK() over (order by sum(total_amount) desc) as Sales_Rank from sales group by product_name limit 5;


