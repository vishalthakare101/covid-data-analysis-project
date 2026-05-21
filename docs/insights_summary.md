# 📊 Insights Summary — COVID‑19 SQL Analysis

This document summarizes the key findings from the COVID‑19 mortality dataset using SQL-based analysis.

---

## 1️⃣ Jurisdiction‑Level Insights
- Some jurisdictions consistently reported higher COVID‑19 deaths compared to others.
- Total deaths varied widely across regions, reflecting differences in population size, healthcare capacity, and outbreak severity.
- Several jurisdictions recorded **total deaths higher than the overall average deaths per row**, identified using CTE-based calculations.

---

## 2️⃣ Time‑Based Insights
- The earliest reporting periods began in early 2020, aligning with the initial outbreak.
- The latest reporting periods extended into 2023, covering multiple COVID waves.
- Weekly data showed clear fluctuations, with spikes during major pandemic waves.

---

## 3️⃣ Footnote Analysis
- Footnotes were present only in meaningful rows — no empty or whitespace-only entries after trimming.
- Many footnotes indicated **suppressed values** (e.g., deaths between 1–9), which is common in public health datasets to protect privacy.
- Rows with footnotes required special handling during filtering.

---

## 4️⃣ Rate & Trend Insights
- Crude COVID‑19 death rates varied significantly across jurisdictions.
- Some states showed consistently high crude rates across multiple periods.
- Percent change week‑over‑week (where available) helped identify rising or falling mortality trends.

---

## 5️⃣ High‑Level Findings
- Jurisdictions exceeding the **average COVID‑19 deaths** were identified using a CROSS JOIN with an average-deaths CTE.
- Latest period end dates per jurisdiction were extracted using `MAX()` and date casting.
- Data cleaning was essential due to:
  - String-based date fields  
  - Numeric fields stored as text  
  - Footnotes requiring trimming  

---

## 🎯 Conclusion
The analysis highlights meaningful patterns in COVID‑19 mortality across jurisdictions and time periods.  
These insights demonstrate strong SQL skills in data cleaning, aggregation, filtering, and analytical reasoning.

