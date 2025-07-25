#Advanced analytics - Step 33

WITH
  #Advanced analytics - Step 31
  strategic_crops AS (
  SELECT
    crop_main_group_incl_sunflwr_as_main_crop,
    strategic_crops
  FROM `bcs-edf-ingestion-np.m_agrowin_cz.crops`
  WHERE crop_main_group_incl_sunflwr_as_main_crop IS NOT NULL),

  #Advanced analytics - Step 32.1
  crops_join AS(
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
    cereals_fungicide_segmentation,
  --IF(crop LIKE "%SUNFLOWER%", 'SUNFLOWER', crop_main_group) AS crop_main_group_incl_sunflower
    case
    when upper(crop) like "%SUNFLOWER%" then 'SUNFLOWER'
    when upper(crop_main_group) = "ENVIRONMENTAL MARKETS" then "OTHER CROPS"
    else crop_main_group
    end as crop_main_group_incl_sunflower
  FROM `bcs-edf-ingestion-np.gc_agrowin_cz.union`)

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
  cereals_fungicide_segmentation,
  crop_main_group_incl_sunflower,
  strategic_crops
FROM strategic_crops a
RIGHT JOIN crops_join b
ON a.crop_main_group_incl_sunflwr_as_main_crop = b.crop_main_group_incl_sunflower