USE customer_database;

SELECT * FROM customer_details;

-- Data Cleaning.

SELECT * INTO customer_dt FROM customer_details;

SELECT * FROM customer_dt;

-- Cheacking for duplicates.

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS row_num
    FROM customer_dt
)
SELECT *
FROM cte
WHERE row_num > 1;

-- Standardizing the data

UPDATE customer_dt SET gender = 'Male' WHERE gender IN ('male', 'M');

UPDATE customer_dt SET gender = 'Female' WHERE gender IN ('female', 'F');

ALTER TABLE customer_dt
ALTER COLUMN churn VARCHAR(10);

UPDATE customer_dt SET churn = 'Yes' WHERE churn IN ('yes', '1');

UPDATE customer_dt SET churn = 'No' WHERE churn IN ('no', '0');

-- Checking for inconsistent data

SELECT DISTINCT subscription_type FROM customer_dt;
SELECT DISTINCT income_level FROM customer_dt;
SELECT DISTINCT usage_frequency FROM customer_dt;
SELECT DISTINCT payment_method FROM customer_dt;
SELECT DISTINCT contract_type FROM customer_dt;

-- Checking for null values

SELECT * FROM customer_dt WHERE customer_id IS NULL;

SELECT *
FROM customer_dt
WHERE 
    customer_id IS NULL OR
	signup_date IS NULL OR
	tenure_months IS NULL OR
    age IS NULL OR
    gender IS NULL OR
	region IS NULL OR
	income_level IS NULL OR
    subscription_type IS NULL OR
	monthly_charges IS NULL OR
	total_charges IS NULL OR
	usage_frequency IS NULL OR
	avg_session_duration_minutes IS NULL OR
	number_of_logins_per_month IS NULL OR
	satisfaction_score IS NULL OR
	payment_method IS NULL OR
	contract_type IS NULL OR
	last_login_days_ago IS NULL OR
	promotional_response IS NULL OR
	discount_used IS NULL OR
    churn IS NULL;

	-- ============================================
-- Data Cleaning Summary
-- ============================================
-- 1. Created a copy of raw data (customer_dt)
-- 2. Checked for duplicates - none found
-- 3. Standardized categorical values (gender, churn, etc.)
-- 4. Verified and corrected data types
-- 5. Checked for inconsistent values 
-- 6. Checked for NULL values - none found

-- Final cleaned table ready for EDA
-- ============================================