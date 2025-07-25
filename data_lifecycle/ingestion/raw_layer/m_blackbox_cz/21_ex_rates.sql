select 
Local_Currency_Code,	
safe_cast(Fixed_Exchange_Rate as FLOAT64) as Fixed_Exchange_Rate,	
Budget
from `bcs-edf-ingestion-np.m_blackbox_lz_t.21_ex_rates`