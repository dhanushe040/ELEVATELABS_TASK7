# ELEVATELABS_TASK7

📘 SQL Views and Query Summary
This repository contains a curated set of SQL views and queries designed to analyze employee records, customer behavior, and movie rental patterns. Each view is crafted with clarity, using advanced SQL techniques like window functions, conditional logic, and set operations.

👥 Employee Insights
🔍 All Employee Records Full snapshot of employee details including department, role, and salary.

📊 Employee Salary Aggregation by Department Uses window functions to compute total, average, min, max, and count of salaries per department.

📈 Employee Salary Contribution Percentage Calculates each employee’s salary as a percentage of the total salary expenditure.

🏆 Top Earners by Department: Sales, Accounts, and IT Filters employees with the highest salary in each of the specified departments.

⚖️ Employees with Mid-Range Salaries Identifies employees whose salaries fall between the minimum and maximum values.

👨‍👩‍👧‍👦 Gender-Wise Department Distribution Counts male and female employees across Sales, Accounts, and IT departments.

🛍️ Customer & Sales Analysis
📅 Identifying January-Only Customers in Swiggy Orders Uses EXCEPT to find customers who ordered in January but not in February.

📦 Quarterly Sales Breakdown by Representative Displays quarterly sales figures for each representative using conditional logic.

🎬 Movie Rental Classification
🍿 Movie Review Classification Based on Rental Duration Categorizes rentals based on how long the movie was kept:

≤ 3 days → “one time watched”

4–6 days → “most liked”

🧠 Techniques Used
🪟 Window Functions for aggregations and percentage calculations

🧮 Conditional CASE Statements for classification and breakdowns

🔄 Set Operations like EXCEPT for filtering

🧩 Partitioning for department-level insights

📝 Readable View Titles for documentation clarity
