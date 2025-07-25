select A.Name, A.UserID, B.Role, B.Country
from `bcs-edf-ingestion-np.m_blackbox_lz_t.security_user_level_access` as A,
`bcs-edf-ingestion-np.m_blackbox_lz_t.security_user_level_access_roles` as B where A.Role = B.Role