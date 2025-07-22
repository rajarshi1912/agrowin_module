#Advanced analytics - Step 36

WITH
  #Advanced analytics - Step 34
  countries AS(
  SELECT
    country_original,
    country,
    cluster_new,
    country_group,
    eu_gb_no_ch_VS_non_eu,
    eu27_VS_non_eu
  FROM `bcs-edf-ingestion.m_agrowin_cz.countries`)

SELECT
  year,
  a.country,
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
  level,
  dimension,
  r_and_d_vs_generics,
  cereals_fungicide_segmentation,
  crop_main_group_incl_sunflower,
  strategic_crops,
  --country_original,
  --b.country as country_1,
  cluster_new,
  country_group,
  eu_gb_no_ch_VS_non_eu,
  eu27_VS_non_eu
FROM countries a
RIGHT JOIN bcs-edf-ingestion.gc_agrowin_cz.crop_clean b
ON a.country_original = b.country;