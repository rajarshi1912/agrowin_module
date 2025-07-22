#Advanced analytics - Step 45
WITH
  #Advanced analytics - Step 42
  filter_nulls AS(
  SELECT
    *
  FROM bcs-edf-ingestion.gc_agrowin_cz.comparable_data_flow
  WHERE area_treated_000_ha IS NOT NULL),
  
  #Advanced analytics - Step 43
  max_year AS(
  SELECT
    MAX(year) AS year
  FROM bcs-edf-ingestion.gc_agrowin_cz.comparable_data_flow),

  #Advanced analytics - Step 44
  grouped_max_year AS(
  SELECT
    country,
    crop_main_group,
    indication,
    MAX(year) AS year
  FROM filter_nulls
  GROUP BY country,crop_main_group,indication)

SELECT
  country,
  crop_main_group,
  indication
FROM max_year a
INNER JOIN grouped_max_year b
ON a.year = b.year;