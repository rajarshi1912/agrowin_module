#Advanced analytics - Step 18

SELECT
  yr_nbr as year,
  cntry_nm as country,
  indctn_txt as indication,
  crop_main_grp_cd as crop_main_group,
  crop_grp_cd as crop_group,
  crop_cd as crop,
  prod_cd as product,
  #area_grwn_000_ha as area_grown_000_ha, #mentioned in step 21 to remove the field
  area_treat_000_ha as area_treated_000_ha,
  area_trctr_000_ha as area_tractor_000_ha,
  area_prod_val as area_product,
  vol_prod_000_kg_ltr_val as volume_product_000_kg_li,
  usr_000_eur_val as value_user_000_eur,
  distrb_000_eur_val as value_distributor_000_eur,
  exchg_rt_val as exchange_rate,
  lcl_crncy_cd as local_currency_code,
  lcl_crncy_txt as local_currency,
  usr_000_lcl_val as value_user_000_local,
  distrb_000_lcl_val as value_distributor_000_local
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.cssi_agrwn_prod_lvl`;

