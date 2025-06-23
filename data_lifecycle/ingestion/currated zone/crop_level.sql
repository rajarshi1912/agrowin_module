#Advanced analytics - Step 6

WITH
  #Advanced analytics - Step 5.1
  crop_level AS(
  SELECT
    year,
    country,
    indication,
    crop_main_group,
    crop_group,
    crop,
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
    value_distributor_000_local
  FROM
    `bcs-edf-ingestion-np.gc_agrowin_cz.crop`)

SELECT
  b.year,
  b.country,
  b.indication,
  b.crop_main_group,
  b.crop_group,
  b.crop,
  b.area_grown_000_ha,
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
  "Crop" as level,
  b.crop as dimension
FROM
  crop_level a
RIGHT JOIN
  bcs-edf-ingestion-np.gc_agrowin_cz.cultivated_area b
ON
  a.country =b.country
  AND a.crop = b.crop
  AND a.crop_group = b.crop_group
  AND a.crop_main_group = b.crop_main_group
  AND a.indication =b.indication
  AND a.year = b.year;
