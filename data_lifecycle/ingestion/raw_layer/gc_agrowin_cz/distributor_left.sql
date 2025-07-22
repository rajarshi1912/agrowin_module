#Advanced analytics - Step 10

WITH
  #Advanced analytics - Step 8
  distinct_distributor AS(
  SELECT
    DISTINCT distributor_original as distributor_original
  FROM
    `bcs-edf-ingestion.gc_agrowin_cz.distributor`),

  #Advanced analytics - Step 9
  distributors_cross_join AS(
  SELECT
    year,
    country,
    crop_main_group,
    crop_group,
    crop,
    area_grown_000_ha,
    indication,
    distributor_original
  FROM
    bcs-edf-ingestion.gc_agrowin_cz.cultivated_area
  CROSS JOIN
    distinct_distributor)

SELECT
  a.year,
  a.country,
  a.crop_main_group,
  a.crop_group,
  a.crop,
  area_grown_000_ha,  
  a.indication,
  a.distributor_original,
  area_treated_000_ha,
  area_tractor_000_ha,
  area_product,
  volume_product_000_kg_li,
  value_user_000_eur,
  value_distributor_000_eur,
  exchange_rate,
  local_currency_code,
  local_currency,
  value_user_000_local,
  value_distributor_000_local,
FROM
  distributors_cross_join a
LEFT JOIN
  bcs-edf-ingestion.gc_agrowin_cz.distributor b
ON
  a.country = b.country
  AND a.crop=b.crop
  AND a.crop_group = b.crop_group
  AND a.year = b.year
  AND a.indication = b.indication
  AND a.distributor_original=b.distributor_original
  AND a.crop_main_group =b.crop_main_group
