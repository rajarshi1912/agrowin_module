With Blackbox_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_crops_v`
UNPIVOT
(
  Blackbox_Crops
  FOR Year in (
  Blackbox_2018 AS "2018",
  Blackbox_2019 AS "2019",
  Blackbox_2020 AS "2020",
  Blackbox_2021 AS "2021",
  Blackbox_2022 AS "2022",
  Blackbox_2023 AS "2023",
  Blackbox_2024 AS "2024")
)
),
Bayer_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_crops_v`
UNPIVOT
(
  Bayer_Crops
  FOR Year in (
  Bayer_2018 AS "2018",
  Bayer_2019 AS "2019",
  Bayer_2020 AS "2020",
  Bayer_2021 AS "2021",
  Bayer_2022 AS "2022",
  Bayer_2023 AS "2023",
  Bayer_2024 AS "2024")
)
),
Comments_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_crops_v`
UNPIVOT
(
  Comments_Crops
  FOR Year in (
  Comments_2018 AS "2018",
  Comments_2019 AS "2019",
  Comments_2020 AS "2020",
  Comments_2021 AS "2021",
  Comments_2022 AS "2022",
  Comments_2023 AS "2023",
  Comments_2024 AS "2024")
)
)
SELECT Blackbox_Pivotted.Quarter,Blackbox_Pivotted.Crops,Blackbox_Pivotted.Indication,Blackbox_Pivotted.Local_Currency_code,Blackbox_Pivotted.Country,Blackbox_Pivotted.Year,Bayer_Pivotted.Bayer_Crops,Blackbox_Pivotted.Blackbox_Crops,Comments_Pivotted.Comments_Crops
FROM Blackbox_Pivotted LEFT JOIN Bayer_Pivotted
ON (Bayer_Pivotted.Year=Blackbox_Pivotted.Year
AND Bayer_Pivotted.Quarter=Blackbox_Pivotted.Quarter
AND Bayer_Pivotted.Indication=Blackbox_Pivotted.Indication
AND Bayer_Pivotted.Crops=Blackbox_Pivotted.Crops
AND Bayer_Pivotted.Country=Blackbox_Pivotted.Country)
LEFT JOIN Comments_Pivotted
ON (Bayer_Pivotted.Year=Comments_Pivotted.Year
AND Bayer_Pivotted.Quarter=Comments_Pivotted.Quarter
AND Bayer_Pivotted.Indication=Comments_Pivotted.Indication
AND Bayer_Pivotted.Crops=Blackbox_Pivotted.Crops
AND Bayer_Pivotted.Country=Comments_Pivotted.Country)