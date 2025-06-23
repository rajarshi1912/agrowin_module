#Advanced analytics - Step 21

WITH
  #Advanced analytics - Step 19
  distinct_product AS(
  SELECT
    DISTINCT product AS product
  FROM
    `bcs-edf-ingestion-np.gc_agrowin_cz.product`),

  #Advanced analytics - Step 20
  product_cross_join AS(
  SELECT
    year,
    country,
    crop_main_group,
    crop_group,
    crop,
    area_grown_000_ha,
    indication,
    product
  FROM bcs-edf-ingestion-np.gc_agrowin_cz.cultivated_area
  CROSS JOIN distinct_product)

SELECT
  a.year,
  a.country,
  a.crop_main_group,
  a.crop_group,
  a.crop,
  a.area_grown_000_ha,
  a.indication,
  a.product,
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
FROM product_cross_join a
LEFT JOIN bcs-edf-ingestion-np.gc_agrowin_cz.product b
ON
  a.country=b.country
  AND a.crop = b.crop
  AND a.crop_group = b.crop_group
  AND a.crop_main_group = b.crop_main_group
  AND a.indication = b.indication
  AND a.product = b.product
  AND a.year=b.year
