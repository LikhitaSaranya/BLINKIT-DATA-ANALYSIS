SELECT * FROM BlinkIT_Data

SELECT COUNT(*) FROM BlinkIT_Data

UPDATE BlinkIT_Data
SET Item_Fat_Content = 
CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT DISTINCT(Item_Fat_Content) FROM BlinkIT_Data

SELECT SUM(Sales) AS TOTAL_SALES FROM BlinkIT_Data

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_MILLIONS FROM BlinkIT_Data

SELECT CAST(CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS VARCHAR)+'M' AS TOTAL_SALES_MILLIONS FROM BlinkIT_Data

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_MILLIONS FROM BlinkIT_Data
WHERE Item_Fat_Content = 'Low Fat'

SELECT CAST(SUM(Sales)/ 1000000 AS DECIMAL(10,2)) AS TOTAL_SALES_MILLIONS FROM BlinkIT_Data
WHERE Outlet_Establishment_Year = 2022



SELECT AVG(SALES) AS AVG_SALES FROM BlinkIT_Data

SELECT CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES FROM BlinkIT_Data

SELECT CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES FROM BlinkIT_Data
WHERE Outlet_Establishment_Year = 2022


SELECT COUNT(*) AS NO_OF_ITEMS FROM BlinkIT_Data

SELECT COUNT(*) AS NO_OF_ITEMS FROM BlinkIT_Data
WHERE Outlet_Establishment_Year = 2022


SELECT AVG(Rating) AS AVG_RATING FROM BlinkIT_Data

SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING FROM BlinkIT_Data


SELECT Item_Fat_Content, SUM(Sales) AS TOTAL_SALES From BlinkIT_Data GROUP BY Item_Fat_Content

SELECT Item_Fat_Content, SUM(Sales) AS TOTAL_SALES From BlinkIT_Data GROUP BY Item_Fat_Content ORDER BY TOTAL_SALES DESC

SELECT Item_Fat_Content, CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES 
From BlinkIT_Data GROUP BY Item_Fat_Content ORDER BY TOTAL_SALES DESC

SELECT Item_Fat_Content, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data GROUP BY Item_Fat_Content ORDER BY TOTAL_SALES DESC

SELECT Item_Fat_Content, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Fat_Content 
ORDER BY TOTAL_SALES DESC

SELECT Item_Fat_Content, 
         CAST(CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS varchar)+'K' AS TOTAL_SALES_THOUSANDS,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Fat_Content 
ORDER BY TOTAL_SALES_THOUSANDS DESC


SELECT Item_Type, 
         CAST(CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS varchar)+'K' AS TOTAL_SALES_THOUSANDS,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Type 
ORDER BY TOTAL_SALES_THOUSANDS DESC



SELECT Item_Type, 
         CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Type 
ORDER BY TOTAL_SALES DESC


SELECT TOP 5 Item_Type, 
         CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Type 
ORDER BY TOTAL_SALES DESC

SELECT TOP 5 Item_Type, 
         CAST(SUM(Sales)/1000 AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year = 2020
GROUP BY Item_Type 
ORDER BY TOTAL_SALES ASC

SELECT Outlet_Location_Type, Item_Fat_Content, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY TOTAL_SALES ASC

SELECT Outlet_Location_Type, Item_Fat_Content, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES
From BlinkIT_Data 
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY TOTAL_SALES ASC



SELECT Outlet_Location_Type,
        ISNULL([Low Fat], 0) AS Low_Fat,
		ISNULL([Regular], 0) AS Regular
FROM(
     SELECT Outlet_Location_Type, Item_Fat_Content,
           CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES
     FROM BlinkIT_Data
     GROUP BY Outlet_Location_Type, Item_Fat_Content
	) AS SourceTble
PIVOT(
      SUM(TOTAL_SALES)
	  FOR Item_Fat_Content IN ([Low Fat],[Regular])  
	  ) AS PivotTable
ORDER BY Outlet_Location_Type;



SELECT Outlet_Establishment_Year, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES
From BlinkIT_Data 
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC


SELECT Outlet_Establishment_Year, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year DESC



SELECT
    Outlet_Size,
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
	CAST(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS Sales_Percentage
From BlinkIT_Data 
GROUP BY Outlet_Size
ORDER BY TOTAL_SALES DESC




SELECT Outlet_Location_Type, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC



SELECT Outlet_Location_Type, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS Sales_Percentage,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC


SELECT Outlet_Location_Type, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS Sales_Percentage,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
WHERE Outlet_Establishment_Year=2022
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC



SELECT Outlet_Type, 
         CAST(SUM(Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
		 CAST(SUM(Sales)*100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS Sales_Percentage,
		 CAST(AVG(SALES) AS DECIMAL(10,1)) AS AVG_SALES,
		 COUNT(*) AS NO_OF_ITEMS,
		 CAST(AVG(Rating) AS DECIMAL(10,2)) AS AVG_RATING
From BlinkIT_Data 
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC