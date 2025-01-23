-- adding transaction IDs to the transactions table 
ALTER TABLE transactions
ADD Trans_ID INT IDENTITY(1,1);

-- How can we optimize the loan approval process to ensure faster processing times while maintaining compliance and minimizing defaults?
SELECT approv_in_adv, loan_type, credit_worthiness, COUNT(*) AS approval_count
FROM dim_clients JOIN Transactions
	ON Dim_Clients.ID = Transactions.ID
WHERE Status = 1
GROUP BY approv_in_adv, loan_type, credit_worthiness
ORDER BY approval_count DESC;

-- What are the key factors affecting creditworthiness, and how can we identify high-risk borrowers to reduce the default rate?
	--Correlate creditworthiness with variables like DTI, income, and credit score.
	SELECT credit_worthiness, AVG(Credit_Score) AS avg_score, AVG(dtir1) AS avg_dti
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
	GROUP BY credit_worthiness;

		--Analyze default rates by creditworthiness.
	SELECT credit_worthiness, COUNT(*) AS defaults
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
		WHERE Status = 0
	GROUP BY credit_worthiness;

	--Analyzing default trends by loan type, region, or other demographic variables.
	SELECT loan_type, region, COUNT(*) AS default_count, SUM(COUNT(*)) OVER(PARTITION BY loan_type ORDER BY loan_type,COUNT(*) DESC) AS RunningTotal
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
	WHERE credit_worthiness = 'Low' AND Status = 0
	GROUP BY loan_type, region
	ORDER BY loan_type,default_count DESC;
	
--How does the interest rate and its spread influence the likelihood of loan repayment or prepayment?
	SELECT ROUND(rate_of_interest,2) AS Interest_Rate, Status, COUNT(*) AS count
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
	GROUP BY rate_of_interest, Status
	ORDER BY Interest_Rate;

	-- Aggregating Defaults and Repayments by Interest Rate Range
	SELECT 
		CASE 
			WHEN rate_of_interest < 3 THEN 'Low (<3%)'
			WHEN rate_of_interest BETWEEN 3 AND 4 THEN 'Moderate (3-4%)'
			WHEN rate_of_interest BETWEEN 4 AND 5 THEN 'High (4-5%)'
			ELSE 'Very High (>5%)'
		END AS Interest_Rate_Range,
		Status,
		COUNT(*) AS Loan_Count
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
	GROUP BY 
		CASE 
			WHEN rate_of_interest < 3 THEN 'Low (<3%)'
			WHEN rate_of_interest BETWEEN 3 AND 4 THEN 'Moderate (3-4%)'
			WHEN rate_of_interest BETWEEN 4 AND 5 THEN 'High (4-5%)'
			ELSE 'Very High (>5%)'
		END,
		Status
	ORDER BY Loan_Count DESC;

	-- Analyzing spread impact on default
	SELECT 
		ROUND(rate_of_interest,2) AS Interest_Rate, 
		ROUND(AVG(Interest_rate_spread),2) AS Avg_Spread, 
		Status, 
		COUNT(*) AS Loan_Count
	FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
		ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
	GROUP BY rate_of_interest, Status
	ORDER BY Loan_Count DESC;


-- How do borrower demographics, such as age, gender, and region, influence loan purpose, approval rates, and default risk?
SELECT Gender, age, Region, COUNT(*) AS loan_count, AVG(CAST(loan_amount AS BIGINT)) AS avg_loan
FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
	ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
GROUP BY Gender, age, Region
ORDER BY avg_loan DESC;

-- What is the impact of varying debt-to-income (DTI) ratios on borrower repayment behavior, and what thresholds should be set to minimize risk?
SELECT Gender, age, Region, COUNT(*) AS loan_count, AVG(CAST(loan_amount AS BIGINT)) AS avg_loan
FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
	ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
GROUP BY Gender, age, Region
ORDER BY avg_loan DESC;
	
--How does the property value and type (e.g., site-built home) affect loan approval rates and repayment performance?
SELECT property_value, AVG(CAST(loan_amount AS BIGINT)) AS avg_loan, AVG(CAST(Status AS int)) AS repayment_rate
FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
	ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
GROUP BY property_value
ORDER BY property_value DESC;


-- Are there significant regional differences in loan performance, approval rates, or credit scores, and how can these insights inform market strategies?
SELECT Region, COUNT(*) AS loan_count, AVG(CAST(Status AS int)) AS repayment_rate
FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
	ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
GROUP BY Region
ORDER BY loan_count DESC;

-- How can we segment borrowers based on credit score, income, and loan purpose to offer more personalized and profitable loan products?
SELECT age, AVG(CAST(loan_amount AS BIGINT)) AS avg_loan, AVG(Credit_Score) AS avg_score
FROM [loans].[dbo].[Dim_Clients] JOIN [loans].[dbo].[Transactions]
	ON [loans].[dbo].[Dim_Clients].ID = [loans].[dbo].[Transactions].ID
GROUP BY age
ORDER BY avg_score DESC;

-- 
