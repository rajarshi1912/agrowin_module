#Total Final Flow - Step 5

WITH
  #Total Final Flow - Step 2
  max_year_per_group AS (
 SELECT
  country,     
  crop_main_group,     
  indication,     
  MAX(year) AS max_year_per_group,
  COUNT (DISTINCT year) as unique_years 
  FROM bcs-edf-ingestion-np.gc_agrowin_cz.in_season   
  GROUP BY country, crop_main_group, indication),

  #Total Final Flow - Step 3
  max_year_total AS (
  SELECT
    MAX(year) AS max_year_total
  FROM bcs-edf-ingestion-np.gc_agrowin_cz.in_season)
   
#Step 6 -To remove field max_year_total and max_year_per_group
SELECT
  country, 
  crop_main_group, 
  indication,
  #Step 6- Rename the field from Pre-Completeness Flag to Completeness Flag
  IF(max_year_total=max_year_per_group AND unique_years > 1,"Only Comparable Data","All Data") AS completeness_flag 
FROM max_year_total a
RIGHT JOIN max_year_per_group b
ON a.max_year_total = b.max_year_per_group;