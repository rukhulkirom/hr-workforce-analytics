/*
=========================================================
HR Workforce Analytics
Attrition Analysis
=========================================================

Purpose:
    Analyze employee attrition across key workforce
    segments and identify potential attrition drivers.

Source:
    hr.vw_employee_attrition

=========================================================
*/

-- =======================================================
-- 1. Attrition by Department
-- =======================================================

SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        100.0 * SUM(attrition_flag) / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY department
ORDER BY attrition_rate DESC;

-- =======================================================
-- 2. Attrition by Overtime
-- =======================================================

SELECT
    over_time,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY over_time
ORDER BY attrition_rate DESC;

-- =======================================================
-- 3. Attrition by Job Role
-- =======================================================

SELECT
    job_role,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY job_role
ORDER BY attrition_rate DESC;

-- =======================================================
-- 4. Attrition by Age Group
-- =======================================================

SELECT
     age_group,
     COUNT(*) AS employee_count,
     SUM(attrition_flag) AS attrition_count,
     ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
     ) AS attrition_rate
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
-- 5. Attrition by Company Tenure
-- =======================================================

SELECT
     tenure_group,
     COUNT(*) AS employee_count,
     SUM(attrition_flag) AS attrition_count,
     ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
     ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN 'Less than 2 years' THEN 1 
        WHEN '2-4 years' THEN 2
        WHEN '5-9 years' THEN 3
        WHEN '10+ years' THEN 4
    END;

-- =======================================================
-- 6. Attrition by Business Travel
-- =======================================================

SELECT
     business_travel,
     COUNT(*) AS employee_count,
     SUM(attrition_flag) AS attrition_count,
     ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
     ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY business_travel
ORDER BY attrition_rate DESC;

-- =======================================================
-- 7. Attrition by Job Satisfaction
-- =======================================================

SELECT
     job_satisfaction,
     COUNT(*) AS employee_count,
     SUM(attrition_flag) AS attrition_count,
     ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
     ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- =======================================================
-- 8. Attrition by Income Band
-- =======================================================

SELECT
    income_band,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY income_band
ORDER BY
    CASE income_band
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        WHEN 'Very High' THEN 4
    END;

-- =======================================================
-- 9. Attrition by Stock Option Level
-- =======================================================

SELECT
     stock_option_level,
     COUNT(*) AS employee_count,
     SUM(attrition_flag) AS attrition_count,
     ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
     ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY stock_option_level
ORDER BY stock_option_level;

-- =======================================================
-- 10. Job Level vs Attrition
-- =======================================================

SELECT
    job_level,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY job_level
ORDER BY job_level;

-- =======================================================
-- 11. Overtime x Job Satisfaction vs Attrition
-- =======================================================

SELECT
    over_time,
    job_satisfaction,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY
    over_time,
    job_satisfaction
ORDER BY
    over_time,
    job_satisfaction;

-- =======================================================
-- 12. Attrition Rate by Relationship Satisfaction
-- =======================================================

SELECT
    relationship_satisfaction,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY relationship_satisfaction
ORDER BY relationship_satisfaction;

-- =======================================================
-- 13. Work-Life Balance vs Attrition
-- =======================================================

SELECT
    work_life_balance,
    COUNT(*) AS employee_count,
    SUM(attrition_flag) AS attrition_count,
    ROUND(
        SUM(attrition_flag) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM hr.vw_employee_attrition
GROUP BY work_life_balance
ORDER BY work_life_balance;

/*
=========================================================
SQL ANALYSIS FINDINGS SUMMARY
=========================================================

Overall Attrition:
    16.12%

Key Segments with Elevated Attrition:

1. Company Tenure
   Employees with less than 2 years at the company:
   Attrition Rate = 34.88%

2. Overtime
   Employees working overtime:
   Attrition Rate = 30.53%

3. Work-Life Balance
   Work-Life Balance level 1:
   Attrition Rate = 31.25%

4. Age
   Employees under 30:
   Attrition Rate = 27.91%

5. Job Level
   Job Level 1:
   Attrition Rate = 26.34%

6. Income
   Low income band:
   Attrition Rate = 28.61%

7. Business Travel
   Frequent business travelers:
   Attrition Rate = 24.91%

8. Stock Option
   Stock Option Level 0:
   Attrition Rate = 24.41%

9. Job Satisfaction
   Job Satisfaction level 1:
   Attrition Rate = 22.84%

10. Relationship Satisfaction
    Relationship Satisfaction level 1:
    Attrition Rate = 20.65%

Important:
    These findings represent associations rather than
    causal relationships. Further analysis using Python
    will be conducted to investigate distributions,
    relationships, and potential interaction effects
    in greater depth.

=========================================================
*/