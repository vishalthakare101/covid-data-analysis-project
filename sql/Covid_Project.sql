                         --|| COVID DATA ANALYSIS PROJECT || --

                         -- || SQL ANALYSIS  & INSIGHTS || --

------------------------------------------------------------------------------------------------------------------
-- Q1  Retrieve top 5 jurisdictions with highest total deaths.
-->>
SELECT TOP 5
    Jurisdiction_Residence,
    SUM(TRY_CAST(COVID_deaths AS INT)) AS total_deaths
FROM dbo.analytics_dataset_raw
GROUP BY Jurisdiction_Residence
ORDER BY total_deaths DESC;

-- This helps identify the regions with the highest mortality burden, 
-- which is useful for prioritizing monitoring and hospital preparedness.
-----------------------------------------------------------------------------------------------------------------------
-- Q2 Find top 3 weeks with highest deaths per jurisdiction .
-->>
WITH ranked_weeks AS (
    SELECT
        Jurisdiction_Residence,
        TRY_CAST(Data_Period_End AS DATE) AS Data_Period_End,
        TRY_CAST(COVID_deaths AS INT) AS covid_deaths,
        ROW_NUMBER() OVER (
            PARTITION BY Jurisdiction_Residence
            ORDER BY TRY_CAST(COVID_deaths AS INT) DESC,
                     TRY_CAST(Data_Period_End AS DATE) DESC
        ) AS rn
    FROM dbo.analytics_dataset_raw
    WHERE [Group] = 'weekly'
      AND TRY_CAST(COVID_deaths AS INT) IS NOT NULL
)
SELECT
    Jurisdiction_Residence,
    Data_Period_End,
    covid_deaths
FROM ranked_weeks
WHERE rn <= 3
ORDER BY Jurisdiction_Residence, rn;

-- This helps identify the peak weeks in each region, 
-- which is useful for understanding surge periods and planning hospital response.
-------------------------------------------------------------------------------------------------------------------------
-- Q3 Rank jurisdictions by crude rate within each group.
-->>
WITH ranked_crude_rate AS (
    SELECT 
        [Group],
        Jurisdiction_Residence,
        TRY_CAST(crude_COVID_rate AS FLOAT) AS crude_rate,
        DENSE_RANK() OVER (
            PARTITION BY [Group]
            ORDER BY TRY_CAST(crude_COVID_rate AS FLOAT) DESC
        ) AS rate_rank
    FROM dbo.analytics_dataset_raw
    WHERE TRY_CAST(crude_COVID_rate AS FLOAT) IS NOT NULL
)
SELECT 
    [Group],
    Jurisdiction_Residence,
    crude_rate,
    rate_rank
FROM ranked_crude_rate
-- WHERE rate_rank <= 10
ORDER BY [Group], rate_rank, Jurisdiction_Residence;

--This helps compare which jurisdictions are worst affected in each reporting category,
-- not just by raw deaths but by rate-based severity.

----------------------------------------------------------------------------------------------------------------------------
-- Q4 Compare the crude COVID death rates for different groups, but only for jurisdictions where the total number of deaths exceeds a certain threshold (e.g. 100). 

WITH eligible_jurisdictions AS (
    SELECT
        Jurisdiction_Residence
    FROM dbo.analytics_dataset_raw
    WHERE TRY_CAST(COVID_deaths AS FLOAT) IS NOT NULL
    GROUP BY Jurisdiction_Residence
    HAVING SUM(TRY_CAST(COVID_deaths AS FLOAT)) > 150
)
SELECT
    a.Jurisdiction_Residence,
    MAX(CASE WHEN a.[Group] = 'total'
             THEN TRY_CAST(a.crude_COVID_rate AS FLOAT) END) AS total_crude_rate,
    MAX(CASE WHEN a.[Group] = 'weekly'
             THEN TRY_CAST(a.crude_COVID_rate AS FLOAT) END) AS weekly_crude_rate,
    MAX(CASE WHEN a.[Group] = '3 month period'
             THEN TRY_CAST(a.crude_COVID_rate AS FLOAT) END) AS [3_month_period_crude_rate]
FROM dbo.analytics_dataset_raw AS a
INNER JOIN eligible_jurisdictions AS e
    ON a.Jurisdiction_Residence = e.Jurisdiction_Residence
WHERE TRY_CAST(a.crude_COVID_rate AS FLOAT) IS NOT NULL
GROUP BY a.Jurisdiction_Residence
ORDER BY a.Jurisdiction_Residence;

-- This makes it easier to compare how crude rates differ across reporting groups 
-- and focus only on regions with significant COVID mortality.
------------------------------------------------------------------------------------------------------
-- Q5 Find average COVID deaths per week for the latest 4 end dates.

WITH latest_4_dates AS (
    SELECT DISTINCT TOP 4
        TRY_CAST(data_period_end AS DATE) AS end_date
    FROM dbo.analytics_dataset_raw
    WHERE TRY_CAST(data_period_end AS DATE) IS NOT NULL
      AND [Group] = 'weekly'
    ORDER BY TRY_CAST(data_period_end AS DATE) DESC
)
SELECT
    TRY_CAST(a.data_period_end AS DATE) AS end_date,
    ROUND(AVG(TRY_CAST(a.COVID_deaths AS FLOAT)), 2) AS avg_covid_deaths_per_week
FROM dbo.analytics_dataset_raw AS a
INNER JOIN latest_4_dates AS l
    ON TRY_CAST(a.data_period_end AS DATE) = l.end_date
WHERE a.[Group] = 'weekly'
  AND TRY_CAST(a.COVID_deaths AS FLOAT) IS NOT NULL
GROUP BY TRY_CAST(a.data_period_end AS DATE)
ORDER BY end_date DESC;

-- This gives a short recent trend summary and helps understand the 
-- latest mortality level instead of looking only at the full historical record.
----------------------------------------------------------------------------------------
