#Total Final Flow - Step 6

WITH
  #Total Final Flow - Step 4
  in_season_cleaning AS(
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
    "In-Season" AS report_type
  FROM `bcs-edf-ingestion-np.gc_agrowin_cz.in_season`) 

SELECT
  year,
  a.country,
  a.indication,
  a.crop_main_group,
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
  completeness_flag
FROM bcs-edf-ingestion-np.gc_agrowin_cz.completeness_flag a
RIGHT JOIN in_season_cleaning b
ON a.country=b.country AND a.crop_main_group=b.crop_main_group AND a.indication = b.indication
;