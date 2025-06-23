#Advanced analytics - Step 46

SELECT
  year,
  a.country,
  a.indication,
  a.crop_main_group,
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
  value_user_000_fixed,
  value_distributor_000_fixed,
  report_type_and_completeness
FROM bcs-edf-ingestion-np.gc_agrowin_cz.comparable_data_flow a
INNER JOIN bcs-edf-ingestion-np.gc_agrowin_cz.comparable_groups b
ON a.country=b.country
  AND a.indication=b.indication
  AND a.crop_main_group=b.crop_main_group;
