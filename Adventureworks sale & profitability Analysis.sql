create database Adventureworks;
use Adventureworks;
select * from [dbo].[AdventureWorks Sales Data 2022(1)];
select top 10 * from [dbo].[AdventureWorks Sales Data 2022(1)];
select sum(OrderQuantity) as Total_Quantity_Sold from [dbo].[AdventureWorks Sales Data 2022(1)];
select count(distinct OrderNumber) as Total_Orders from [dbo].[AdventureWorks Sales Data 2022(1)];
select top 10 ProductKey, sum(OrderQuantity) as Quantity_Sold from [dbo].[AdventureWorks Sales Data 2022(1)] 
group by ProductKey order by Quantity_Sold DESC;
select TerritoryKey, COUNT(OrderNumber) as Total_Orders from [dbo].[AdventureWorks Sales Data 2022(1)] group by TerritoryKey 
order by Total_Orders DESC;
select top 20 s.OrderNumber,p.ProductName,s.OrderQuantity from [dbo].[AdventureWorks Sales Data 2022(1)] s
inner join [dbo].[AdventureWorks Product Lookup] p on s.ProductKey = p.ProductKey;
select top 10 p.ProductName, SUM(s.OrderQuantity) as TotalSold from [dbo].[AdventureWorks Sales Data 2022(1)] s
inner join [dbo].[AdventureWorks Product Lookup] p on s.ProductKey = p.Productkey group by p.ProductName order by
TotalSold DESC;
SELECT TOP 10 * FROM [dbo].[AdventureWorks Product Lookup];
SELECT TOP 10 * FROM [dbo].[AdventureWorks Territory Lookup];
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'AdventureWorks Territory Lookup';
SELECT t.Country,COUNT(s.OrderNumber) as Total_Orders from [dbo].[AdventureWorks Sales Data 2022(1)] s INNER JOIN 
[dbo].[AdventureWorks Territory Lookup] t on s.TerritoryKey = t.SalesTerritoryKey GROUP BY t.Country ORDER BY Total_Orders DESC;
SELECT t.Country, sum(s.OrderQuantity) as Quantity_Sold FROM [dbo].[AdventureWorks Sales Data 2022(1)] s INNER JOIN 
[dbo].[AdventureWorks Territory Lookup] t ON s.TerritoryKey = t.SalesTerritoryKey GROUP BY t.Country ORDER BY Quantity_Sold DESC;
SELECT TOP 10 p.ProductName,t.Country, SUM(s.OrderQuantity) AS TotalSold FROM [dbo].[AdventureWorks Sales Data 2022(1)] s
INNER JOIN [dbo].[AdventureWorks Product Lookup] p ON s.ProductKey = p.ProductKey
INNER JOIN [dbo].[AdventureWorks Territory Lookup] t ON s.TerritoryKey = t.SalesTerritoryKey GROUP BY p.ProductName, t.Country
ORDER BY TotalSold DESC;
SELECT TOP 10 * FROM [dbo].[AdventureWorks Calendar Lookup];
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'AdventureWorks Calendar Lookup';
SELECT TOP 10
    p.ProductName,
    SUM(s.OrderQuantity) AS TotalSold
FROM [dbo].[AdventureWorks Sales Data 2022(1)] s
INNER JOIN [dbo].[AdventureWorks Product Lookup] p
    ON s.ProductKey = p.ProductKey
GROUP BY p.ProductName
ORDER BY TotalSold DESC;
SELECT
    t.Country,
    COUNT(DISTINCT s.OrderNumber) AS TotalOrders
FROM [dbo].[AdventureWorks Sales Data 2022(1)] s
INNER JOIN [dbo].[AdventureWorks Territory Lookup] t
    ON s.TerritoryKey = t.SalesTerritoryKey
GROUP BY t.Country
ORDER BY TotalOrders DESC;
SELECT TOP 10
    p.ProductName,
    t.Country,
    SUM(s.OrderQuantity) AS TotalSold
FROM [dbo].[AdventureWorks Sales Data 2022(1)] s
INNER JOIN [dbo].[AdventureWorks Product Lookup] p
    ON s.ProductKey = p.ProductKey
INNER JOIN [dbo].[AdventureWorks Territory Lookup] t
    ON s.TerritoryKey = t.SalesTerritoryKey
GROUP BY p.ProductName, t.Country
ORDER BY TotalSold DESC;
