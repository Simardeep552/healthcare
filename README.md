# 🏥 Healthcare Data Analysis Project

## 📌 Project Overview
This project performs an **end-to-end analysis of healthcare data** to uncover insights related to patient demographics, hospital admissions, treatment costs, and length of hospital stay.

The project combines **Python** for data engineering, **MySQL** for structured querying, and **Power BI** for interactive dashboards to deliver meaningful insights that support healthcare decision-making.

---

## 🎯 Project Objectives
* **Demographic Profiling:** Analyze patient distribution by age groups and gender.
* **Operational Efficiency:** Understand patterns in hospital admissions and **Length of Stay (LOS)**.
* **Financial Analytics:** Identify trends in medical conditions and treatment costs.
* **Performance Evaluation:** Benchmark hospitals and doctors based on billing revenue.
* **Interactive Visualization:** Create dashboards to make healthcare metrics easily accessible.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
| :--- | :--- |
| **Python** | Data cleaning and Exploratory Data Analysis (EDA) |
| **Pandas / NumPy** | Data manipulation and numerical operations |
| **Matplotlib / Seaborn** | Statistical data visualization |
| **MySQL** | Structured data querying and analysis |
| **Power BI** | Interactive dashboard creation |

---

## 📂 Project Structure
```text
healthcare_project/
├── data/
│   └── healthcare_dataset.xlsx      # Raw healthcare data
├── python/
│   └── healthcare_analysis.ipynb    # Data cleaning & EDA
├── sql/
│   └── healthcare_analysis.sql      # Analytical SQL queries
├── powerbi/
│   └── healthcare_dashboard.pbix    # Interactive BI report
└── README.md                        # Project documentation

🔄 ## Project Workflow
1. Data Cleaning & Engineering (Python)
Using Pandas, the raw dataset was transformed for analysis:

Removed duplicates and handled invalid billing records.

Standardized column names for SQL compatibility.

Feature Engineering: Created new metrics including Length of Stay, Stay Category, and Age Category (Child, Adult, Senior).

2. Exploratory Data Analysis (EDA)
Performed statistical analysis to visualize:

Patient distribution by age and gender.

Correlation between admission type and hospital stay duration.

Billing patterns across different medical conditions.

3. SQL Analysis
The cleaned data was queried in MySQL to extract high-level business logic, such as ranking top hospitals by revenue and analyzing average costs per insurance provider.

4. Interactive Dashboard (Power BI)
Developed a multi-page dashboard featuring:

Dynamic Slicers for filtering by Hospital and Admission Type.

KPI Cards for Total Revenue, Patient Count, and Avg Length of Stay.

Performance Charts to compare doctor and hospital efficiency.

📈 Key Insights 📈 Key Insights 
Demographics: Adults and seniors represent the largest patient segment, suggesting a need for focused chronic care resources.

Operational Trends: Extended hospital stays are frequent, indicating high demand for long-term clinical management.

Financial Drivers: Admission types significantly influence total billing, with emergency cases generally resulting in higher costs.

Provider Performance: A small percentage of hospitals and doctors contribute to a significant portion of the total revenue.

🚀 Future Scope 🚀 Future Scope 
Predictive Analytics: Implement ML models to forecast patient stay duration.

Resource Management: Build a forecasting model for hospital bed availability.

Live Integration: Connect the report to a live cloud database for real-time monitoring.

👤 Author 👤 Author 
Simardeep Kaur Aspiring Data Analyst | Python, SQL, and Power BI
Simardeep Kaur Aspiring Data Analyst | Python, SQL, and Power BI
