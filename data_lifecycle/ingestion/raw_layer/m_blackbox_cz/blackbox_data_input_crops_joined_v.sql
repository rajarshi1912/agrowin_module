select 
crp.* except(Bayer_Crops,Blackbox_Crops,Comments_Crops,Country),
safe_cast(rat.Fixed_Exchange_Rate as Float64) as Fixed_Exchange_Rate,
rat.Budget,
crp.Country,
Bayer_Crops*1000 as Bayer_Crops,
Blackbox_Crops*1000 as Blackbox_Crops,
Comments_Crops,
cou.* except(Country)
FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_crops_pivotted_v` crp
left join bcs-edf-ingestion-np.m_blackbox_cz.blackbox_country_mapping_countries_v cou
on crp.Country=cou.Country
left join bcs-edf-ingestion-np.m_blackbox_cz.21_ex_rates as rat
on crp.Local_Currency_Code=rat.Local_Currency_Code
order by Quarter asc, Indication asc