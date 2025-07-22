#Total Final Flow - Step 7

WITH
  #Step 7 - Condition 1 & 2
  only_comparable_data AS (
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
    formulation_type,
    product_flag_straight_mix,
    active_ready_mix,
    distributor_group,
    distributor,
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
    local_currency_code,
    local_currency,
    value_user_000_local,
    value_distributor_000_local,
    report_type
  FROM
    `bcs-edf-ingestion.gc_agrowin_cz.comparable_data`
  WHERE
    completeness_flag ="Only Comparable Data")

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
  formulation_type,
  product_flag_straight_mix,
  active_ready_mix,
  distributor_group,
  distributor,
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
  local_currency_code,
  local_currency,
  value_user_000_local,
  value_distributor_000_local,
  report_type,
  "All Data" AS completeness_flag
FROM only_comparable_data
;