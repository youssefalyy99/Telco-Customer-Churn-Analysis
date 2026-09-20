# Telco-Customer-Churn-Analysis
[![Python](https://img.shields.io/badge/Python-3.9%2B-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Jupyter Notebook](https://img.shields.io/badge/Jupyter%20Notebook-Notebook-F37626?logo=jupyter&logoColor=white)](https://jupyter.org/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)

End-to-end customer churn analysis using Python for data cleaning and EDA, SQL Server for business analysis, and Power BI for interactive visualization.



## 📌 Project Overview

A telecom provider wants to understand why customers cancel their subscriptions (churn) and identify the customer segments most at risk of leaving. The goal of this project is to analyze customer behavior, services, contracts, payment methods, tenure, and monthly charges to uncover patterns associated with churn and provide insights that can help prioritize customer retention campaigns.

## 📁 Dataset

The dataset used in this project is the **Telco Customer Churn** dataset, sourced from **Kaggle**.

### Dataset Overview

| Attribute           | Details                        |
| ------------------- | ------------------------------ |
| **Source**          | [[Kaggle link](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)] |
| **Rows**            | 7043             |
| **Columns**         | 21            |
| **Target Variable** | `Churn`                        |
| **Data Type**       | CSV           |

### Description

The data set includes information about:
- Customers who left within the last month – the column is called Churn
- Services that each customer has signed up for – phone, multiple lines, internet, online security, online backup, device protection, tech support, and streaming TV and movies
- Customer account information – how long they’ve been a customer, contract, payment method, paperless billing, monthly charges, and total charges
- Demographic info about customers – gender, age range, and if they have partners and dependents

It includes information related to:

* **Customer information:** [e.g. gender, senior citizen, dependents]
* **Account information:** [e.g. tenure, contract, payment method]
* **Services:** [e.g. internet service, phone service, streaming services]
* **Financial information:** [e.g. monthly charges, total charges]
* **Churn:** [briefly explain what the `Churn` column represents]


 **Note:** The original dataset was used for this project, with data preparation and transformations performed during the Python analysis stage.


## 🎯 Business Questions Answered

The analysis focuses on answering the following business questions:

* What is the churn rate by **contract type, payment method, and internet service type**?
* What is the **average tenure and monthly charge** for churned vs. retained customers?
* Which customers combine a **Month-to-month contract with high monthly charges**?
* Which **subscribed services** are most associated with churn?
* How does the **churn rate vary across different tenure groups** (0–12, 13–24, 25–48, and 48+ months)?
* What is the churn rate for **combinations of two categorical features** (e.g., contract type × payment method) to identify the highest-risk customer segments?

## 🔄 Project Workflow

The project follows an end-to-end data analysis workflow, taking the data from its raw form to an interactive business intelligence dashboard.

```text
📁 Raw Dataset
      ↓
🐍 Data Preparation & EDA
      ↓
🗄️ SQL Server Analysis
      ↓
📊 Power BI Dashboard
      ↓
💡 Business Insights
```

### 1. 🐍 Data Preparation & EDA

The dataset is prepared and explored using **Python, Pandas, and Matplotlib**. This stage includes data validation, preprocessing, exploratory analysis, and visualization.

📂 [View Python Analysis](https://github.com/youssefalyy99/Telco-Customer-Churn-Analysis/tree/main/Python)

### 2. 🗄️ SQL Server Analysis

The prepared data is analyzed using **SQL Server and T-SQL** to answer the defined business questions and identify customer segments associated with higher churn.

📂 [View SQL Analysis](https://github.com/youssefalyy99/Telco-Customer-Churn-Analysis/blob/main/SQL/DataAnalysisSQL.sql)


### 3. 📊 Power BI Dashboard

The analysis is presented through an interactive **Power BI dashboard**, allowing users to explore churn patterns across different customer characteristics and services.

📂 [View Dashboard]((https://github.com/youssefalyy99/Telco-Customer-Churn-Analysis/tree/main/Dashboard))

## 🛠️ Tools & Technologies

The project uses the following tools and technologies:

| Tool / Technology | Purpose |
|---|---|
| **Python** | Data cleaning, preprocessing, exploratory data analysis, and visualization |
| **Pandas** | Data manipulation, transformation, and analysis |
| **Matplotlib** | Data visualization and exploratory analysis |
| **SQL Server / T-SQL** | Customer segmentation, aggregation, and answering business questions |
| **Power BI** | Interactive dashboard development and business insights |
| **Jupyter Notebook** | Python-based analysis and documentation |
| **Git & GitHub** | Version control and project documentation |
