/*
=========================================================
HR Workforce Analytics
Workforce Overview
=========================================================

Purpose:
    Provide a high-level overview of the employee
    workforce and key HR metrics.

Source:
    hr.vw_employee_attrition

Business Questions:
    1. How large is the workforce?
    2. How many employees have left?
    3. What is the overall attrition rate?
    4. What are the average age, income, and tenure?

=========================================================
*/

-- =======================================================
-- 1. Overall Workforce Overview
-- =======================================================

SELECT
    COUNT(*) AS total_employees,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        100.0 * SUM(attrition_flag) / COUNT(*),
        2
    ) AS attrition_rate,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income,
    ROUND(AVG(years_at_company), 2) AS average_tenure
FROM hr.vw_employee_attrition;


-- =======================================================
-- 2. Workforce by Department
-- =======================================================

SELECT
    department,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (),
        2
    ) AS workforce_percentage
FROM hr.vw_employee_attrition
GROUP BY department
ORDER BY employee_count DESC;


-- =======================================================
-- 3. Workforce by Overtime Status
-- =======================================================

SELECT
    over_time,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (),
        2
    ) AS workforce_percentage
FROM hr.vw_employee_attrition
GROUP BY over_time
ORDER BY employee_count DESC;


-- =======================================================
-- 4. Workforce by Age Group
-- =======================================================

SELECT
    age_group,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (),
        2
    ) AS workforce_percentage
FROM hr.vw_employee_attrition
GROUP BY age_group
ORDER BY
    CASE age_group
        WHEN 'Under 30' THEN 1
        WHEN '30-39' THEN 2
        WHEN '40-49' THEN 3
        WHEN '50+' THEN 4
    END;


-- =======================================================
-- 5. Workforce by Tenure Group
-- =======================================================

SELECT
    tenure_group,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER (),
        2
    ) AS workforce_percentage
FROM hr.vw_employee_attrition
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN 'Less than 2 years' THEN 1
        WHEN '2-4 years' THEN 2
        WHEN '5-9 years' THEN 3
        WHEN '10+ years' THEN 4
    END;