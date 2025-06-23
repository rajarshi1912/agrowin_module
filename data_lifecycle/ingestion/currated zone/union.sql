#Advanced analytics - Step 30

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
  null as r_and_d_vs_generics,
  null as cereals_fungicide_segmentation
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.crop_level`

union all 

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
  null as cereals_fungicide_segmentation
FROM
  bcs-edf-ingestion-np.gc_agrowin_cz.distributor_level

union all

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
  null as r_and_d_vs_generics,
  null as cereals_fungicide_segmentation
FROM
  bcs-edf-ingestion-np.gc_agrowin_cz.product_level

union all

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
  null as r_and_d_vs_generics,
  cereals_fungicide_segmentation
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.active_ready_mix_level`;
