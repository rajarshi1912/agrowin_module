#Advanced analytics - Step 7 
SELECT
  yr_nbr AS year,
  cntry_nm AS country,
  indctn_txt AS indication,
  crop_main_grp_cd AS crop_main_group,
  crop_grp_cd AS crop_group,
  crop_cd AS crop,
  distrb_cd AS distributor_original,
  #area_grwn_000_ha AS area_grown_000_ha, #Step 10 mentioned TO remove this field 
  area_treat_000_ha AS area_treated_000_ha,
  area_trctr_000_ha AS area_tractor_000_ha,
  area_prod_val AS area_product,
  vol_prod_000_kg_ltr_val AS volume_product_000_kg_li,
  usr_000_eur_val AS value_user_000_eur,
  distrb_000_eur_val AS value_distributor_000_eur,
  exchg_rt_val AS exchange_rate,
  lcl_crncy_cd AS local_currency_code,
  lcl_crncy_txt AS local_currency,
  usr_000_lcl_val AS value_user_000_local,
  distrb_000_lcl_val AS value_distributor_000_local
FROM
  `bcs-edf-ingestion.gc_agrowin_cz.cssi_agrwn_distrb_lvl`