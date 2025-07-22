#Total Final Flow - Step 5

WITH
  #Total Final Flow - Step 2
  max_year_per_group AS (
 SELECT
  country,     
  crop_main_group,     
  indication,     
  MAX(year) AS max_year_per_group,
  #COUNT (DISTINCT year) as unique_years 
  FROM bcs-edf-ingestion.gc_agrowin_cz.in_season   
  GROUP BY country, crop_main_group, indication),

  #Total Final Flow - Step 3
  max_year_total AS (
  SELECT
    MAX(year) AS max_year_total
  FROM bcs-edf-ingestion.gc_agrowin_cz.in_season),
   


PrevYearCheck AS (
    SELECT DISTINCT country,     
  crop_main_group,     
  indication,year AS Prev_Year
    FROM bcs-edf-ingestion.gc_agrowin_cz.in_season   
),

status_prev_year as(
SELECT
m.country,     
  m.crop_main_group,     
  m.indication,
    m.max_year_per_group,
    CASE
        WHEN p.Prev_Year IS NOT NULL THEN 'PY Exists'
        ELSE 'PY Missing'
    END AS py_status
FROM max_year_per_group m
LEFT JOIN PrevYearCheck p
    ON m.country=p.country and m.crop_main_group=p.crop_main_group and m.indication=p.indication and p.Prev_Year = m.max_year_per_group - 1 )  

#Step 6 -To remove field max_year_total and max_year_per_group
SELECT
  b.country, 
  b.crop_main_group, 
  b.indication,
  #Step 6- Rename the field from Pre-Completeness Flag to Completeness Flag
  IF(a.max_year_total=b.max_year_per_group AND s.py_status = 'PY Exists',"Only Comparable Data","All Data") AS completeness_flag 
FROM max_year_total a
RIGHT JOIN max_year_per_group b
ON a.max_year_total = b.max_year_per_group left join status_prev_year s on b.max_year_per_group=s.max_year_per_group  and b.country=s.country and b.crop_main_group=s.crop_main_group and b.indication=s.indication;