

-- Q1.A What is the churn rate by Payment Method?

SELECT
PaymentMethod, 
sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 as TotalChurned,
count(*)*1.0 AS TotalCustomers,
cast(Round(sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 / count(*)*1.0 * 100 , 2) as decimal(4,2)) AS ChurnRate
FROM TeleChurnData
GROUP BY PaymentMethod;

-- Q1.B What is the churn rate by Contract Type?

SELECT
Contract, 
sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 as TotalChurned,
count(*)*1.0 AS TotalCustomers,
cast(Round(sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 / count(*)*1.0 * 100 , 2) as decimal(4,2)) AS ChurnRate
FROM TeleChurnData
GROUP BY Contract;

-- Q1.C What is the churn rate by Internet Service Type?

SELECT
InternetService, 
sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 as TotalChurned,
count(*)*1.0 AS TotalCustomers,
cast(Round(sum(case when Churn = 'Yes' then 1 else 0 end)*1.0 / count(*)*1.0 * 100 , 2) as decimal(4,2)) AS ChurnRate
FROM TeleChurnData
GROUP BY InternetService;

-- Q2.A What is the Average Tenure For Churned vs. Retained Customers

SELECT 
Churn,
CAST(AVG(tenure*1.0) AS Decimal(4,2)) as AverageTenrue
FROM TeleChurnData
GROUP BY Churn;

-- Q2.B What is the Average MonthlyCharge For Churned vs. Retained Customers

SELECT 
Churn,
CAST(AVG(MonthlyCharges*1.0) AS Decimal(4,2)) as AverageMonthlyCharge
FROM TeleChurnData
GROUP BY Churn;

-- Q3 Which Customers Combine a Month-to-month Contract With High Monthly Charges?

SELECT * FROM (
SELECT *, NTILE(4) over(ORDER BY MonthlyCharges DESC) as Ranking
FROM TeleChurnData
WHERE Contract = 'Month-to-month') as win
WHERE Ranking = 1;

-- Q4 Which Subscribed Services Are Most Associated with Churn?

SELECT 
PhoneService,
Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0 as TotalChurned,
Count(*)*1.0 as TotalCustomers,
cast(Round(Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0/Count(*)*1.0 *100, 2) as decimal(4,2)) AS ChurnRate 
FROM TeleChurnData 
WHERE PhoneService = 'Yes'
GROUP BY PhoneService;

SELECT 
InternetService,
Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0 as TotalChurned,
Count(*)*1.0 as TotalCustomers,
cast(Round(Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0/Count(*)*1.0 *100, 2) as decimal(4,2)) AS ChurnRate 
FROM TeleChurnData 
GROUP BY InternetService;

SELECT 
OnlineSecurity,
Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0 as TotalChurned,
Count(*)*1.0 as TotalCustomers,
cast(Round(Sum(CASE when Churn = 'Yes' Then 1 ELSE 0 END)*1.0/Count(*)*1.0 *100, 2) as decimal(4,2)) AS ChurnRate 
FROM TeleChurnData 
WHERE OnlineSecurity = 'Yes'
GROUP BY OnlineSecurity;

-- Q1. Diagnostic: Bucket customers Into Tenure Groups (0-12,13-24,25-48,48+ Months) And Compute Churn Rate Per Bucket

SELECT
buckets,
SUM(Case WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*1.0 AS Churned,
Count(*)*1.0 AS TotalCustomers,
Cast(Round(SUM(Case WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*1.0 / Count(*)*1.0 * 100,2) as Decimal(4,2)) AS ChurnRate
FROM(
SELECT *,CASE 
WHEN tenure >= 0 AND tenure <= 12 THEN '0-12'
WHEN tenure >= 13 AND tenure <= 24 THEN '13-24' 
WHEN tenure >= 25 AND tenure <= 48 THEN '25-48' 
ELSE '48+ Months' END as buckets
FROM TeleChurnData) as foo
GROUP BY buckets
ORDER BY buckets;

-- Q3. Find The Churn Rate For Combinations Of Two Categorical Featues (Contract Type X Payment Method)

SELECT 
Contract,PaymentMethod,
SUM(Case WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*1.0 AS Churned,
Count(*)*1.0 AS TotalCustomers,
Cast(Round(SUM(Case WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*1.0 / Count(*)*1.0 * 100,2) as Decimal(4,2)) AS ChurnRate
FROM TeleChurnData
GROUP BY Contract,PaymentMethod
ORDER BY Contract,PaymentMethod;