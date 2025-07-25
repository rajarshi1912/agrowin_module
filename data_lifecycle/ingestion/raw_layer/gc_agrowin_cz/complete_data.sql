#Total Final Flow - Step 8

SELECT * FROM `bcs-edf-ingestion-np.gc_agrowin_cz.comparable_data`
UNION ALL
SELECT * FROM `bcs-edf-ingestion-np.gc_agrowin_cz.all_data`
;