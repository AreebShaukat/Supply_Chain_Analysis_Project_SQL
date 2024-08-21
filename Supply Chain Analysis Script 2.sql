-- Shipping Analysis:
-- What are the average shipping times for different shipping carriers?

SELECT `Shipping carriers`, AVG(`Shipping times`) AS Average_Shipping_Time
FROM supply_chain_data
GROUP BY `Shipping carriers`;

-- How do shipping costs vary based on the transportation modes and routes?
SELECT `Transportation modes`, Routes, AVG(`Shipping costs`) AS Average_Shipping_Cost
FROM supply_chain_data
GROUP BY `Transportation modes`, Routes;

-- What is the total shipping cost incurred for each product type?

SELECT `Product type`, SUM(`Shipping costs`) AS Total_Shipping_Cost
FROM supply_chain_data
GROUP BY `Product type`;


-- Cost Analysis:
-- What is the total manufacturing cost for each product type?

SELECT `Product type`, SKU, sum(`Manufacturing costs`) as Total_Manufacturing_cost
FROM supply_chain_data;

-- How do transportation costs contribute to the overall cost of goods sold?

SELECT 
    `Product type`, 
    SUM(`Shipping costs`) AS Total_Transportation_Costs,
    SUM(`Price` * `Number of products sold`) AS Total_Revenue,
    SUM(`Price` * `Number of products sold`) + SUM(`Shipping costs`) AS Total_Cost_of_Goods_Sold,
    (SUM(`Shipping costs`) / (SUM(`Price` * `Number of products sold`) + SUM(`Shipping costs`))) * 100 AS Transportation_Cost_Percentage
FROM supply_chain_data
GROUP BY `Product type`;

-- What is the total cost incurred for each product type including manufacturing, and transportation?

SELECT 
    `Product type`, 
    SUM(`Manufacturing costs`) AS Total_Manufacturing_Costs,
    SUM(`Shipping costs`) AS Total_Transportation_Costs,
    SUM(`Manufacturing costs`) + SUM(`Shipping costs`) AS Total_Cost_Incurred
FROM supply_chain_data
GROUP BY `Product type`;

-- What are the purchasing patterns of different customer demographics?

SELECT 
    `Customer demographics`,
    COUNT(*) AS Total_Orders,
    SUM(`Number of products sold`) AS Total_Products_Sold,
    SUM(`Price` * `Number of products sold`) AS Total_Revenue,
    AVG(`Number of products sold`) AS Average_Order_Size
FROM supply_chain_data
GROUP BY `Customer demographics`;

-- Which customer demographics contribute the most to the revenue?

SELECT 
    `Customer demographics`,
    SUM(`Price` * `Number of products sold`) AS Total_Revenue
FROM supply_chain_data
GROUP BY  `Customer demographics`
ORDER BY Total_Revenue DESC;

-- What products are popular among different customer demographics?

SELECT 
`Customer demographics`,
    `Product type`,
    SUM(`Number of products sold`) AS Total_Products_Sold
FROM supply_chain_data
GROUP BY `Customer demographics`, `Product type`
ORDER BY `Customer demographics`, Total_Products_Sold DESC;

