#Total Final Flow - Step 21

WITH
  #Total Final Flow - Step 19
  countries AS(
  SELECT
    country_original,
    country,
    cluster_new,
    country_group,
    eu_gb_no_ch_VS_non_eu,
    eu27_VS_non_eu
  FROM `bcs-edf-ingestion-np.m_agrowin_cz.countries`)

SELECT
  year,
  upper(a.country) as country,
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
  local_currency_code,
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
  upper(b.country) as country_1,
  cluster_new,
  country_group,
  eu_gb_no_ch_VS_non_eu,
  eu27_VS_non_eu
FROM bcs-edf-ingestion-np.gc_agrowin_cz.distributor_mapping a
FULL OUTER JOIN countries b
ON upper(a.country)=upper(b.country_original);