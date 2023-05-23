--GLIMPSE OF THE DATASET AVAILABLE--
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowNum
    FROM MARKET_DATA
) AS Subquery
WHERE RowNum <= 10;

-- Q1. What is the average income of customers? and What is the average 
SELECT AVG(Income) AS AVG_INCOME
FROM MARKET_DATA

/*Q2. How many customers have complained in the last 2 years?
as DATASET CONTAIN 
*/
SELECT COUNT(ID) AS NO_OF_CUST
FROM MARKET_DATA 
WHERE Complain>=1

/*Q3. What is the highest income among the customers?*/
SELECT MAX(Income) AS HIGHEST_SALARY
FROM MARKET_DATA

/* Q4. How many customers have completed a college education?*/
SELECT COUNT(*) AS GRADUAT_CUST
FROM MARKET_DATA
WHERE Education='Graduation'

/*Q. What is the average income of customers who have made at least one complaint?*/
SELECT AVG(Income) AS ONE_COMPLAINT
FROM MARKET_DATA 
WHERE Complain>=1

/*Q5. How many customers are married?*/
SELECT COUNT(Marital_Status)
AS MARRIED_CUST
FROM MARKET_DATA
WHERE Marital_Status='Married'

/*Q6. What is the average number of children in customers' households?*/
SELECT AVG(Kidhome) AS AVG_NO_CHILDERN,COUNT(Kidhome) NO_OF_HOUSE_CHILD_1 
FROM MARKET_DATA 
WHERE Kidhome>=1

/*Q7. What is the average number of days since the last purchase for customers?
*/
SELECT AVG(Recency)
AS AVG_NO_DAYS
FROM MARKET_DATA

/*Q8.How many customers have made a complaint and accepted at least one marketing campaign?*/
SELECT COUNT(*)
AS NO_OF_CUST
FROM MARKET_DATA
WHERE Complain>=1 AND 
(AcceptedCmp1=1 OR AcceptedCmp2=1 OR AcceptedCmp3=1
OR AcceptedCmp4>=1 OR AcceptedCmp5=1 )

/*Q9.What is the total amount spent on wines by all customers?*/
SELECT SUM(MntWines) 
AS MONEY_ON_WINE
FROM MARKET_DATA

/*Q10.What is the average amount spent on fruits by customers who made a complaint?*/
SELECT AVG(MntFruits) 
AS AVG_AMOUNT
FROM MARKET_DATA
WHERE Complain=1

/*Q11.How many customers made more than five deals and purchases?*/
SELECT COUNT(*)
AS NO_OF_CUST
FROM MARKET_DATA
WHERE NumDealsPurchases>5 AND Response=1

/*Q12.How many customers made purchases through the web and catalogs?*/
SELECT COUNT(*)
AS NO_OF_CUS
FROM MARKET_DATA WHERE
NumWebPurchases>=1 AND NumCatalogPurchases>=1

/*Q13.What is the average number of store purchases for customers with an income above AVERAGE INCOME?*/
SELECT AVG(NumStorePurchases)
AS AVG_STORE_PURCHASE
FROM MARKET_DATA
WHERE Income>(SELECT AVG(Income) AS AVG_INCOME
FROM MARKET_DATA
)

/*Q14.How many customers accepted at least one marketing campaign AND  responded positively to the marketing campaign?*/
SELECT COUNT(*)
AS NO_OF_CUST
FROM MARKET_DATA
WHERE Response=1 and
(AcceptedCmp1=1 OR AcceptedCmp2=1 OR AcceptedCmp3=1
OR AcceptedCmp4>=1 OR AcceptedCmp5=1 )

/*Q15.What is the average income of customers who have made a complaint and accepted at least two marketing campaigns?*/
SELECT AVG(Income)
AS AVG_SALARY
FROM MARKET_DATA 
WHERE Complain>=1 AND
      (AcceptedCmp1 = 1 OR AcceptedCmp2 = 1 OR AcceptedCmp3 = 1 OR AcceptedCmp4 = 1 OR AcceptedCmp5 = 1)
  AND (AcceptedCmp1 = 1 OR AcceptedCmp2 = 1 OR AcceptedCmp3 = 1 OR AcceptedCmp4 = 1 OR AcceptedCmp5 = 1)
  AND (AcceptedCmp1 = 1 OR AcceptedCmp2 = 1 OR AcceptedCmp3 = 1 OR AcceptedCmp4 = 1 OR AcceptedCmp5 = 1)

/*Q16.What is the average number of web visits per month for customers who have a college education and are married?*/
SELECT AVG(NumWebVisitsMonth)
AS AVG_VISIT
FROM MARKET_DATA
WHERE Marital_Status='Married'AND Education='Graduation'

/*Q17.How many customers are there in each education level category AND AVERAGE SALARY?*/
SELECT Education,COUNT(*) As NO_OF_CUST
,AVG(Income) AS AVG_SALARY
FROM MARKET_DATA
GROUP BY Education

/*Q18.What is the average number of days since the last purchase for customers 
who have accepted the third marketing campaign but rejected the fourth campaign?*/
SELECT AVG(Recency) AS NO_OF_DAYS
FROM MARKET_DATA
WHERE (AcceptedCmp3=1 AND AcceptedCmp4=0)

/*Q19.What is the average income of customers who have made purchases from all product categories
(wines, fruits, meat products, fish products, sweet products, and gold products)?*/
SELECT AVG(Income) AS AVG_INCOME,
COUNT(*) AS NO_OF_CUST
FROM MARKET_DATA 
WHERE (MntFishProducts>0 AND MntFruits>0 AND MntGoldProds>0 AND MntMeatProducts>0 AND
MntSweetProducts>0 AND MntWines>0)

/*Q20.What is the average number of purchases from each marketing channel 
(web, catalog, store) for customers who have made at least one purchase?*/
SELECT NumWebPurchases, NumCatalogPurchases, NumStorePurchases, 
AVG(NumWebPurchases + NumCatalogPurchases + NumStorePurchases) AS AveragePurchases
FROM MARKET_DATA
WHERE NumWebPurchases > 0 OR NumCatalogPurchases > 0 OR NumStorePurchases > 0
GROUP BY NumWebPurchases, NumCatalogPurchases, NumStorePurchases;

