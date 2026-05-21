# 📊 Power BI Dashboard — COVID‑19 Analysis

This document explains the structure, visuals, and purpose of the Power BI dashboard created for the COVID‑19 mortality analysis project.

---

## 🎯 Dashboard Objective
To visually represent COVID‑19 mortality trends, jurisdiction-level comparisons, and rate fluctuations using interactive Power BI visuals.  
The dashboard complements the SQL analysis by providing clear, intuitive insights.

---

## 🧱 Dashboard Components

### 1️⃣ **Total COVID‑19 Deaths by Jurisdiction**
- Bar chart showing total deaths for each state/region.
- Helps identify the most affected jurisdictions.
- Uses aggregated SQL output.

---

### 2️⃣ **Trend Over Time (Line Chart)**
- Displays deaths across reporting periods.
- Highlights major COVID waves.
- Uses cleaned date fields (`data_period_start` / `data_period_end`).

---

### 3️⃣ **Crude COVID Rate Comparison**
- Column or bar chart comparing crude death rates.
- Shows which jurisdictions had higher mortality relative to population.

---

### 4️⃣ **Footnote Distribution**
- Pie or bar chart showing:
  - Suppressed values
  - Special notes
  - Missing/clean rows
- Helps understand data quality and limitations.

---

### 5️⃣ **Weekly Percent Change (Optional Visual)**
- Line or KPI card showing week‑over‑week change.
- Useful for identifying rising or falling trends.

---

## 🧩 Data Model Notes
- SQL-cleaned data imported into Power BI.
- Date fields converted to proper DATE type.
- Numeric fields cast to INT/FLOAT before loading.
- No complex relationships required (single-table model).

---

## 🖼 Screenshots
Dashboard screenshots are stored in the `images/` folder for GitHub preview.

---

## 📌 Purpose of This Dashboard
- Provide a visual summary of SQL findings.
- Make trends and patterns easier to understand.
- Support the final PPT presentation.
- Strengthen the project for portfolio and interviews.

---

## 🎯 Conclusion
The Power BI dashboard transforms raw SQL outputs into clear, interactive visuals that highlight key COVID‑19 insights across jurisdictions and time periods.

