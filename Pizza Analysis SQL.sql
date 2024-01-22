select * from pizza_sales;

-- Total Revenue: The sum of the total price of all pizza orders
select SUM(total_price) as Total_Revenue from pizza_sales;

-- Average order value: The average amount spent per order, calculated by dividing
-- the total revenue by the total number of orders

select SUM(total_price) / COUNT(distinct(order_id)) as Average_order_value from pizza_sales;

-- Total Pizzas sold:- The sum of quantites of all pizzas sold
select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

-- Total Orders:- The total number of orders placed.
select COUNT(distinct order_id) as Total_Orders from pizza_sales;

-- Average Pizzas per order:- The average number of pizzas sold per order, calculated by dividing 
-- the total number of pizzas sold by the total number of orders
select cast(cast(sum(quantity) as decimal(10, 2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10, 2)) as Avg_Pizza_Per_order
from pizza_sales;



Select  * from pizza_sales;

-- Daily Trend for total Orders
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(DW, order_date);

-- Hourly Trend for total Orders
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time);

-- Percentage of sales by pizza category
select pizza_category, sum(total_price) as Total_sales, SUM(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as PCT 
from pizza_sales 
group by pizza_category;
-- To filter according to month use
-- where month(order_date) = 1


-- Percentage of sales by Pizza size
select pizza_size, sum(total_price) as Total_sales, cast(SUM(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10, 2)) as PCT 
from pizza_sales 
group by pizza_size 
order by PCT DESC;

-- if we want to filter according to quarter
-- where datepart(quarter, order_date) = 1


select * from pizza_sales;

-- Total Pizzas sold by Pizza Category
select pizza_category, SUM(quantity) as Quantity
from pizza_sales
group by pizza_category;


-- Top 5 Best Sellers by total Pizzas sold:-
select Top 5 pizza_name, SUM(quantity) as Quantity
from pizza_sales
group by pizza_name
order by Quantity desc;

-- Bottom 5 Best Sellers by total Pizzas sold:-
select Top 5 pizza_name, SUM(quantity) as Quantity
from pizza_sales
group by pizza_name
order by Quantity ASC;