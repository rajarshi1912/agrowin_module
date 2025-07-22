#Advanced analytics - Step 29

WITH
#Advanced analytics - Step 26 
distinct_active_ready_mix AS (
SELECT
  DISTINCT active_ready_mix AS active_ready_mix
FROM
  `bcs-edf-ingestion.gc_agrowin_cz.active_ready_mix`),

#Advanced analytics - Step 27 
active_ready_mix_cross_join AS(
SELECT
  year,
  country,
  crop_main_group,
  crop_group,
  crop,
  area_grown_000_ha,
  indication,
  active_ready_mix
FROM
  distinct_active_ready_mix
CROSS JOIN
  bcs-edf-ingestion.gc_agrowin_cz.cultivated_area),

#Advanced analytics - Step 28 
active_ready_mix_left AS(
SELECT
  a.year,
  a.country,
  a.indication,
  a.crop_main_group,
  a.crop_group,
  a.crop,
  a.active_ready_mix,
  a.area_grown_000_ha,
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
  value_distributor_000_local
FROM
  active_ready_mix_cross_join a
LEFT JOIN
  bcs-edf-ingestion.gc_agrowin_cz.active_ready_mix b
ON
  a.active_ready_mix =b.active_ready_mix
  AND a.country = b.country
  AND a.crop = b.crop
  AND a.crop_main_group = b.crop_main_group
  AND a.crop_group = b.crop_group
  AND a.indication = b.indication
  AND a.year=b.year),

#Advanced analytics - NEW step 1(fungi intake) 
fungi_clean AS(
SELECT
  active_ready_mix,
  cereals_fungicides_segmentation
FROM
  `bcs-edf-ingestion.m_agrowin_cz.fungi`
WHERE
  cereals_fungicides_segmentation != 'N/A'
  AND cereals_fungicides_segmentation IS NOT NULL) 

#Advanced analytics - New Step 2 and Step 29
SELECT
  year,
  country,
  indication,
  crop_main_group,
  crop_group,
  crop,
  area_grown_000_ha,
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
  b.active_ready_mix AS dimension,
  "Active Ready Mix" AS level,
  CASE
    WHEN crop_main_group = "CEREALS" AND indication = "FUNGICIDES" AND cereals_fungicides_segmentation IS NULL THEN "Not Segmented"
    WHEN cereals_fungicides_segmentation IS NULL THEN "Not Relevant"
    ELSE cereals_fungicides_segmentation
END AS cereals_fungicide_segmentation
FROM
  fungi_clean a
RIGHT JOIN
  active_ready_mix_left b
ON
  a.active_ready_mix = b.active_ready_mix