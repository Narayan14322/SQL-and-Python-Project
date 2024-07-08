
--Q1 .What are the total sales for each segment (Consumer, Corporate, Home Office)?

SELECT Segment, SUM(sale_price*quantity) AS Total_Sales
FROM df_orders
GROUP BY Segment;

/*
 Segment	Total_Sales
Corporate	3394916.10
Home Office	2076552.00
Consumer	5607860.10
 */


------------------------------------------------------------------------------------------------

--Q2 . Which products have the highest total sales?
--Ans- TEC-CO-10004722 ( 245056.00 )

SELECT product_id, SUM(sale_price*quantity) AS Total_Sales
FROM df_orders
GROUP BY product_id
ORDER BY Total_Sales DESC

-------------------------------------------------------------------------------------------------
--Q3. What is the total profit generated in each region (South, West, etc.)?

SELECT Region, SUM(Profit) AS Total_Profit
FROM df_orders
GROUP BY Region;
/*
Region	Total_Profit
East	58220.00
South	38011.50
West	62558.60
Central	46378.60
*/
-----------------------------------------------------------------------------------------------------------
--Q4. What is the average discount given for each product category (Furniture, Office Supplies, etc.)?

SELECT Category, AVG(Discount) AS Average_Discount
FROM df_orders
GROUP BY Category;
/*
Category	Average_Discount
Office Supplies	4.137985
Furniture	12.281612
Technology	15.888738
*/

-------------------------------------------------------------------------------------------------------------

--Q5.  How do the total sales trend over time (monthly or yearly)?

SELECT FORMAT([order_date], 'yyyy-MM') AS Order_Month, SUM(sale_price) AS Total_Sales
FROM df_orders
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY Order_Month;
/*
Order_Month	Total_Sales
2022-01	94712.50
2022-02	90091.00
2022-03	80106.00
2022-04	95451.60
2022-05	79448.30
2022-06	94170.50
2022-07	78652.20
2022-08	104808.00
2022-09	79142.20
2022-10	118912.70
2022-11	84225.30
2022-12	95869.90
2023-01	88632.60
2023-02	128124.20
2023-03	82512.30
2023-04	111568.60
2023-05	86447.90
2023-06	68976.50
2023-07	90563.80
2023-08	87733.60
2023-09	76658.60
2023-10	121061.50
2023-11	75432.80
2023-12	102556.10

*/

SELECT YEAR(order_date) AS Order_Year, SUM(sale_price) AS Total_Sales
FROM df_orders
GROUP BY YEAR(order_date)
ORDER BY Order_Year;
/*
Order_Year	Total_Sales
2022	1095590.20
2023	1120268.50

*/

----------------------------------------------------------------------------------------------------------------

--Q6.Which category have the highest profit margins?

SELECT category,sum(profit) as highest_profit 
FROM df_orders
group by category
order by highest_profit desc;
/*
category	    highest_profit
Technology	    76433.50
Furniture	    66480.70
Office Supplies	62254.50

*/
----------------------------------------------------------------------------------------------------------------


--Q7. What is the distribution of ship modes used for different segments exclude Nulls?

SELECT 
    segment, 
    [ship_mode], 
    COUNT(*) AS Number_Of_Orders
FROM 
    df_orders
	where ship_mode is not NULL
GROUP BY 
    Segment, 
    [ship_mode]


ORDER BY 
    Segment, 
    [ship_mode];

/*
segment	ship_mode	      Number_Of_Orders
Consumer	First Class	      769
Consumer	Same Day	      317
Consumer	Second Class	 1020
Consumer	Standard Class	 3081
Corporate	First Class	      485
Corporate	Same Day	      114
Corporate	Second Class	  609
Corporate	Standard Class	 1811
Home Office	First Class	      284
Home Office	Same Day	      112
Home Office	Second Class	  316
Home Office	Standard Class	 1070
*/

---------------------------------------------------------------------------------------------------------------------