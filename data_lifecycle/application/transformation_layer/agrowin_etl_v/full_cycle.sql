SELECT
  *,
  'A' AS action_type,
  CURRENT_TIMESTAMP() AS row_insert_timestamp,
  CURRENT_TIMESTAMP() AS row_update_timestamp
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.full_cycle`
