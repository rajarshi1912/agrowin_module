#Advanced analytics - Step 17

WITH
  #Advanced analytics - Step 11
  companies AS(
  SELECT
    distributor_r_and_d_vs_generics AS r_and_d_vs_generics,
    distributor
  FROM `bcs-edf-ingestion.m_agrowin_cz.companies`),

  #Advanced analytics - Step 14
  distrb_mapping AS(
  SELECT
    distributor, 
    distributor_clean
  FROM bcs-edf-ingestion.m_agrowin_cz.distrib_clean),

  #Advanced analytics - Step 12 & 13
  companies_clean AS(
  SELECT
    year,
    country,
    crop_main_group,
    crop_group,
    crop,
    area_grown_000_ha,
    indication,
    b.distributor_original,
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
    IF(r_and_d_vs_generics IS NULL,"Generics",r_and_d_vs_generics) AS r_and_d_vs_generics
  FROM companies a
  RIGHT JOIN bcs-edf-ingestion.gc_agrowin_cz.distributor_left b
  ON a.distributor = b.distributor_original)

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
  "Distributor" as level,
  IFNULL(distributor_clean,distributor_original) as dimension, #renamed from distributor to dimension as step 17
  r_and_d_vs_generics
FROM distrb_mapping a
RIGHT JOIN companies_clean b
ON a.distributor =b.distributor_original;
