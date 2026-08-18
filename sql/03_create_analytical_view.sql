/*
=========================================================
HR Workforce Analytics
Analytical View
=========================================================

Purpose:
    Create a reusable analytical view for HR workforce
    and attrition analysis.

Source:
    hr.employee_attrition

Derived Fields:
    - attrition_flag
    - age_group
    - income_band
    - tenure_group
    - experience_group
    - overtime_flag

=========================================================
*/

DROP VIEW IF EXISTS hr.vw_employee_attrition;

CREATE VIEW hr.vw_employee_attrition AS
SELECT
    -- Employee Information
    employee_number,
    age,
    attrition,
    gender,
    marital_status,

    -- Work Information
    business_travel,
    department,
    job_level,
    job_role,
    education,
    education_field,

    -- Satisfaction & Engagement
    job_satisfaction,
    environment_satisfaction,
    job_involvement,
    relationship_satisfaction,
    work_life_balance,

    -- Compensation & Benefits
    monthly_income,
    hourly_rate,
    monthly_rate,
    percent_salary_hike,
    performance_rating,
    stock_option_level,

    -- Workload
    over_time,
    distance_from_home,

    -- Career & Experience
    num_companies_worked,
    total_working_years,
    years_at_company,
    years_in_current_role,
    years_since_last_promotion,
    years_with_curr_manager,
    training_times_last_year,

    -- Attrition Flag
    CASE
        WHEN attrition = 'Yes' THEN 1
        ELSE 0
    END AS attrition_flag,

    -- Age Group
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,

    -- Income Band
    CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        WHEN monthly_income < 10000 THEN 'High'
        ELSE 'Very High'
    END AS income_band,

    -- Company Tenure Group
    CASE
        WHEN years_at_company < 2 THEN 'Less than 2 years'
        WHEN years_at_company < 5 THEN '2-4 years'
        WHEN years_at_company < 10 THEN '5-9 years'
        ELSE '10+ years'
    END AS tenure_group,

    -- Total Experience Group
    CASE
        WHEN total_working_years < 5 THEN 'Entry'
        WHEN total_working_years < 10 THEN 'Early Career'
        WHEN total_working_years < 20 THEN 'Mid Career'
        ELSE 'Experienced'
    END AS experience_group,

    -- Overtime Flag
    CASE
        WHEN over_time = 'Yes' THEN 1
        ELSE 0
    END AS overtime_flag

FROM hr.employee_attrition;