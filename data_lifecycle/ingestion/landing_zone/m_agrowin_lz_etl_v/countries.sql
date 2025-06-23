SELECT
  *,
  'A' AS action_type,
  CURRENT_TIMESTAMP() AS row_insert_timestamp,
  CURRENT_TIMESTAMP() AS row_update_timestamp
FROM
  `bcs-edf-ingestion-np.m_agrowin_lz_raw.countries`
WHERE
  country_original IS NOT null AND country != "IRAN"