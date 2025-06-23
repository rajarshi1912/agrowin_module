#Total Final Flow - Step 33

SELECT DISTINCT
  country_original,
  country,
  year,
  exchange_rate,
  local_currency_code,
  local_currency,
  'A' AS action_type,
  CURRENT_TIMESTAMP() AS row_insert_timestamp,
  CURRENT_TIMESTAMP() AS row_update_timestamp
FROM
  `bcs-edf-ingestion-np.gc_agrowin_cz.exchange_rate_mapping`
  WHERE local_currency_code_1 IS NULL;