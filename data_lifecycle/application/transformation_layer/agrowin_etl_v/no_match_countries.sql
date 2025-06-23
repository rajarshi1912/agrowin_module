#Total Final Flow - Step 24

WITH
  #Total Final Flow - Step 22
  country_null AS(
  SELECT
    year,
    country,
    country_1,
    cluster_new,
    country_group,
    eu27_VS_non_eu
  FROM bcs-edf-ingestion-np.gc_agrowin_cz.country_mapping
  WHERE country IS NULL OR country_1 IS NULL)

SELECT DISTINCT
  country_1,
  cluster_new,
  country_group,
  eu27_VS_non_eu,
  country,
  year,
  'A' AS action_type,
  CURRENT_TIMESTAMP() AS row_insert_timestamp,
  CURRENT_TIMESTAMP() AS row_update_timestamp
FROM
  country_null;