

# Insurance Renewal Funnel & Churn Prediction Dashboard | Python, Logistic Regression, Tableau

## Project Overview
Customer retention is critical in health insurance, especially for high-value policies nearing renewal.

This project analyzes customer renewal behavior in a health insurance customer portal and predicts churn risk using SQL, Python, Machine Learning, and Tableau.

---

## Business Problem
Identify customers approaching renewal who have:
- High portal engagement
- Pending payment status
- High churn probability

Goal:
Increase policy renewal conversions through targeted retention strategies.

---

## Tech Stack
- SQL
- Python
- Pandas
- Seaborn
- Scikit-learn
- Logistic Regression
- Tableau

---

## Project Workflow

### 1. SQL Layer
Created Renewal Risk table by joining:
- Customer Profiles
- Policy Details
- Portal Web Logs

Business constraints:
- Policy expires within next 30 days
- Logged in at least 3 times in last 14 days
- Payment pending
- Ranked by lifetime premium value

---

### 2. Python Layer

#### Exploratory Data Analysis
Key findings:
- 26–35 and 46–55 age groups show highest churn risk
- Child Care policies have higher churn
- High & Medium premium customers show elevated churn probability

#### Predictive Modeling
Built Logistic Regression model to calculate:
- Churn Probability Score
- Risk Segmentation:
  - High Risk
  - Medium Risk
  - Low Risk

#### Retention Rules
Automated intervention logic:
- If churn probability > 70%
- AND comprehensive cover eligible

Offer:
- 5% loyalty discount
- Free tele-consultation add-on

---

### 3. Tableau Dashboard

Built Renewal Propensity Dashboard with:

- Funnel View:
  Login → Dashboard → Payment → Renewal

- Age vs Churn
- Policy Type vs Churn
- Premium vs Churn
- Risk Segmentation
- Customer Funnel

---

## Key Insights
- 26–35 and 46–55 age groups show highest churn risk
- Child Care policies have higher churn
- High & Medium premium customers show elevated churn probability
- Majority customers fall into Low Risk segment
- Funnel analysis shows drop-off near payment/renewal stage

---

## Recommendations
- Premium customer loyalty discounts
- Renewal reminders for high & medium-risk users
- Targeted retention campaigns for Child Care segment    
