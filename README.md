# Customer-Churn-Analysis-Using-SQL-and-Power-BI

### Project Description
A SQL and Power BI-based project focused on customer churn analysis. This project explores customer behavior, engagement, and satisfaction patterns to identify key churn drivers and high-risk segments, delivering actionable insights through data analysis and interactive visualizations.

---

### Objectives
- Understand factors driving customer churn
- Identify high-risk customer segments
- Analyze behavioral, demographic, and financial patterns
- Present insights using data visualization

---

### Data Preparation & Feature Engineering
- Cleaned and prepared dataset for analysis
- Created new features:
  - Customer Tenure Group
  - Login Engagement Level
  - Churn Risk Category
  - Churn Probability Level
  - Age Group

---

### Exploratory Data Analysis

Overall Churn:
- Total Customers: 15,000
- Churn Rate: 31.89%

Key Insights:
- Tenure: Customers in the first 1–10 months show the highest churn (40–55%)
- Engagement: Low usage → 49% churn | High usage → ~23% churn
- Support Tickets: >5 tickets → 55%+ churn | 11 tickets → 100% churn
- Satisfaction: Low satisfaction → ~79% churn | Score 5 → ~6% churn
- Contract Type: Monthly → 47.68% | Yearly → 19.68%
- Subscription Type: Basic users churn more than premium users
- Demographics: Minimal impact on churn

---

### Risk Profiling
Customer segments:
- High Risk
- Low Risk
- Dissatisfied
- Inactive
- Normal

Churn Rates:
- Inactive: 87.79%
- Dissatisfied: 70.1%
- Normal: 6.92%

---

### Combined Insights
- New + Low Engagement → Highest churn risk
- Long-term + High Engagement → Lowest churn risk

Churn pattern:
Low usage → Issues → Dissatisfaction → Inactivity → Churn

---

### Business Recommendations
- Focus on early-stage customer retention
- Improve customer support and issue resolution
- Monitor and act on low satisfaction scores
- Re-engage inactive and low-usage users
- Promote premium plans and long-term subscriptions

---

### Project Structure
- Dataset
- SQL Queries
- Power BI Dashboard (.pbix)
- Final Report (Word)

---

### Power BI Dashboard Overview
The interactive dashboard provides a visual exploration of churn patterns and key drivers:

- Churn rate overview (KPIs)
- Churn by tenure, engagement, and subscription type
- Customer segmentation by risk category
- Support tickets vs churn analysis
- Satisfaction score impact
- Revenue insights (monthly & total charges)

Purpose:
To help identify high-risk customers quickly and support data-driven decision-making.
! [ Dashboard Preview ](view.png)

