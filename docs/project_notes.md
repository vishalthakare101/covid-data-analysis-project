# 📝 Project Notes — COVID‑19 SQL Analysis

These notes document the process, challenges, and decisions made during the project.

---

## ✔ Data Cleaning Notes
- `data_period_start` and `data_period_end` were stored as text → converted using `TRY_CAST`.
- `COVID_deaths` and `crude_COVID_rate` contained non‑numeric values → cleaned using `TRY_CAST` and filtering.
- Footnotes contained whitespace → trimmed using `LTRIM(RTRIM())`.
- Some rows had suppressed values (1–9 deaths) indicated in footnotes.

---

## ✔ SQL Query Development Notes
- Started with basic SELECT and filtering to understand dataset structure.
- Used `DISTINCT` to explore unique jurisdictions and reporting groups.
- Implemented aggregations to compute totals, averages, and max/min values.
- Used `GROUP BY` + `HAVING` to identify jurisdictions above average deaths.
- Applied CTEs for cleaner multi-step logic.
- Used `CROSS JOIN` to compare each jurisdiction with global averages.
- Extracted earliest and latest reporting periods using `MIN()` and `MAX()`.

---

## ✔ Power BI Notes
- Dashboard built using cleaned SQL outputs.
- Visuals included:
  - Total deaths by jurisdiction
  - Trend over time
  - Crude rate comparison
  - Footnote distribution
- Exported screenshots for GitHub.

---

## ✔ Challenges Faced
- Handling text-based dates.
- Dealing with suppressed values.
- Ensuring numeric conversions didn’t produce NULLs.
- Maintaining consistent formatting across SQL scripts.

---

## ✔ Future Improvements
- Add Python-based EDA.
- Automate SQL-to-Power BI pipeline.
- Add forecasting using time-series models.

