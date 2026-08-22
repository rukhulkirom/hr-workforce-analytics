# Business Insights — HR Workforce Analytics

## 1. Executive Summary

This project analyzes employee workforce characteristics and attrition patterns using an end-to-end analytical workflow combining PostgreSQL, Python, statistical analysis, rule-based risk segmentation, and Power BI.

The dataset contains **1,470 employees**, consisting of **1,233 active employees** and **237 employees who left the organization**. The overall attrition rate is **16.1%**.

The analysis shows that attrition is not evenly distributed across the workforce. Overtime, job role, stock option level, marital status, job involvement, business travel, environment satisfaction, job satisfaction, and work-life balance remain statistically associated with attrition after Bonferroni correction.

A rule-based retention risk segmentation further separates employees into Low, Medium, and High Risk groups. The **151 High Risk employees represent approximately 10.3% of the workforce but have an observed attrition rate of 50.99%**, compared with 25.10% for Medium Risk and 9.02% for Low Risk employees.

The findings suggest that HR retention efforts can be more effectively prioritized by combining workload, employee experience, job characteristics, and employee risk profiles rather than relying on a single attrition factor.

---

## 2. Workforce Overview

The organization has a total workforce of **1,470 employees**.

| Workforce Metric       | Value |
| ---------------------- | ----: |
| Total Employees        | 1,470 |
| Active Employees       | 1,233 |
| Employees Left         |   237 |
| Overall Attrition Rate | 16.1% |

Approximately **83.9%** of employees remain active, while **16.1%** have left the organization.

The overall attrition rate provides the baseline for evaluating differences across departments, job roles, employee experience characteristics, and risk segments.

---

## 3. Attrition Insights

### 3.1 Attrition by Department

Attrition varies across departments:

| Department             | Attrition Rate |
| ---------------------- | -------------: |
| Sales                  |     **20.63%** |
| Human Resources        |     **19.05%** |
| Research & Development |     **13.84%** |

Sales has the highest attrition rate at **20.63%**, followed by Human Resources at **19.05%**.

Research & Development has the lowest attrition rate among the three departments at **13.84%**.

This indicates that department-level retention challenges are not uniform and may require different approaches.

---

### 3.2 Attrition by Job Role

Attrition varies more substantially across individual job roles.

| Job Role                  | Attrition Rate |
| ------------------------- | -------------: |
| Sales Representative      |     **39.76%** |
| Laboratory Technician     |     **23.94%** |
| Human Resources           |     **23.08%** |
| Sales Executive           |         17.48% |
| Research Scientist        |         16.10% |
| Manufacturing Director    |          6.90% |
| Healthcare Representative |          6.87% |
| Manager                   |          4.90% |
| Research Director         |          2.50% |

Sales Representatives have the highest observed attrition rate at **39.76%**, substantially higher than the overall workforce attrition rate of 16.1%.

Laboratory Technicians and Human Resources employees also show relatively elevated attrition rates.

These differences suggest that job role is an important dimension for more targeted retention analysis.

---

## 4. Workload & Employee Experience

### 4.1 Overtime

Employees who work overtime have an observed attrition rate of **30.53%**, compared with **10.44%** among employees who do not work overtime.

| Overtime | Attrition Rate |
| -------- | -------------: |
| No       |         10.44% |
| Yes      |     **30.53%** |

The attrition rate among employees working overtime is approximately **2.9 times** the rate among employees without overtime.

This pattern suggests that workload and overtime exposure should receive attention in retention monitoring.

However, the relationship should be interpreted as an **association rather than evidence that overtime directly causes attrition**.

---

### 4.2 Job Satisfaction

Observed attrition also differs across job satisfaction levels.

| Job Satisfaction | Attrition Rate |
| ---------------- | -------------: |
| Low              |      **22.8%** |
| Medium           |          16.4% |
| High             |          16.5% |
| Very High        |      **11.3%** |

Employees with Low Job Satisfaction have an attrition rate of **22.8%**, compared with **11.3%** among employees with Very High Job Satisfaction.

This pattern indicates that employee experience may be an important component of retention monitoring.

---

## 5. Statistical Findings

The project evaluated **14 categorical employee characteristics** using Chi-Square Tests of Independence.

Before multiple-testing correction, **11 variables** showed statistically significant associations with attrition.

After applying the **Bonferroni correction**, **9 variables remained statistically significant**:

1. Overtime
2. Job Role
3. Stock Option Level
4. Marital Status
5. Job Involvement
6. Business Travel
7. Environment Satisfaction
8. Job Satisfaction
9. Work-Life Balance

### Strongest Associations

| Variable                 | Cramér's V | Effect Size |
| ------------------------ | ---------: | ----------- |
| Overtime                 |  **0.244** | Small       |
| Job Role                 |  **0.242** | Small       |
| Stock Option Level       |  **0.203** | Small       |
| Marital Status           |  **0.177** | Small       |
| Job Involvement          |      0.139 | Small       |
| Business Travel          |      0.128 | Small       |
| Environment Satisfaction |      0.124 | Small       |
| Job Satisfaction         |      0.109 | Small       |
| Work-Life Balance        |      0.105 | Small       |

Overtime has the strongest association with attrition based on Cramér's V, followed closely by Job Role.

Despite statistical significance, **all significant associations have small effect sizes**.

Therefore, statistical significance should not be interpreted as evidence that any individual factor is a strong standalone determinant of employee attrition.

---

## 6. Variables That Did Not Remain Significant

Department and Education Field showed statistically significant unadjusted p-values but did not remain significant after Bonferroni correction.

The following variables were not statistically significant after correction:

- Department
- Education Field
- Relationship Satisfaction
- Gender
- Performance Rating

This distinction is important because an unadjusted statistical result may appear significant when multiple hypotheses are tested simultaneously.

The Bonferroni correction provides a more conservative basis for identifying statistically reliable associations within this analysis.

---

## 7. Employee Retention Risk Segmentation

A rule-based risk segmentation framework was developed using selected employee characteristics associated with attrition.

Employees were classified into three segments:

| Risk Segment | Employees | Workforce Share | Observed Attrition Rate |
| ------------ | --------: | --------------: | ----------------------: |
| Low Risk     |     1,064 |           72.4% |                   9.02% |
| Medium Risk  |       255 |           17.3% |                  25.10% |
| High Risk    |       151 |           10.3% |              **50.99%** |

The risk segmentation shows a clear increase in observed attrition across the three segments:

**Low Risk → Medium Risk → High Risk**

**9.02% → 25.10% → 50.99%**

The High Risk segment contains only **151 employees**, representing approximately **10.3% of the total workforce**, yet its observed attrition rate is approximately **51.0%**.

This makes the High Risk segment useful as a prioritization framework for deeper HR investigation.

It should not, however, be interpreted as a predictive model or as an individual employee probability of leaving.

---

## 8. High-Risk Workforce by Department

The distribution of High Risk employees varies across departments.

| Department             | Total Employees | High Risk Employees | High-Risk Rate |
| ---------------------- | --------------: | ------------------: | -------------: |
| Research & Development |             961 |             **117** |     **12.17%** |
| Human Resources        |              63 |                   6 |          9.52% |
| Sales                  |             446 |                  28 |          6.28% |

Research & Development has the largest number of High Risk employees, with **117 employees**.

It also has the highest High-Risk Rate at **12.17%**.

This is an important distinction from the department-level attrition analysis.

Sales has the highest overall attrition rate at **20.63%**, but Research & Development has the highest concentration of High Risk employees.

Therefore, **attrition volume and retention risk concentration should be evaluated separately**.

---

## 9. High-Risk Workforce by Job Role

The High-Risk Rate differs substantially across job roles.

| Job Role                  | Total Employees | High Risk Employees | High-Risk Rate |
| ------------------------- | --------------: | ------------------: | -------------: |
| Sales Representative      |              83 |                  24 |     **28.92%** |
| Laboratory Technician     |             259 |                  57 |     **22.01%** |
| Research Scientist        |             292 |                  57 |     **19.52%** |
| Human Resources           |              52 |                   6 |         11.54% |
| Manufacturing Director    |             145 |                   2 |          1.38% |
| Sales Executive           |             326 |                   4 |          1.23% |
| Healthcare Representative |             131 |                   1 |          0.76% |
| Manager                   |             102 |                   0 |          0.00% |
| Research Director         |              80 |                   0 |          0.00% |

Sales Representatives have the highest High-Risk Rate at **28.92%**.

Laboratory Technicians and Research Scientists follow with **22.01%** and **19.52%**, respectively.

These roles represent potential priority groups for more detailed retention investigation.

---

## 10. Key Business Insights

### Insight 1 — Overtime is an Important Retention Signal

Employees working overtime have an observed attrition rate of **30.53%**, compared with **10.44%** for employees without overtime.

Overtime also has the strongest Cramér's V among the categorical variables analyzed (**0.244**).

**Business implication:** HR should monitor overtime exposure and workload distribution, particularly within roles or departments experiencing elevated attrition.

---

### Insight 2 — Attrition Is Concentrated in Specific Job Roles

Sales Representatives have an observed attrition rate of **39.76%**, substantially above the overall workforce rate of 16.1%.

They also have the highest High-Risk Rate at **28.92%**.

**Business implication:** Sales Representatives should be considered a priority group for deeper retention analysis.

---

### Insight 3 — Research & Development Has the Largest High-Risk Population

Research & Development contains **117 High Risk employees**, representing **12.17%** of its workforce.

Although its overall attrition rate is lower than Sales, its High-Risk population is considerably larger.

**Business implication:** R&D should receive attention from a workforce risk perspective even though its overall attrition rate is not the highest.

---

### Insight 4 — Employee Experience Is Associated with Attrition

Job satisfaction, environment satisfaction, job involvement, and work-life balance remain statistically significant after multiple-testing correction.

For example, observed attrition is **22.8%** among employees with Low Job Satisfaction compared with **11.3%** among employees with Very High Job Satisfaction.

**Business implication:** HR retention programs should consider employee experience indicators alongside workload and job characteristics.

---

### Insight 5 — Risk Segmentation Provides a Practical Prioritization Framework

The High Risk segment represents only **10.3% of the workforce**, yet has an observed attrition rate of **50.99%**.

The difference between Low, Medium, and High Risk segments demonstrates that combining multiple employee characteristics can provide a useful way to prioritize retention analysis.

**Business implication:** HR can use risk segmentation as a monitoring framework to identify groups that warrant deeper investigation.

---

## 11. Business Recommendations

### 11.1 Monitor Overtime and Workload

HR should regularly monitor overtime exposure across departments and job roles.

Potential actions include:

- Reviewing workload distribution.
- Monitoring recurring overtime patterns.
- Identifying teams with sustained overtime exposure.
- Evaluating whether staffing levels are appropriate.
- Investigating whether overtime is concentrated among high-risk groups.

---

### 11.2 Prioritize Sales Representatives

Sales Representatives show both:

- The highest observed attrition rate: **39.76%**
- The highest High-Risk Rate: **28.92%**

HR should conduct a more detailed review of this role, potentially examining:

- Workload
- Overtime
- Job satisfaction
- Career development
- Compensation
- Business travel
- Management relationships

---

### 11.3 Monitor High-Risk Employees

The High Risk segment should be used to prioritize further HR investigation.

Rather than treating all employees identically, HR can focus additional attention on groups with multiple risk indicators.

Potential actions include:

- Retention check-ins
- Employee engagement surveys
- Manager discussions
- Workload reviews
- Career development discussions
- Compensation reviews where appropriate

---

### 11.4 Investigate Research & Development

Research & Development has:

- **117 High Risk employees**
- **12.17% High-Risk Rate**

Because of the department's workforce size, it represents the largest High Risk population.

HR should investigate whether the risk concentration is related to particular job roles, workload patterns, satisfaction levels, or other employee characteristics.

---

### 11.5 Strengthen Employee Experience Monitoring

Job satisfaction, environment satisfaction, job involvement, and work-life balance should be incorporated into regular workforce monitoring.

Instead of relying on a single employee experience metric, HR should evaluate several indicators together to identify groups that may require attention.

---

### 11.6 Use Multiple Signals for Retention Decisions

The analysis indicates that attrition is associated with multiple workforce characteristics.

Therefore, HR should avoid using a single factor as a standalone retention decision criterion.

A more appropriate framework combines:

**Workload + Job Characteristics + Employee Experience + Risk Profile**

This provides a broader basis for prioritizing retention analysis.

---

## 12. Analytical Limitations

### 12.1 Association Does Not Imply Causation

The statistical analysis identifies associations between employee characteristics and attrition.

It does not establish that any particular factor directly causes employees to leave.

---

### 12.2 Rule-Based Risk Segmentation

The employee risk segmentation is based on predefined analytical rules.

It is designed as a **retention prioritization framework**, not a predictive machine learning model.

The observed attrition rate of the High Risk group should therefore not be interpreted as an individual employee probability of attrition.

---

### 12.3 Dataset Representativeness

The dataset is a publicly available HR analytics dataset and may not represent the workforce structure, policies, compensation system, or organizational culture of a specific company.

Business decisions should therefore be validated against organization-specific HR data.

---

### 12.4 Limited Longitudinal Information

The dataset provides employee-level workforce characteristics but does not provide detailed longitudinal employee histories.

As a result, the analysis does not perform survival analysis or time-to-event modeling.

---

### 12.5 Multiple Statistical Comparisons

Fourteen categorical variables were tested against attrition.

Bonferroni correction was therefore applied to reduce the risk of false-positive findings.

This conservative correction may also reduce the ability to detect weaker associations.

---

### 12.6 Chi-Square Assumption Consideration

The `education_field` contingency table contained one expected frequency below 5.

Although the variable was not statistically significant after Bonferroni correction, its Chi-Square result should be interpreted with some caution.

---

## 13. Conclusion

The analysis shows that employee attrition is not evenly distributed across the workforce.

Several categorical characteristics are statistically associated with attrition, with **overtime and job role showing the strongest associations based on Cramér's V**. However, all statistically significant effect sizes remain relatively small, reinforcing the importance of considering multiple factors together.

The rule-based risk segmentation provides an additional perspective. The **High Risk segment contains 151 employees, or approximately 10.3% of the workforce, with an observed attrition rate of 50.99%**.

At the workforce level, Sales has the highest department-level attrition rate, while Research & Development has the largest High Risk population and the highest departmental High-Risk Rate. At the job-role level, Sales Representatives stand out with both the highest observed attrition rate and the highest High-Risk Rate.

Overall, the analysis demonstrates how combining **SQL analysis, exploratory data analysis, statistical testing, risk segmentation, and Power BI visualization** can transform employee-level HR data into a structured workforce retention framework.

The results should be used to **prioritize further investigation and retention initiatives**, rather than to make causal or individual-level predictions.
