#Advanced analytics - Step 48

WITH
  #Advanced analytics - Step 47
  union_data AS(
  SELECT * FROM bcs-edf-ingestion-np.gc_agrowin_cz.all_data_flow
  UNION ALL
  SELECT * FROM bcs-edf-ingestion-np.gc_agrowin_cz.compare_data)

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
  if(r_and_d_vs_generics is null,'N/A',r_and_d_vs_generics) as r_and_d_vs_generics,
  if(cereals_fungicide_segmentation is null,'N/A',cereals_fungicide_segmentation) as cereals_fungicide_segmentation,
  crop_main_group_incl_sunflower,
  strategic_crops,
  cluster_new,
  country_group,
  eu_gb_no_ch_VS_non_eu,
  eu27_VS_non_eu,
  fixed_exchange_rate,
  value_user_000_fixed,
  value_distributor_000_fixed,
  report_type_and_completeness,
  current_timestamp() as last_update_date,
  'A' AS action_type,
  CURRENT_TIMESTAMP() AS row_insert_timestamp,
  CURRENT_TIMESTAMP() AS row_update_timestamp
FROM
  union_data
  ;
