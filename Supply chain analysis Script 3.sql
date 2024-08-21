-- Supplier and Transportation Optimization:
-- Which suppliers offer the most cost-effective transportation modes and routes?

SELECT 
    `Supplier name`,
    `Transportation modes`,
    Routes,
    AVG(`Shipping costs`) AS Average_Shipping_Cost
FROM supply_chain_data
GROUP BY `Supplier name`, `Transportation modes`, Routes
ORDER BY `Supplier name`, Average_Shipping_Cost;

-- Which suppliers have the shortest lead times and lowest defect rates?

SELECT 
    `Supplier name`,
    AVG(`Lead time`) AS Average_Lead_Time,
    AVG(`Defect rates`) AS Average_Defect_Rate
FROM supply_chain_data
GROUP BY `Supplier name`
ORDER BY Average_Lead_Time ASC, Average_Defect_Rate ASC;

-- Profitability Analysis:
-- What is the profitability of each product considering both revenue and costs?

SELECT 
    `Product type`,
    SUM(`Price` * `Number of products sold`) AS Total_Revenue,
    SUM(`Manufacturing costs` + `Shipping costs`) AS Total_Costs,
    SUM(`Price` * `Number of products sold`) - SUM(`Manufacturing costs` + `Shipping costs`) AS Profit
FROM supply_chain_data
GROUP BY `Product type`;

-- Can we identify products with low profitability?

SELECT 
    `Product type`,
    SUM(`Price` * `Number of products sold`) AS Total_Revenue,
    SUM(`Manufacturing costs` + `Shipping costs`) AS Total_Costs,
    SUM(`Price` * `Number of products sold`) - SUM(`Manufacturing costs` + `Shipping costs`) AS Profit,
    (SUM(`Price` * `Number of products sold`) - SUM(`Manufacturing costs` + `Shipping costs`)) / SUM(`Price` * `Number of products sold`) * 100 AS Profit_Margin
FROM supply_chain_data
GROUP BY `Product type`
order by Profit_Margin;
