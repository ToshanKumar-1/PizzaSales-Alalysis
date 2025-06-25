select * from pizzasales limit 100

-- Total Sales
SELECT SUM(TOTAL_PRIZE) AS TOTAL_REVENUE FROM PIZZASALES

-- Average Order Value
Select sum(total_prize) / count(distinct order_id) as avg_order_val from pizzasales

-- Total Pizzas sold
select sum(quantity) as total_pizza_sold from pizzasales

-- Total Orders Placed
select count(distinct order_id) as total_orders from pizzasales

-- Average Pizzas per order
select CAST(cast(sum(quantity) as decimal(10,2))/ 
cast(count(distinct order_id) as decimal(10,2)) AS DECIMAL(10,2)) as avg_pizza_per_order from pizzasales

-- charts requirements

-- daily trends for orders
SELECT TO_CHAR(order_date, 'Day') AS day_name,count(distinct order_id) as total_orders
FROM pizzasales
group by day_name
order by total_orders desc

-- Hourly Trend
SELECT EXTRACT(HOUR FROM order_time) AS order_hour,count(distinct order_id) as total_orders
FROM pizzasales
group by order_hour
order by order_hour

-- percentage of sales by pizza category
select pizza_category, sum(total_prize) as total_sales, sum(total_prize) * 100 / (select sum(total_prize) from pizzasales) 
as percentage_sales
from pizzasales 
group by pizza_category

-- percentage of sales by pizza size
select pizza_size, sum(total_prize) as total_sales, cast(sum(total_prize) * 100 / (select sum(total_prize) from pizzasales) as decimal(10,2))
as percentage_sales
from pizzasales 
group by pizza_size
order by percentage_sales desc

-- Total pizzas sold by pizza category
select pizza_category, sum(quantity) as total_pizzas
from pizzasales
group by pizza_category

-- Top 5 best seller by total pizzas sold
select pizza_name,sum(quantity) as total_pizzas_sold
from pizzasales
group by pizza_name
order by total_pizzas_sold desc
limit 5

-- Bottom 5 worst seller by total pizzas sold
select pizza_name,sum(quantity) as total_pizzas_sold
from pizzasales
group by pizza_name
order by total_pizzas_sold 
limit 5

