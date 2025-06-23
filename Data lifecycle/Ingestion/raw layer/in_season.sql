SELECT
  yr_nbr AS year,
  CASE
    WHEN UPPER(cntry_nm) = "CZECH REPUBLIC" THEN "CZECH REP."
    WHEN UPPER(cntry_nm) = "MOLDOVA, REPUBLIC OF" THEN "MOLDOVA"
    WHEN UPPER(cntry_nm) = "SERBIA" THEN "SERBIA REP."
    WHEN UPPER(cntry_nm) = "SOUTH AFRICA" THEN "SOUTH-AFRICA"
    WHEN UPPER(cntry_nm) = "UNITED KINGDOM" THEN "UNITED KINGDOM (UK)"
    WHEN UPPER(cntry_nm) = "RUSSIAN FEDERATION" THEN "RUSSIA"
    ELSE UPPER(cntry_nm)
END
  AS country,
  upper(bus_unit) AS indication,
  CASE
    WHEN crop_main_grp_cd = "Rapeseed / Canola" THEN "OILSEED-RAPE/CANOLA"
    ELSE UPPER(crop_main_grp_cd)
END
  AS crop_main_group,
  upper(crop_grp_cd) AS crop_group,
  crop_cd AS crop,
  prod_typ AS product_type,
  prod_grp AS product_group,
  prod_cd AS product,
  frmla_typ AS formulation_type,
  prod_flg_strght_mix AS product_flag_straight_mix,
  actv_ready_mix_txt AS active_ready_mix,
  distrb_grp AS distributor_group,
  distrb_cd AS distributor,
  CAST(yr_cal AS int64)AS year_calendar,
  actv_mix_autmn_sprng_herb_emea AS active_mix_flexigroup_autumn_spring_herb_emea,
  pest_mn_grp AS pest_main_group,
  pest_grp AS pest_group,
  cmplx_pest AS complex_pest,
  pest,
  pest_prncpl AS pest_principal,
  area_prod_val AS area_product_000_ha,
  pest_area_000_ha,
  vol_prod_000_kg_ltr_val AS volume_product_000_kg_li,
  distrb_000_eur_val AS value_distributor_000_eur,
  usr_000_eur_val AS value_user_000_eur,
  exchg_rt_val_eu AS exchange_rate,
  lcl_crncy_cd AS local_currency_code,
  lcl_crncy_txt AS local_currency,
  usr_000_lcl_val AS value_user_000_local,
  distrb_000_lcl_val AS value_distributor_000_local
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.cssi_agrwn_in_season`
WHERE
  yr_nbr > ((SELECT MAX(yr_nbr) FROM `bcs-edf-ingestion-np.gc_agrowin_cz.cssi_agrwn_in_season`)-5)