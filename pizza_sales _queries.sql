--view the data
SELECT * FROM pizaa_sales;

--Total Revenue: the sum of total price of all pizza orders.
SELECT SUM(total_price) AS Total_Revenue FROM pizaa_sales;

--Average order value: The average amount spent per order, calculated by divided the total revenue by the number of cost
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizaa_sales;

--Total Pizza Sold: The sum of the quantities of all pizzas sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizaa_sales;

--Total Ords: The total number of orders placed.
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizaa_sales;

--Average Pizza Per Order: The average number of pizzas sold per order,calcualated by dividing the total number of pizzas sold by the total number of orders
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizaa_sales;

-- Daily Trends for Total Orders
SELECT  TRIM(TO_CHAR (order_date,'DAY')) AS order_day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizaa_sales
GROUP BY TO_CHAR (order_date,'DAY')
ORDER BY TOTAL_ORDERs DESC;

--Monthly Trends for Total order
SELECT TRIM(TO_CHAR (order_date,'MONTH')) AS Month_Name , COUNT(DISTINCT order_id) AS Total_Orders
FROM pizaa_sales
GROUP BY TO_CHAR (order_date,'MONTH')
ORDER BY Total_Orders DESC ;

--Percentage  of sales by Pizza Category
SELECT pizza_category, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100 /
(SELECT SUM(total_price) FROM pizaa_sales) as Total_Sales_Percentage
FROM pizaa_sales
GROUP BY pizza_category;

-- Percentage of Sales of Pizza Size
SELECT pizza_size, SUM(total_price) AS Total_Sales,SUM(total_price)  * 100 /
(SELECT SUM(total_price) FROM pizaa_sales) AS Total_Sales_Percentage
FROM pizaa_sales 
GROUP BY pizza_size
ORDER BY Total_Sales_Percentage DESC

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold 
FROM pizaa_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC ;

--Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC 
LIMIT 5;

--Bottom 5 Pizza by Revenue
SELECT  pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5 ;

--Top 5 Pizzas by Quantity
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC 
LIMIT 5 ;

--Bottom 5 Pizzas by Quantity
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5 ;

--Top 5 Pizzas by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5 ;

--Bottom 5 Pizza  by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizaa_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5 ;
