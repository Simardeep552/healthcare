/* =====================================================
   HEALTHCARE DATA ANALYSIS PROJECT
   Database: healthcare_sys
   Description: SQL queries used for analyzing patient,
   hospital, and billing insights from the healthcare dataset.
   ===================================================== */

-- =====================================================
-- 1. DATABASE SETUP
-- =====================================================

CREATE DATABASE healthcare_sys;
USE healthcare_sys;


-- =====================================================
-- 2. DATA QUALITY CHECKS
-- =====================================================

-- Checking null values in key columns
SELECT 
    SUM(medical_condition IS NULL) AS medical_condition_nulls,
    SUM(length_of_stay IS NULL) AS length_of_stay_nulls,
    SUM(billing_amount IS NULL) AS billing_amount_nulls
FROM healthcare;


-- =====================================================
-- 3. BASIC DATA OVERVIEW
-- =====================================================

-- Total patient records
SELECT COUNT(*) AS total_patients
FROM healthcare;

-- Gender distribution of patients
SELECT gender, COUNT(*) AS patient_count
FROM healthcare
GROUP BY gender;

-- Average age of patients
SELECT ROUND(AVG(age),2) AS avg_age
FROM healthcare;

-- Age category wise patient count
SELECT age_category, COUNT(*) AS patient_count
FROM healthcare
GROUP BY age_category;


-- =====================================================
-- 4. MEDICAL CONDITION ANALYSIS
-- =====================================================

-- Top 5 medical conditions by number of patients
SELECT medical_condition, COUNT(*) AS patient_count
FROM healthcare
GROUP BY medical_condition
ORDER BY patient_count DESC
LIMIT 5;

-- Average length of stay by medical condition
SELECT medical_condition, ROUND(AVG(length_of_stay),2) AS avg_stay_days
FROM healthcare
GROUP BY medical_condition
ORDER BY avg_stay_days DESC;

-- Medical conditions with billing higher than overall average
SELECT medical_condition, ROUND(AVG(billing_amount),2) AS avg_billing
FROM healthcare
GROUP BY medical_condition
HAVING AVG(billing_amount) > (SELECT AVG(billing_amount) FROM healthcare);

-- Top 5 conditions with highest average stay
SELECT medical_condition, ROUND(AVG(length_of_stay),2) AS avg_stay
FROM healthcare
GROUP BY medical_condition
ORDER BY avg_stay DESC
LIMIT 5;


-- =====================================================
-- 5. HOSPITAL STAY ANALYSIS
-- =====================================================

-- Average length of stay
SELECT ROUND(AVG(length_of_stay),2) AS avg_stay_days
FROM healthcare;

-- Patients with longest hospital stay
SELECT name, length_of_stay, medical_condition
FROM healthcare
ORDER BY length_of_stay DESC
LIMIT 5;

-- Relationship between test results and stay duration
SELECT test_results, ROUND(AVG(length_of_stay),2) AS avg_stay
FROM healthcare
GROUP BY test_results;


-- =====================================================
-- 6. ADMISSION TYPE ANALYSIS
-- =====================================================

-- Patient count by admission type
SELECT admission_type, COUNT(*) AS patient_count
FROM healthcare
GROUP BY admission_type
ORDER BY patient_count DESC;

-- Compare billing for Emergency vs Elective
SELECT admission_type, ROUND(AVG(billing_amount),2) AS avg_billing
FROM healthcare
WHERE admission_type IN ('Emergency','Elective')
GROUP BY admission_type;


-- =====================================================
-- 7. BILLING ANALYSIS
-- =====================================================

-- Total billing amount
SELECT ROUND(SUM(billing_amount),2) AS total_amount
FROM healthcare;

-- Billing by gender
SELECT gender, ROUND(SUM(billing_amount),2) AS total_billing
FROM healthcare
GROUP BY gender;

-- Average billing per patient
SELECT ROUND(AVG(billing_amount),2) AS avg_billing_amount
FROM healthcare;

-- Billing by age category
SELECT age_category, ROUND(SUM(billing_amount),2) AS total_billing
FROM healthcare
GROUP BY age_category
ORDER BY total_billing DESC;


-- =====================================================
-- 8. DOCTOR & HOSPITAL PERFORMANCE
-- =====================================================

-- Top 10 doctors by billing
SELECT doctor, ROUND(SUM(billing_amount),2) AS total_billing
FROM healthcare
GROUP BY doctor
ORDER BY total_billing DESC
LIMIT 10;

-- Top 10 hospitals by billing
SELECT hospital, ROUND(SUM(billing_amount),2) AS total_billing
FROM healthcare
GROUP BY hospital
ORDER BY total_billing DESC
LIMIT 10;

-- Top doctor generating highest billing in each hospital
WITH doctor_billing AS (
    SELECT hospital, doctor, SUM(billing_amount) AS total_billing
    FROM healthcare
    GROUP BY hospital, doctor
),
ranked_doctors AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY hospital
               ORDER BY total_billing DESC
           ) AS rank_no
    FROM doctor_billing
)
SELECT hospital, doctor, total_billing
FROM ranked_doctors
WHERE rank_no = 1;


-- =====================================================
-- 9. INSURANCE ANALYSIS
-- =====================================================

-- Insurance provider wise patient count
SELECT insurance_provider, COUNT(*) AS patient_count
FROM healthcare
GROUP BY insurance_provider
ORDER BY patient_count DESC;

-- Average billing by insurance provider
SELECT insurance_provider, ROUND(AVG(billing_amount),2) AS avg_billing
FROM healthcare
GROUP BY insurance_provider
ORDER BY avg_billing DESC;


-- =====================================================
-- 10. FINANCIAL TRENDS
-- =====================================================

-- Monthly billing trend
SELECT DATE_FORMAT(date_of_admission, "%Y-%m") AS month,
       ROUND(SUM(billing_amount),2) AS total_billing
FROM healthcare
GROUP BY month
ORDER BY month;

-- Percentage of billing from emergency admissions
SELECT ROUND(
    100.0 * SUM(CASE 
        WHEN admission_type = 'Emergency' 
        THEN billing_amount 
        ELSE 0 
    END) / SUM(billing_amount),
2) AS emergency_billing_percentage
FROM healthcare;