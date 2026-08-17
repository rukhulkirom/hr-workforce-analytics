-- ============================================================
-- HR Workforce Analytics
-- PostgreSQL Data Integrity & Business Rule Validation
-- ============================================================

-- 3G.1 Attrition Distribution
SELECT
    attrition,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hr.employee_attrition
GROUP BY attrition
ORDER BY attrition;


-- 3G.2 Department Distribution
SELECT
    department,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hr.employee_attrition
GROUP BY department
ORDER BY employee_count DESC;


-- 3G.3 Overtime Distribution
SELECT
    over_time,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM hr.employee_attrition
GROUP BY over_time
ORDER BY over_time;


-- 3G.4 Business Logic Validation

-- Company tenure cannot exceed total working years
SELECT COUNT(*) AS invalid_count
FROM hr.employee_attrition
WHERE years_at_company > total_working_years;


-- Current role tenure cannot exceed company tenure
SELECT COUNT(*) AS invalid_count
FROM hr.employee_attrition
WHERE years_in_current_role > years_at_company;


-- Manager tenure cannot exceed company tenure
SELECT COUNT(*) AS invalid_count
FROM hr.employee_attrition
WHERE years_with_curr_manager > years_at_company;


-- Promotion tenure cannot exceed company tenure
SELECT COUNT(*) AS invalid_count
FROM hr.employee_attrition
WHERE years_since_last_promotion > years_at_company;


-- 3G.5 Ordinal Range Validation
SELECT
    MIN(education) AS education_min,
    MAX(education) AS education_max,

    MIN(environment_satisfaction) AS environment_satisfaction_min,
    MAX(environment_satisfaction) AS environment_satisfaction_max,

    MIN(job_involvement) AS job_involvement_min,
    MAX(job_involvement) AS job_involvement_max,

    MIN(job_level) AS job_level_min,
    MAX(job_level) AS job_level_max,

    MIN(job_satisfaction) AS job_satisfaction_min,
    MAX(job_satisfaction) AS job_satisfaction_max,

    MIN(performance_rating) AS performance_rating_min,
    MAX(performance_rating) AS performance_rating_max

FROM hr.employee_attrition;


-- 3G.6 Financial / Compensation Validation
SELECT
    COUNT(*) FILTER (WHERE daily_rate <= 0) AS invalid_daily_rate,
    COUNT(*) FILTER (WHERE hourly_rate <= 0) AS invalid_hourly_rate,
    COUNT(*) FILTER (WHERE monthly_income <= 0) AS invalid_monthly_income,
    COUNT(*) FILTER (WHERE monthly_rate <= 0) AS invalid_monthly_rate
FROM hr.employee_attrition;


-- 3G.7 Age Validation
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    COUNT(*) FILTER (
        WHERE age < 18 OR age > 60
    ) AS invalid_age
FROM hr.employee_attrition;


-- 3G.8 Overall Data Quality Summary
SELECT
    COUNT(*) AS total_rows,

    COUNT(*) FILTER (
        WHERE attrition NOT IN ('Yes', 'No')
    ) AS invalid_attrition,

    COUNT(*) FILTER (
        WHERE age < 18 OR age > 60
    ) AS invalid_age,

    COUNT(*) FILTER (
        WHERE years_at_company > total_working_years
    ) AS invalid_company_tenure,

    COUNT(*) FILTER (
        WHERE years_in_current_role > years_at_company
    ) AS invalid_role_tenure,

    COUNT(*) FILTER (
        WHERE years_with_curr_manager > years_at_company
    ) AS invalid_manager_tenure,

    COUNT(*) FILTER (
        WHERE years_since_last_promotion > years_at_company
    ) AS invalid_promotion_tenure,

    COUNT(*) FILTER (
        WHERE monthly_income <= 0
    ) AS invalid_income

FROM hr.employee_attrition;