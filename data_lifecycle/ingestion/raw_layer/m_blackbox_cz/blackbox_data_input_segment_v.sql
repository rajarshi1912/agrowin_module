(
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_austria_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_belgium_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_czech_republic_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_denmark_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_eastern_africa_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_finland_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_france_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_germany_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_greece_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_hungary_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_iberia_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_ireland_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_italy_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_lithuania_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_middle_east_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_netherlands_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_north_africa_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_norway_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_poland_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_romania_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_russia_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_serbia_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_slovakia_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_south_africa_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_sweden_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_switzerland_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_turkey_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_ukraine_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_united_kingdom_data_input_segment` 
UNION ALL
select * from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_west_central_africa_data_input_segment` 
)order by Quarter asc, Indication asc, Segment asc