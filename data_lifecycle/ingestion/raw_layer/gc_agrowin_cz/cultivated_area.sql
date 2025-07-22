#Advanced analytics - Step 4

WITH
  #Advanced analytics - Step 2 
  distinct_indication AS(
  SELECT
    DISTINCT indication AS indication
  FROM
    `bcs-edf-ingestion.gc_agrowin_cz.crop`),

  #Advanced analytics - Step 3
  cultivated_area AS(
  SELECT
    yr_nbr as year,
    cntry_nm as country,
    crop_main_grp_cd as crop_main_group,
    crop_grp_cd as crop_group,
    crop_cd as crop,
    area_grwn_000_ha as area_grown_000_ha
  FROM
    `bcs-edf-ingestion.gc_agrowin_cz.cssi_agrwn_cultv_area`)

SELECT
  year,
  country,
  crop_main_group,
  crop_group,
  crop,
  area_grown_000_ha,
  indication
FROM
  cultivated_area CROSS JOIN distinct_indication
