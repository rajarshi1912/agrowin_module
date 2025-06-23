#Total Final Flow - Step 12

WITH
  #Total Final Flow - Step 11
  in_season_and_full_cycle AS (
  SELECT * FROM bcs-edf-ingestion-np.gc_agrowin_cz.complete_data
  UNION ALL
  SELECT * FROM bcs-edf-ingestion-np.gc_agrowin_cz.full_cycle_clean)

SELECT
  PARSE_DATE('%Y', CAST(year AS STRING)) AS year,
  country,
  indication,
  crop_main_group,
  crop_group,
  crop,
  product_type,
  product_group,
  product,
  formulation_type as formulation_type_complete,
  product_flag_straight_mix as straight_or_mix,
  active_ready_mix,
  distributor_group,
  distributor as distributor_original,
  PARSE_DATE('%Y', substring(CAST(year_calendar AS STRING),1,4)) AS year_calendar,
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
  local_currency_code,
  local_currency,
  value_user_000_local,
  value_distributor_000_local,
  report_type,
  completeness_flag,
  trim(split(formulation_type," - ")[0]) as formulation_type_code,
  trim(array_reverse(split(formulation_type," - "))[offset(0)]) as formulation_type
FROM
  in_season_and_full_cycle 
