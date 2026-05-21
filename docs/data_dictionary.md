# 📘 Data Dictionary — COVID‑19 Mortality Dataset

This document describes all columns used in the COVID‑19 mortality dataset analyzed in this project.

---

## 🧾 Column Definitions

| Column Name | Data Type (after cleaning) | Description |
|-------------|-----------------------------|-------------|
| **Jurisdiction_Residence** | VARCHAR | State, region, or jurisdiction where deaths were recorded. |
| **data_period_start** | DATE | Start date of the reporting period (converted from string). |
| **data_period_end** | DATE | End date of the reporting period (converted from string). |
| **COVID_deaths** | INT | Number of COVID‑19 deaths reported for the period. |
| **crude_COVID_rate** | FLOAT | Death rate per 100,000 population. |
| **footnote** | VARCHAR | Notes on suppressed values, special conditions, or data limitations. |
| **Group** | VARCHAR | Reporting frequency (e.g., Weekly, Monthly). |
| **pct_change_wk** | FLOAT | Percent change in deaths compared to the previous week. |

---

## 📝 Notes
- Date fields were originally stored as text and required conversion using `TRY_CAST`.
- Some numeric fields (COVID_deaths, crude_COVID_rate) contained text values and were cleaned using `TRY_CAST` or `CAST`.
- Footnotes were sometimes NULL or contained whitespace; trimming was applied before filtering.
- The dataset source is publicly available CDC COVID‑19 mortality data.

---

## 📌 Purpose of This Document
This data dictionary helps users understand:
- What each column represents  
- How the data was cleaned  
- How SQL queries interpret each field  

It ensures clarity and consistency throughout the analysis.

