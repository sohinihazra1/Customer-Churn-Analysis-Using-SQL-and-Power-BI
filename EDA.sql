--Exploratory Data Analysis (EDA) for Customer Churn Dataset
-- This query analyzes customer behavior patterns, churn rates,
-- and key metrics to identify factors influencing customer churn.

USE customer_database;

SELECT * FROM customer_dt;

--- Feature Engineering

-- Creating a copy of customer_dt
SELECT * INTO customer_data FROM customer_dt;
SELECT * FROM customer_data

-- Creating new columns for further analysis

ALTER TABLE customer_data
ADD customer_tenure_group VARCHAR(20);

UPDATE customer_data SET customer_tenure_group =
	 CASE 
    WHEN tenure_months <= 6 THEN 'New Customer'
    WHEN tenure_months BETWEEN 7 AND 18 THEN 'Mid-term Customer'
    ELSE 'Long-term Customer'
END;

ALTER TABLE customer_data
ADD login_engagement VARCHAR(20);


UPDATE customer_data SET login_engagement =
CASE 
    WHEN number_of_logins_per_month <= 10 THEN 'Low Engagement'
    WHEN number_of_logins_per_month BETWEEN 11 AND 25 THEN 'Moderate Engagement'
    ELSE 'High Engagement'
END;

ALTER TABLE customer_data
ADD churn_risk_category VARCHAR(20);

EXEC sp_rename 'customer_data.churn_risk_category', 'churn_probability','COLUMN';

UPDATE customer_data SET churn_probability =
CASE 
    WHEN last_login_days_ago <= 7 THEN 'Low'
    WHEN last_login_days_ago BETWEEN 8 AND 30 THEN 'Medium'
    ELSE 'High'
END;

ALTER TABLE customer_data
ADD age_group VARCHAR(20);

UPDATE customer_data SET  age_group =
	CASE 
	WHEN age <= 19 THEN 'Teen'
	WHEN age BETWEEN 20 AND 40 THEN 'Young_adult'
	ELSE 'Senior'
	END;

-- Overall Churn Rate

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
   CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
FROM customer_data

-- Tenure vs Churn 

SELECT tenure_months,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY tenure_months
	ORDER BY churn_rate;

-- Churn by age
SELECT age_group,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY age_group
	ORDER BY age_group;

-- Churn by gender
SELECT gender,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY gender
	ORDER BY churn_rate;

-- Churn by region
SELECT region,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY region
	ORDER BY churn_rate;

-- Churn by income_level
SELECT income_level,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY income_level
	ORDER BY churn_rate;

-- Churn by subscription_type
SELECT subscription_type,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY subscription_type
	ORDER BY churn_rate;

-- Churn by usage_frequency
SELECT usage_frequency,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY usage_frequency
	ORDER BY churn_rate;

-- Churn by support tickets
SELECT number_of_support_tickets,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY number_of_support_tickets
	ORDER BY number_of_support_tickets;

-- Churn by satisfaction score
SELECT satisfaction_score,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY satisfaction_score
	ORDER BY satisfaction_score;

-- Churn by payment_method
SELECT payment_method,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY payment_method
	ORDER BY payment_method;

-- Churn by contract type
SELECT contract_type,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY contract_type
	ORDER BY contract_type;

-- Churn by Promotional response and discount_used
SELECT 
    promotional_response,
    discount_used,
    COUNT(*) AS total_customers,
    
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    
    CAST (ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2) AS DECIMAL(5,2)) AS churn_rate
FROM customer_data
GROUP BY promotional_response, discount_used
ORDER BY promotional_response, discount_used;

-- Combined Risk Profiling
WITH risk_data AS (
    SELECT *,
        CASE 
            WHEN usage_frequency = 'low' AND login_engagement = 'Low Engagement' THEN 'High Risk'
			WHEN avg_session_duration_minutes BETWEEN 30 AND 45 AND number_of_logins_per_month > 10 THEN 'Low Risk'
            WHEN satisfaction_score < 5 AND number_of_support_tickets > 3 THEN 'Dissatisfied'
            WHEN last_login_days_ago > 30 THEN 'Inactive'
            ELSE 'Normal'
        END AS risk_category
    FROM customer_data
)

SELECT 
    risk_category,
    COUNT(*) AS total,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST (ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2) AS DECIMAL(5,2)) AS churn_rate
FROM risk_data
GROUP BY risk_category;

-- Churn rate by tenure and engagement level
SELECT 
	customer_tenure_group, login_engagement, churn_probability,
	COUNT(*) AS total,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST( ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS churn_rate
	FROM customer_data
	GROUP BY customer_tenure_group,login_engagement, churn_probability 
	ORDER BY churn_rate;


-- Monthly_charges vs Churn
WITH mon_cte AS (
SELECT *, 
    CASE 
        WHEN monthly_charges < 25 THEN 'Low'
        WHEN monthly_charges BETWEEN 25 AND 50 THEN 'Medium'
        ELSE 'High'
    END AS charge_category
	FROM customer_data)
	SELECT 
    charge_category,
    COUNT(*) AS total,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST (ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2) AS DECIMAL(5,2)) AS churn_rate
FROM mon_cte
GROUP BY charge_category;

-- Total_charges vs Churn
WITH total_cte AS (
SELECT *, 
    CASE
	 WHEN total_charges < 100 THEN 'Low'
        WHEN total_charges BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS total_spend_category
	FROM customer_data)
	SELECT 
    total_spend_category,
    COUNT(*) AS total,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	CAST (ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2) AS DECIMAL(5,2)) AS churn_rate
FROM total_cte
GROUP BY total_spend_category;

-- Usage behavior
SELECT 
    AVG(avg_session_duration_minutes) AS avg_session_time,
    AVG(number_of_logins_per_month) AS avg_logins,
    churn
FROM customer_data
GROUP BY churn;

-- Customer Churn vs Revenue
SELECT 
    churn,
    
    COUNT(*) AS customers,
    
    SUM(monthly_charges) AS total_monthly_revenue,
    
    SUM(total_charges) AS lifetime_revenue,
    
    AVG(monthly_charges) AS avg_monthly_value

FROM customer_data
GROUP BY churn;

-- Cohort Analysis
WITH cohort_data AS (
    SELECT 
        customer_id,
        
        FORMAT(signup_date, 'yyyy-MM') AS cohort_month,
        
        tenure_months,
        churn
    FROM customer_data
),

cohort_summary AS (
    SELECT 
        cohort_month,
        tenure_months,
        
        COUNT(*) AS total_customers,
        
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
    FROM cohort_data
    GROUP BY cohort_month, tenure_months
)

SELECT 
    cohort_month,
    tenure_months,
    total_customers,
    churned_customers,
    
    ROUND(
        100.0 * churned_customers / total_customers,
        2
    ) AS churn_rate

FROM cohort_summary
ORDER BY churn_rate;



