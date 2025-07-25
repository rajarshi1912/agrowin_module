With Bayer_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_segment_v`
UNPIVOT
(
  Bayer_Segment
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
Blackbox_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_segment_v`
UNPIVOT
(
  Blackbox_Segment
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
Comments_Pivotted as(
SELECT * FROM `bcs-edf-ingestion-np.m_blackbox_cz.blackbox_data_input_segment_v`
UNPIVOT
(
  Comments_Segment
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
SELECT Bayer_Pivotted.Quarter,Bayer_Pivotted.Segment,Bayer_Pivotted.Indication,Bayer_Pivotted.Local_Currency_code,Bayer_Pivotted.Country,Bayer_Pivotted.Year,Bayer_Pivotted.Bayer_Segment,Blackbox_Pivotted.Blackbox_Segment,Comments_Pivotted.Comments_Segment
FROM Bayer_Pivotted LEFT JOIN Blackbox_Pivotted
ON (Bayer_Pivotted.Year=Blackbox_Pivotted.Year
AND Bayer_Pivotted.Quarter=Blackbox_Pivotted.Quarter
AND Bayer_Pivotted.Indication=Blackbox_Pivotted.Indication
AND Bayer_Pivotted.Segment=Blackbox_Pivotted.Segment
AND Bayer_Pivotted.Country=Blackbox_Pivotted.Country)
LEFT JOIN Comments_Pivotted
ON (Bayer_Pivotted.Year=Comments_Pivotted.Year
AND Bayer_Pivotted.Quarter=Comments_Pivotted.Quarter
AND Bayer_Pivotted.Indication=Comments_Pivotted.Indication
AND Bayer_Pivotted.Segment=Blackbox_Pivotted.Segment
AND Bayer_Pivotted.Country=Comments_Pivotted.Country)