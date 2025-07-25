select
Cluster,
TRIM(Country) AS Country,
Blackbox_Company,
Blackbox_Members,
Blackbox_Coverage,
Blackbox_Update_Frequency,
Blackbox_Info,
safe_cast(Blackbox_Coverage_Avg as FLOAT64) as Blackbox_Coverage_Avg,
safe_cast(EMEA_Coverage as FLOAT64) AS EMEA_Coverage
from `bcs-edf-ingestion-np.m_blackbox_lz_t.blackbox_country_mapping_countries` 
where country <>'country'