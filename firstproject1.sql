SELECT 
    *
FROM
    sales.supermarket;

SELECT 
    Category, SUM(Sales) AS total_sales
FROM
    sales.supermarket
GROUP BY Category
ORDER BY total_sales DESC;

SELECT 
    Subcat, SUM(Sales)
FROM
    sales.supermarket
WHERE
    Category = 'Eggs, Meat & Fish'
GROUP BY Subcat;

SELECT 
    Category, AVG(Profit / Sales) AS profit_margin
FROM
    sales.supermarket
GROUP BY Category
ORDER BY profit_margin DESC;

SELECT 
    Customer_Name,
    COUNT(*) AS number_of_visits,
    SUM(Sales) AS total_purchase
FROM
    sales.supermarket
GROUP BY Customer_Name
ORDER BY total_purchase DESC;

SELECT 
    Region, COUNT(Customer_Name), SUM(Sales) AS total_sales
FROM
    sales.supermarket
GROUP BY Region
ORDER BY total_sales DESC;

SELECT 
    a.Subcat, a.total_sales, a.margin
FROM
    (SELECT 
        Category,
            Subcat,
            SUM(Sales) AS total_sales,
            AVG(Profit / Sales) AS margin
    FROM
        sales.supermarket
    GROUP BY Category , Subcat
    ORDER BY Category) AS a
ORDER BY margin DESC;

SELECT 
    SUBSTRING(Order_Date, 4, 3) AS month, Category, Sales
FROM
    sales.supermarket
GROUP BY month , Category
ORDER BY Category , Sales;

SELECT DISTINCT
    Customer_Name
FROM
    sales.supermarket
WHERE
    Category = 'Eggs, Meat & Fish';


SELECT DISTINCT
    a.Customer_Name
FROM
    (SELECT 
        Customer_Name,
            SUBSTRING(Order_Date, 8, 2) AS year,
            COUNT(Customer_Name) AS total_orders
    FROM
        sales.supermarket
    GROUP BY Customer_Name , year
    ORDER BY year) AS a
WHERE
    a.total_orders > 45 IN (year='15' AND year='16' AND year='17' AND year= '18');

SELECT 
    m.City, s / n AS sales_per_customer
FROM
    (SELECT 
        City, COUNT(Customer_Name) AS n, SUM(Sales) AS s
    FROM
        sales.supermarket
    WHERE
        Subcat = 'Cakes' OR 'Chocolates'
    GROUP BY City) AS m
ORDER BY sales_per_customer DESC;





