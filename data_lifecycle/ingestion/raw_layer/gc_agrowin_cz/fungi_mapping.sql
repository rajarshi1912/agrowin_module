#Total Final Flow - Step 15

WITH
  #Total Final Flow - Step 13 & 14
  fungi_clean AS(
  SELECT
      active_ready_mix,
      cereals_fungicides_segmentation
    FROM
      `bcs-edf-ingestion.m_agrowin_cz.fungi`
    WHERE
      cereals_fungicides_segmentation != 'N/A')

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
  a.active_ready_mix,
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
  CASE
    WHEN crop_main_group = "CEREALS" AND indication = "FUNGICIDES" AND cereals_fungicides_segmentation IS NULL THEN "Not Segmented"
    WHEN cereals_fungicides_segmentation IS NULL THEN "Not Relevant"
    ELSE cereals_fungicides_segmentation
  END AS cereals_fungicide_segmentation
FROM bcs-edf-ingestion.gc_agrowin_cz.in_season_and_full_cycle a
LEFT JOIN fungi_clean b
ON a.active_ready_mix = b.active_ready_mix
;