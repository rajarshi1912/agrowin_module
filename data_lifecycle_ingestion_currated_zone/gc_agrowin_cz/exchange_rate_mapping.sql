#Total Final Flow - Step 31

WITH
  #Total Final Flow - Step 30
  ex_rates AS(
  SELECT
    local_currency_code,
    fixed_exchange_rate,
    budget
  FROM `bcs-edf-ingestion-np.m_agrowin_cz.21_ex_rates`)

SELECT
  year,
  country,
  indication,
  crop_main_group,
  crop_group,
  crop,
  product_type,
  product_group,
  product,
  formulation_type_complete,
  straight_or_mix,
  active_ready_mix,
  distributor_group,
  distributor_original,
  year_calendar,
  active_mix_flexigroup_autumn_spring_herb_emea,
  pest_main_group,
  pest_group,
  complex_pest,
  pest,
  pest_principal,
  area_product_000_ha,
  pest_area_000_ha,
  volume_product_000_kg_li,
  value_distributor_000_eur,
  value_user_000_eur,
  exchange_rate,
  a.local_currency_code,
  local_currency,
  value_user_000_local,
  value_distributor_000_local,
  report_type,
  completeness_flag,
  formulation_type_code,
  formulation_type,
  cereals_fungicide_segmentation,
  distributor,
  distributor_clean,
  country_original,
  country_1,
  cluster_new,
  country_group,
  eu_gb_no_ch_VS_non_eu,
  eu27_VS_non_eu,
  r_and_d_vs_generics,
  distributor_1,
  crop_main_group_incl_sunflower,
  crop_main_group_incl_sunflwr_as_main_crop,
  strategic_crops,
  b.local_currency_code as local_currency_code_1 ,
  fixed_exchange_rate,
  budget
FROM bcs-edf-ingestion-np.gc_agrowin_cz.crops_mapping a
LEFT JOIN ex_rates AS b
ON a.local_currency_code=b.local_currency_code
;