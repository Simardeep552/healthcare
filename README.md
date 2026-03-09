# 🏥 Healthcare Data Analysis Project

## 📌 Project Overview
This project provides an **end-to-end analytical pipeline** for healthcare data, transforming raw hospital records into actionable insights regarding patient demographics, treatment costs, and operational efficiency.

By combining **Python** for data engineering, **MySQL** for structured querying, and **Power BI** for executive-level storytelling, this project demonstrates a comprehensive approach to modern data analytics.

<img width="1327" height="740" alt="Dashboard3" src="https://github.com/user-attachments/assets/ec8b6078-eade-4211-8f27-485233ac4db4" />
<img width="1324" height="742" alt="Dashboard1" src="https://github.com/user-attachments/assets/6244c81b-f985-477a-8854-56d7b0305d76" />
<img width="1323" height="743" alt="Dashboard2" src="https://github.com/user-attachments/assets/892824da-5642-4b8f-92ec-3e5d7b9181c2" />

## 📂 Project Structure
Organizing the repository ensures scalability and ease of navigation:

```
healthcare_analysis/
│
├── data/
│   └── healthcare_dataset.csv       # Raw clinical & billing data
│
├── python/
│   ├── data_preprocessing.ipynb     # Cleaning & Feature Engineering
│   └── exploratory_analysis.ipynb   # Visualizing trends (Seaborn/Matplotlib)
│
├── sql/
│   ├── schema_setup.sql             # Table definitions & constraints
│   └── analytical_queries.sql       # Business logic & aggregations
│
├── powerbi/
│   └── healthcare_dashboard.pbix    # Final interactive report
│
├── images/
│   ├── dashboard_preview.png        # Screenshot for README
│   └── workflow_chart.png           # Process visualization
│
└── README.md                        # Project documentation
```

## 🔄 Project Workflow

### 1. Data Cleaning & Engineering (Python)
Using **Pandas**, the raw dataset was transformed and standardized:
* **Integrity:** Removed duplicates and handled invalid or outlier billing records.
* **Normalization:** Standardized column names to snake_case for seamless **SQL** compatibility.
* **Feature Engineering:** Derived new metrics to deepen analysis:
    * `Length of Stay`: (Discharge Date - Admission Date).
    * `Stay Category`: Grouping duration into Short, Medium, and Long-term.
    * `Age Category`: Segmenting patients into Child, Adult, and Senior.



### 2. Exploratory Data Analysis (EDA)
Performed statistical analysis using **Matplotlib** and **Seaborn** to visualize:
* **Demographics:** Patient distribution by age groups and gender.
* **Correlations:** Relationship between admission types and stay duration.
* **Financials:** Billing patterns across various medical conditions.

### 3. SQL Analysis
The cleaned data was migrated to **MySQL** to extract high-level business logic, including:
* Ranking top-performing hospitals by total revenue.
* Analyzing average treatment costs per insurance provider.
* Aggregating patient volume by medical specialty.

### 4. Interactive Dashboard (Power BI)
Developed a multi-page interactive report featuring:
* **Dynamic Slicers:** Real-time filtering by Hospital, Admission Type, and Gender.
* **KPI Cards:** Instant metrics for Total Revenue, Patient Count, and Avg Stay.
* **Performance Charts:** Visual benchmarking for doctor and hospital efficiency.

---

## 📈 Key Insights
* **Demographics:** Adults and seniors represent the largest patient segment, indicating a high demand for chronic care resources.
* **Operational Trends:** Extended hospital stays are frequent, suggesting a need for improved long-term clinical management or discharge planning.
* **Financial Drivers:** Admission types significantly influence total billing; emergency cases correlate with 15-20% higher costs.
* **Provider Performance:** A small percentage of "High-Volume" hospitals and doctors contribute to the majority of the total revenue.

---

## 🚀 Future Scope
* **Predictive Analytics:** Implement Machine Learning models (e.g., Random Forest) to forecast patient stay duration at admission.
* **Resource Management:** Build a forecasting model for hospital bed availability to optimize intake.
* **Live Integration:** Connect the Power BI report to a live cloud database (AWS/Azure) for real-time monitoring.

---

---

## 🚀 Getting Started

### 1. Clone the Repository


To get a local copy up and running, follow these simple steps:

```bash
git clone https://github.com/YOUR_USERNAME/healthcare_analysis.git
cd healthcare_analysis
```

## 👤 Author
**Simardeep Kaur**
*Aspiring Data Analyst | Python, SQL, and Power BI*

---
