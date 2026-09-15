# 🏦 Bank of Badami — Data Analytics Project

## 📌 Project Overview

**Bank of Badami** is a fictional banking analytics project created to analyze customer activity, accounts, transactions, loans, cards, branches, employees, and customer support interactions.

The objective of this project is to use data to answer business questions that could help bank management understand:

* How the bank's business is performing
* How customers are using banking products
* How branches are performing
* How employees and operational costs affect business performance
* How the loan portfolio is performing
* How customers are interacting with the bank
* Where potential business problems and improvement opportunities exist

The project follows a complete **Data Analyst workflow**:

> **Business Problem → Analytical Question → Data → SQL Analysis → Insight → Business Recommendation**

---

## 🎯 Business Objective

The primary objective is to analyze the bank's operational and financial data and identify meaningful patterns that can support better business decisions.

The analysis focuses on several key business areas:

1. **Overall Business Performance**
2. **Customer Analysis**
3. **Account Analysis**
4. **Transaction Analysis**
5. **Branch Performance**
6. **Employee Analysis**
7. **Loan Analysis**
8. **Card Analysis**
9. **Customer Support Analysis**
10. **Business Improvement Opportunities**

---

## 🗂️ Dataset

The project uses a relational banking dataset containing the following entities:

| Table               | Description                        |
| ------------------- | ---------------------------------- |
| `customers`         | Customer information               |
| `accounts`          | Bank account information           |
| `transactions`      | Account-level banking transactions |
| `branches`          | Bank branch information            |
| `employees`         | Employee information               |
| `loans`             | Loan information                   |
| `loan_payments`     | Loan payment information           |
| `cards`             | Customer card information          |
| `card_transactions` | Card transaction information       |
| `support_tickets`   | Customer support interactions      |

### Conceptual Data Model

```text
                    ┌──────────────┐
                    │   Customers  │
                    └──────┬───────┘
                           │
             ┌─────────────┼──────────────┐
             │             │              │
             ▼             ▼              ▼
        ┌─────────┐   ┌─────────┐   ┌───────────────┐
        │Accounts │   │  Loans  │   │Support Tickets│
        └────┬────┘   └────┬────┘   └───────────────┘
             │             │
       ┌─────┴─────┐       ▼
       │           │  ┌──────────────┐
       ▼           ▼  │Loan Payments │
┌────────────┐ ┌──────────┐
│Transactions│ │  Cards   │
└────────────┘ └────┬─────┘
                    │
                    ▼
             ┌─────────────────┐
             │Card Transactions│
             └─────────────────┘

                    ┌────────────┐
                    │  Branches  │
                    └──────┬─────┘
                           │
                           ▼
                    ┌────────────┐
                    │ Employees  │
                    └────────────┘
```

> The relationships shown above represent the analytical structure of the project. Actual joins and foreign-key relationships are validated during the SQL analysis.

---

# 🔍 Step 1 — Understanding the Data

Before creating dashboards or writing large SQL queries, the first objective is to understand the business.

Instead of starting with:

> "What charts can I create?"

the project starts with:

> "What questions would management need answers to?"

This helps ensure that every analysis and visualization has a clear business purpose.

---

## 💰 1. Business Performance

### Key Business Questions

* Is the bank's revenue increasing or decreasing over time?
* How does the current month's performance compare with previous months?
* Which banking activities contribute to revenue?
* Is business growth accompanied by increasing costs?
* Are there branches that are underperforming?
* Is the bank becoming more efficient over time?

### Potential Metrics

* Monthly revenue
* Month-over-month revenue growth
* Transaction activity
* Loan-related income
* Branch revenue
* Branch expenses
* Revenue-to-expense ratio
* Revenue per employee

> Revenue attribution will only be calculated where the available dataset provides sufficient information. Transaction activity should not automatically be treated as bank revenue or commission income without supporting data.

---

# 👥 2. Customer Analysis

Customers are one of the most important business dimensions for a bank.

### Key Business Questions

* How large is the customer base?
* Is the customer base growing?
* How active are customers?
* Which customers use multiple banking products?
* Are customers actively using their accounts?
* Are customers taking loans or using cards?
* Are customers closing accounts?
* Are there signs of declining customer engagement?

### Potential Metrics

* Total customers
* New customers
* Active customers
* Customer growth rate
* Average accounts per customer
* Average transactions per customer
* Customers with loans
* Customers with cards
* Product adoption rate
* Account closure rate

---

# 🏦 3. Account Analysis

Accounts provide an important view of customer acquisition and retention.

### Key Business Questions

* How many accounts are opened each month?
* How many accounts are closed?
* Is the bank's account base growing?
* Are account closures increasing?
* Which account types are most popular?
* Are certain branches experiencing higher account closures?

### Potential Metrics

* Accounts opened
* Accounts closed
* Net account growth
* Account opening growth rate
* Account closure growth rate
* Account type distribution
* Accounts per customer
* Branch-level account growth

### Example Business Metric

```text
Net Account Growth
= Accounts Opened - Accounts Closed
```

This is more meaningful than looking at account openings alone.

---

# 💳 4. Transaction Analysis

Transactions can provide a strong indication of customer engagement and banking activity.

### Key Business Questions

* Is transaction activity increasing?
* How does transaction volume change month over month?
* Which transaction types are most common?
* Which branches/accounts/customers generate the highest activity?
* Are transaction values increasing?
* Are customers becoming more or less active?

### Potential Metrics

* Transaction count
* Transaction value
* Monthly transaction growth
* Average transaction value
* Transactions per customer
* Transactions per account
* Debit vs credit activity
* Transaction type distribution

### Important Analytical Consideration

Transaction volume should not automatically be interpreted as revenue.

A transaction may indicate:

* Customer engagement
* Product usage
* Payment activity
* Potential fee-generating activity

Further analysis is required to determine whether transaction activity actually contributes to bank revenue.

---

# 🏢 5. Branch Performance Analysis

Branches are analyzed to understand differences in business performance, costs, customer activity, and resource utilization.

### Key Business Questions

* Which branches are performing well?
* Which branches are underperforming?
* Are branch revenues sufficient to cover branch expenses?
* Which branches have high customer activity?
* Are branches using their resources efficiently?
* Are there branches with high costs but relatively low business activity?

### Potential Metrics

* Branch revenue
* Branch expenses
* Revenue-to-expense ratio
* Customers per branch
* Employees per branch
* Revenue per employee
* Customers per employee
* Transactions per branch
* Accounts opened per branch
* Accounts closed per branch

### Why Normalization Matters

Comparing branches using only total revenue can be misleading.

For example:

```text
Branch A
Revenue = ₹50 lakh
Employees = 50

Branch B
Revenue = ₹30 lakh
Employees = 10
```

Branch A has higher revenue, but Branch B may be significantly more efficient.

Therefore, metrics such as:

```text
Revenue per Employee
Customers per Employee
Revenue / Expense
```

can provide a fairer comparison.

---

# 👨‍💼 6. Employee Analysis

Employees represent a major operational cost and are responsible for serving customers and supporting banking operations.

### Key Business Questions

* Is employee cost reasonable relative to branch business?
* Are employees distributed appropriately across branches?
* Are some branches overstaffed or understaffed?
* Are there recurring employee-related issues?
* Could training or process issues be contributing to customer problems?

### Potential Metrics

* Employee count
* Employee cost
* Employee cost as % of branch revenue
* Employees per branch
* Customers per employee
* Revenue per employee
* Employee distribution by branch

### Training Hypothesis

One analytical hypothesis explored in the project is:

> **If employees are well trained, customer-related issues may be lower.**

However, high support-ticket volume alone cannot prove poor employee training.

Other possible causes include:

* Product issues
* System bugs
* Process problems
* Customer misunderstanding
* Policy changes

Therefore, support-ticket categories and patterns must be analyzed before drawing conclusions.

---

# 💰 7. Loan Analysis

Loans are an important part of banking because they can generate interest income but also introduce credit risk.

### Key Business Questions

* How large is the loan portfolio?
* Is the loan portfolio growing?
* Which loan types are most common?
* What is the repayment performance?
* Are defaults increasing?
* Which branches or customer segments have higher default risk?
* How much financial exposure is associated with defaults?

### Potential Metrics

* Total loans
* Total loan amount
* Loan disbursement
* Average loan amount
* Loan count by type
* Monthly loan growth
* Payment amount
* Outstanding amount
* Default count
* Default rate
* Default exposure

### Important Analytical Consideration

Default **count** alone is not enough.

For example:

```text
Scenario A
10 defaults
Total exposure = ₹1 crore

Scenario B
5 defaults
Total exposure = ₹100 crore
```

Scenario B has fewer defaults but potentially much greater financial risk.

Therefore, the analysis should consider both:

> **Default frequency + Financial exposure**

---

# 💳 8. Card Analysis

Cards provide another view of customer product adoption and transaction behavior.

### Key Business Questions

* How many customers use cards?
* Is card adoption increasing?
* Which card types are most popular?
* How frequently are cards being used?
* What is the average card transaction value?
* Are certain customers or branches driving card activity?
* Is card usage increasing or declining?

### Potential Metrics

* Number of cards
* Cards per customer
* Card adoption rate
* Card transaction count
* Card transaction value
* Average card transaction value
* Monthly card activity
* Card activity growth rate

---

# 🎧 9. Customer Support Analysis

Support tickets can provide valuable information about customer experience and operational problems.

### Key Business Questions

* Are support tickets increasing?
* What are the most common customer issues?
* Are the same issues repeatedly reported?
* Which branches/products generate more issues?
* Are certain issues concentrated within particular periods?
* Are recurring issues indicating a product or process problem?

### Potential Metrics

* Total support tickets
* Monthly support-ticket growth
* Tickets by category
* Tickets by branch
* Tickets by customer
* Recurring issue categories
* Resolution-related metrics, where available

### Analytical Principle

A rise in support tickets does not automatically mean customer service has become worse.

The analysis should identify:

```text
Ticket Increase
      ↓
What type of issue?
      ↓
Which customers/branches/products?
      ↓
Is the issue recurring?
      ↓
Possible root cause
      ↓
Business action
```

---

# 📊 Step 2 — Business Analysis & Dashboard Development

After identifying the business questions, the next phase is to perform detailed SQL analysis.

The analysis will be organized into business categories rather than simply by database table.

### Dashboard Areas

#### 1. Executive Dashboard

A high-level overview of bank performance.

Possible KPIs:

* Total Customers
* Total Accounts
* Total Transactions
* Total Loans
* Loan Portfolio
* Total Cards
* Support Tickets
* Revenue
* Revenue Growth
* Net Account Growth

---

#### 2. Customer Dashboard

Focuses on:

* Customer growth
* Customer activity
* Product adoption
* Account behavior
* Customer segmentation

---

#### 3. Branch Dashboard

Focuses on:

* Branch revenue
* Branch expenses
* Profitability/efficiency
* Customers
* Employees
* Transactions
* Account growth

---

#### 4. Loan Dashboard

Focuses on:

* Loan portfolio
* Loan types
* Loan growth
* Repayment behavior
* Defaults
* Financial exposure

---

#### 5. Transaction Dashboard

Focuses on:

* Transaction volume
* Transaction value
* Transaction types
* Monthly trends
* Customer activity

---

#### 6. Customer Support Dashboard

Focuses on:

* Ticket volume
* Ticket trends
* Recurring issues
* Issue categories
* Branch/product patterns

---

# 🧠 Step 3 — Business Improvement Questions

The final stage moves beyond reporting.

The objective is to ask:

> **"What should the bank do differently based on what the data shows?"**

Potential areas of investigation include:

### Customer Growth

* How can the bank increase customer acquisition?
* Why are customers closing accounts?
* Which products can improve customer retention?

### Customer Engagement

* Which customers are highly engaged?
* Which customers have low product adoption?
* How can the bank increase usage of its products?

### Branch Performance

* Which branches are inefficient?
* Why are certain branches underperforming?
* Should staffing or resources be redistributed?

### Loan Risk

* Which loan segments have higher default risk?
* Is the bank taking disproportionate risk for the revenue generated?
* Which branches or customer groups require closer monitoring?

### Customer Experience

* What are the most common customer problems?
* Which issues are recurring?
* Can recurring issues be solved through product, process, or employee improvements?

---

# 🛠️ Tools & Technologies

The project uses:

* **SQL** — Data exploration, transformation, aggregation, joins, CTEs, window functions and analytical queries
* **Databricks** — Data loading, SQL analysis and data processing
* **Python** — Dataset inspection and supporting analysis where required
* **Power BI / Data Visualization** — Dashboard development and visualization
* **GitHub** — Project documentation and version control

---

# 📁 Project Structure

```text
Bank-of-Badami/
│
├── README.md
│
├── SQL/
│   ├── 01_data_exploration.sql
│   ├── 02_business_performance.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_account_analysis.sql
│   ├── 05_transaction_analysis.sql
│   ├── 06_branch_analysis.sql
│   ├── 07_employee_analysis.sql
│   ├── 08_loan_analysis.sql
│   ├── 09_card_analysis.sql
│   └── 10_support_analysis.sql
│
├── Charts/
│   ├── executive_dashboard.png
│   ├── customer_analysis.png
│   ├── branch_analysis.png
│   ├── loan_analysis.png
│   └── support_analysis.png
│
└── Dashboard/
    └── bank_of_badami.pbix
```

---

# 🔎 Analytical Approach

Each analysis follows the same framework:

### 1. Define the Business Problem

Identify what management needs to understand.

### 2. Convert the Problem into an Analytical Question

Turn the business problem into something measurable.

### 3. Identify the Required Data

Determine which tables and columns are required.

### 4. Validate the Data

Check:

* Null values
* Duplicate records
* Invalid values
* Date ranges
* Relationships
* Data consistency

### 5. Perform SQL Analysis

Use SQL to calculate relevant metrics and identify patterns.

### 6. Visualize the Results

Create charts and dashboards that communicate the findings clearly.

### 7. Generate Insights

Explain what the results mean from a business perspective.

### 8. Recommend Actions

Translate insights into potential business decisions.

---

# 📈 Key Analytical Principles Used

This project emphasizes **business thinking rather than simply writing SQL queries**.

Some of the principles include:

### Don't confuse activity with revenue

High transaction volume does not automatically mean high revenue.

### Don't rely only on absolute numbers

A branch with higher revenue is not necessarily more efficient.

### Normalize metrics when comparing entities

Examples:

```text
Revenue per Employee
Customers per Employee
Transactions per Customer
Tickets per Customer
```

### Don't confuse correlation with causation

For example:

> High support tickets ≠ Poor employee training

The underlying cause must be investigated.

### Consider both frequency and financial impact

For loan defaults:

> Default count alone ≠ Total credit risk

### Move from "What happened?" to "Why?" and "What should we do?"

```text
What happened?
      ↓
Why did it happen?
      ↓
What is the business impact?
      ↓
What should management do?
```

---

# 🚧 Project Status

| Phase                           | Status         |
| ------------------------------- | -------------- |
| Dataset understanding           | 🟢 In Progress |
| Business problem identification | 🟢 In Progress |
| Data validation                 | 🔵 Planned     |
| SQL analysis                    | 🔵 Planned     |
| Business insights               | 🔵 Planned     |
| Charts                          | 🔵 Planned     |
| Dashboard                       | 🔵 Planned     |
| Business recommendations        | 🔵 Planned     |

---

# 🎯 Expected Outcome

The final project will demonstrate the ability to:

* Understand a relational banking dataset
* Translate business problems into analytical questions
* Identify appropriate metrics
* Perform data validation
* Write analytical SQL queries
* Analyze trends and relationships
* Compare business units fairly
* Identify potential business problems
* Build meaningful visualizations
* Communicate insights to stakeholders
* Convert analytical findings into business recommendations

---

# 👤 About the Project

This project was created as a practical **Data Analyst portfolio project** to demonstrate end-to-end analytical thinking using a realistic banking dataset.

The focus is not only on producing SQL queries and dashboards, but on understanding:

> **Why the analysis is being performed, what the numbers mean, and what decision they can support.**

---

## ⭐ Key Takeaway

A good analytics project should not end with:

> "Here is the dashboard."

It should answer:

> **"What is happening in the business, why is it happening, and what should the business do about it?"**
