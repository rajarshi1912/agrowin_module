select 
inp.* except(Bayer,Blackbox,Comments),
safe_cast(rat.Fixed_Exchange_Rate as Float64) as Fixed_Exchange_Rate,
rat.Budget,
Bayer*1000 as Bayer,
Blackbox*1000 as Blackbox,
Comments,
cou.* except(Country)
FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_pivotted_v` inp
left join bcs-edf-ingestion-np.m_blackbox_cz.blackbox_country_mapping_countries_v cou
on inp.Country=cou.Country
left join bcs-edf-ingestion-np.m_blackbox_cz.21_ex_rates as rat
on inp.Local_Currency_Code=rat.Local_Currency_Code
order by Quarter asc, Indication asc