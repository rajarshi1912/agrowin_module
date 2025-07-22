#Advanced analytics - Step 39

WITH
  #Advanced analytics - Step 37
  ex_rates AS(
  SELECT
    local_currency_code as local_currency_code_map, 
    fixed_exchange_rate
  FROM
    `bcs-edf-ingestion.m_agrowin_cz.21_ex_rates`)

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
  level,
  dimension,
  r_and_d_vs_generics,
  cereals_fungicide_segmentation,
  crop_main_group_incl_sunflower,
  strategic_crops,
  cluster_new,
  country_group,
  eu_gb_no_ch_VS_non_eu,
  eu27_VS_non_eu,
  fixed_exchange_rate,
  (value_user_000_local/fixed_exchange_rate) as value_user_000_fixed,
  (value_distributor_000_local/fixed_exchange_rate) as value_distributor_000_fixed
FROM ex_rates a
RIGHT JOIN bcs-edf-ingestion.gc_agrowin_cz.country_map b
ON a.local_currency_code_map = b.local_currency_code
;
