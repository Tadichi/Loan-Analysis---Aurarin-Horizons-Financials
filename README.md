# Loan-Analysis---Aurarin-Horizons-Financials

## 1. Project Background
This project aims to analyze loan performance and borrower behavior using historical data from Aurarin Horizons Financial, a mid-sized lending institution specializing in consumer loans across various regions. Bright Future Financial aims to enhance its loan portfolio management by leveraging data-driven insights to optimize approval processes, reduce default rates, and identify high-value borrower segments.

The objective is to uncover actionable insights that can improve loan approval processes, reduce default rates, and optimize lending strategies. The scope includes examining key financial metrics such as interest rates, creditworthiness, and debt-to-income ratios while segmenting borrower data by demographics and regions.

Key features of the analysis:
- Utilizing SQL for data extraction and transformation.
- Employing Power BI for interactive visualizations.
-	Leveraging financial metrics and business terminology like LTV (Loan-to-Value), DTI (Debt-to-Income), and repayment rates. This project aims to analyze loan performance and borrower behavior using historical data from a financial institution.
-	The objective is to uncover actionable insights that can improve loan approval processes, reduce default rates, and optimize lending strategies. The scope includes examining key financial metrics such as interest rates, creditworthiness, and debt-to-income ratios while segmenting borrower data by demographics and regions.

Below are the relevant resources for this project:

  [Power BI Report](https://github.com/Tadichi/Loan-Analysis---Aurarin-Horizons-Financials/blob/main/Files/Aurarin%20Horizons%20Financial.pbix)
  
  [SQL Queries](https://github.com/Tadichi/Loan-Analysis---Aurarin-Horizons-Financials/blob/main/Files/SQL%20Query.sql)
  
  [CSV Data](https://github.com/Tadichi/Loan-Analysis---Aurarin-Horizons-Financials/tree/main/Files)


## 2. Executive Summary

### Key Highlights:
  -	"No Pre-Approval" loans dominate approvals, accounting for 78% of all approvals, with Standard loans being the most prevalent.
  -	Borrowers with low creditworthiness have significantly higher default rates despite similar credit scores to moderate borrowers.
  -	Moderate interest rates (3%-4%) represent a critical risk zone, with the highest default counts.
  -	Spread ranges between 0.14 and 0.52 see the most defaults, while negative spreads also exhibit risk factors.
  -	The North region leads in defaults, while the North-East emerges as a low-risk region.
  -	Joint borrowers in the 35-44 age group dominate high-value segments, particularly in the South region.
  -	Standard loans show the largest volume but also the highest default rates, while Specialized loans indicate better repayment performance.

### Problem Statement

  1.	How can we optimize the loan approval process to ensure faster processing times while maintaining compliance and minimizing defaults?
  2.	What are the key factors affecting creditworthiness, and how can we identify high-risk borrowers to reduce the default rate?
  3.	How does the interest rate and its spread influence the likelihood of loan repayment or prepayment?
  4.	How do borrower demographics, such as age, gender, and region, influence loan purpose, approval rates, and default risk?
  5.	What is the impact of varying debt-to-income (DTI) ratios on borrower repayment behavior, and what thresholds should be set to minimize risk?
  6.	How does the property value and type (e.g., site-built home) affect loan approval rates and repayment performance?
  7.	Are there significant regional differences in loan performance, approval rates, or credit scores, and how can these insights inform market strategies?
  8.	How can we segment borrowers based on credit score, income, and loan purpose to offer more personalized and profitable loan products?

## 4. Tools and Technologies Used

  -	SQL: For data cleaning, transformation, and analysis.
  -	Power BI: For creating interactive dashboards and visualizations.
  -	Excel: For initial data exploration and validation.
Key Processes:
  -	Data cleaning to handle missing and inconsistent entries.
  -	Normalization of financial metrics for uniform comparisons.
  -	Segmentation of borrowers by demographics and regions.
  -	Analysis of loan performance using key metrics such as default rates and repayment ratios.

## 5. Key Insights

1. Loan Approval Trends:

![matrix](https://github.com/user-attachments/assets/f8b17898-e9de-40bd-ab8c-96f17bf91e45)

  "No Pre-Approval" loans dominate approvals, accounting for 78% of all approved loans, while Pre-Approval loans constitute only 22%.

Analysis: 
  -	"No Pre-Approval" loans may appeal to borrowers seeking faster, less bureaucratic processes.
  -	The low adoption of Pre-Approval could indicate either borrower hesitation or inefficiencies in the pre-approval pipeline.
  -	Aligning marketing strategies with borrower preferences for "No Pre-Approval" could further streamline revenue generation.
  
  Approval Rate (AR) = 78% for No Pre-Approval vs. 22% for Pre-Approval.


2. Creditworthiness Insights:

      Borrowers with low creditworthiness exhibit a default rate of 37%, significantly higher than the 3% default rate for moderate borrowers.

Analysis: 
 -	The discrepancy suggests that current credit scoring models might inadequately assess repayment capacity for low-creditworthiness borrowers.
 -	Developing alternative scoring models that incorporate behavioral and transactional data could improve accuracy in risk prediction.
 -	Focusing on improving credit education for low-creditworthiness borrowers may lower default rates.

Default Rate (DR) = (Defaults / Total Loans) × 100. 
DR for Low Creditworthiness: 37%; Moderate: 3%.


3. Interest Rate Patterns:

      Moderate interest rates (3%-4%) have the highest default count at 46,224 loans, while low interest rates (<3%) correspond with high repayment rates.

Analysis: 
  -	Borrowers in the 3%-4% range might be struggling with a combination of suboptimal terms and repayment capacities.
  -	Structuring repayment plans with flexibility in this range could reduce defaults and improve borrower retention.
  -	Loans at <3% interest represent an opportunity to target low-risk, high-volume borrowers for consistent portfolio growth.
    
Default-to-Repayment Ratio (DRR) = 1.85 for the 3%-4% range.


4. Spread Impact:

     Spreads between 0.14-0.52 are associated with the highest defaults, with significant clusters like 9,923 defaults at a 3.99% interest rate.

Analysis: 
  -	Moderate spreads might be misaligned with borrower affordability, leading to increased defaults.
  -	Adjusting pricing strategies to avoid problematic spread ranges could improve repayment metrics.
  -	Further analysis is needed to understand why negative spreads (<0) still see notable defaults.

Default Spread Impact (DSI) = 34% of defaults occur in the 0.14-0.52 spread range.


5. Regional Loan Performance:
     The North region leads with 41,794 defaults, while the North-East region maintains the lowest default rate at 2.3%.

Analysis: 
  -	High defaults in the North indicate economic or policy challenges specific to this region. A localized approach to lending policies could mitigate risk.
  -	The North-East offers opportunities for growth as a low-risk market segment.
  -	Tailored financial products by region could help improve borrower satisfaction and minimize defaults.

Regional Default Rate (RDR) = 18.5% in the North vs. 2.3% in the North-East.


6. Demographic Patterns:

![demographics](https://github.com/user-attachments/assets/9459e0df-038d-4d97-be5b-f5cfdda24d93)

  Joint borrowers in the 35-44 age group dominate both loan count and average loan amount, with a peak average of $472,875 in the South.

Analysis: 
  -	Joint borrowers represent a reliable and lucrative segment due to their higher repayment reliability and borrowing capacity.
  -	Enhanced financial products, such as co-borrower discounts, could increase retention within this demographic.
  -	Underrepresented groups, such as younger borrowers (<25) and older borrowers (>74), could benefit from targeted loan programs to grow participation.

Demographic Loan Value (DLV) = $1.25B for Joint borrowers in the South.


7. Loan Type Analysis:

![overview](https://github.com/user-attachments/assets/6503ac97-c697-4428-9b22-9768b14f45c4)
   
   Standard loans account for the highest defaults and largest volume, while Specialized loans show better repayment performance.

Analysis: 
  -	Standard loans present a dual challenge of high risk and high exposure. Refining underwriting practices for this loan type is critical.
  -	Specialized loans could be scaled with minimal adjustments, offering a safer avenue for growth.
  -	Loan diversification strategies could reduce overreliance on Standard loans.

Loan Performance Index (LPI) = 0.42 for Standard loans vs. 0.68 for Specialized loans.


8. High-Value Segments:
 
    Joint borrowers in the South dominate as the most lucrative group, with a Segment Value Contribution (SVC) of $1.9M.

Analysis: 
  -	High-value borrowers exhibit strong repayment reliability, making them ideal candidates for premium financial products.
  -	Further segmentation within high-value groups could identify untapped sub-segments, such as high-income individual borrowers.
  -	Marketing strategies tailored to Joint borrowers in the South can drive sustained portfolio growth.

Segment Value Contribution (SVC) = Average Loan Amount × Repayment Rate = $1.9M for Joint Borrowers in the South.


## 6. Final Recommendations for Aurarin Horizons Financial

  1.	Streamline Pre-Approval processes and target marketing for underrepresented demographics.
  2.	Develop borrower-specific risk models that account for behavioral patterns beyond credit scores.
  3.	Avoid issuing loans in the 3%-4% interest range without stringent borrower screening.
  4.	Monitor spread ranges (0.14-0.52) to mitigate risks while refining pricing strategies.
  5.	Expand lending operations in the North-East while addressing high-risk trends in the North.
  6.	Enhance financial literacy programs for underrepresented groups like female and younger borrowers.
  7.	Tailor loan products for high-value segments, particularly Joint borrowers in the South.


## 7. Caveats and Assumptions
   
1.	Data Cleaning:
  -	Missing values in critical fields were addressed using mean and median imputation.
  -	Non-numeric entries in numeric columns were removed.

2.	Data Normalization:
  -	Financial metrics such as loan amounts and DTIs were normalized for fair comparisons.
  -	Outliers were handled using interquartile range (IQR) methods.

3.	Assumptions for Analysis:
  -	Borrowers are independent with no co-borrower or linked loan scenarios.
  -	Loan repayment is binary (paid or defaulted), excluding partial repayments.
  -	Regional segmentation assumes no overlaps in borrower activity.

4.	Limitations:
  -	Historical data may not fully reflect future trends due to economic or regulatory changes.
  -	Demographic bins may not capture nuanced borrower behavior.

 Despite these challenges, the analysis provides robust insights to guide strategic decision-making.
