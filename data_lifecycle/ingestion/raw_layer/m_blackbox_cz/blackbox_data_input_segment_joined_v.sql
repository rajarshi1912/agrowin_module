select
seg.* except(Bayer_Segment,Blackbox_Segment,Comments_Segment,Country),
safe_cast(rat.Fixed_Exchange_Rate as Float64) as Fixed_Exchange_Rate,
rat.Budget,
seg.Country,
Bayer_Segment*1000 as Bayer_Segment,
Blackbox_Segment*1000 as Blackbox_Segment,
Comments_Segment,
cou.* except(Country)
FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_segment_pivotted_v` seg
left join bcs-edf-ingestion-np.m_blackbox_cz.blackbox_country_mapping_countries_v cou
on seg.Country=cou.Country
left join bcs-edf-ingestion-np.m_blackbox_cz.21_ex_rates as rat
on seg.Local_Currency_Code=rat.Local_Currency_Code
order by Quarter asc, Indication asc