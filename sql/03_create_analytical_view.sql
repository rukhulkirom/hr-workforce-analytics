/*
=========================================================
HR Workforce Analytics
Analytical View
=========================================================

Purpose:
    Create an analytical view for HR workforce and
    employee attrition analysis.

Source:
    hr.employee_attrition

Output:
    hr.vw_employee_attrition

Derived fields:
    - attrition_flag
    - age_group
    - income_band
    - tenure_group
    - experience_group
    - overtime_flag

=========================================================
*/

CREATE OR REPLACE VIEW hr.vw_employee_attrition AS
SELECT
    employee_number,
    age,
    attrition,
    business_travel,
    department,
    distance_from_home,
    education,
    education_field,
    gender,
    job_role,
    marital_status,
    monthly_income,
    num_companies_worked,
    over_time,
    percent_salary_hike,
    performance_rating,
    relationship_satisfaction,
    stock_option_level,
    total_working_years,
    training_times_last_year,
    work_life_balance,
    years_at_company,
    years_in_current_role,
    years_since_last_promotion,
    years_with_curr_manager,

    -- Attrition flag
    CASE
        WHEN attrition = 'Yes' THEN 1
        ELSE 0
    END AS attrition_flag,

    -- Age group
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,

    -- Income band
    CASE
        WHEN monthly_income < 3000 THEN 'Low'
        WHEN monthly_income < 6000 THEN 'Medium'
        WHEN monthly_income < 10000 THEN 'High'
        ELSE 'Very High'
    END AS income_band,

    -- Company tenure group
    CASE
        WHEN years_at_company < 2 THEN 'Less than 2 years'
        WHEN years_at_company < 5 THEN '2-4 years'
        WHEN years_at_company < 10 THEN '5-9 years'
        ELSE '10+ years'
    END AS tenure_group,

    -- Total experience group
    CASE
        WHEN total_working_years < 5 THEN 'Entry'
        WHEN total_working_years < 10 THEN 'Early Career'
        WHEN total_working_years < 20 THEN 'Mid Career'
        ELSE 'Experienced'
    END AS experience_group,

    -- Overtime flag
    CASE
        WHEN over_time = 'Yes' THEN 1
        ELSE 0
    END AS overtime_flag

FROM hr.employee_attrition;