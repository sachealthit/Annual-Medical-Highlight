
SELECT 
      ENC.PAT_ENC_CSN_ID                AS   'ENC ID'
    , PAT.PAT_MRN_ID                    AS   'MRN ID'
    , CAST(ENC.CONTACT_DATE AS DATE )   AS   'Contact Date'
    , DEP.SPECIALTY                     AS   'Specialty'
    , LOC.LOC_NAME                      AS   'Location'
    , DEP.DEPARTMENT_NAME               AS   'Department Long'
    , PRC.PRC_ID                        AS
FROM PAT_ENC  ENC  


LEFT  JOIN   PATIENT       PAT   ON   ENC.PAT_ID            =   PAT.PAT_ID
LEFT  JOIN   CLARITY_DEP   DEP   ON   ENC.DEPARTMENT_ID     =   DEP.DEPARTMENT_ID
LEFT  JOIN   CLARITY_LOC   LOC   ON   DEP.REV_LOC_ID        =   LOC.LOC_ID 
LEFT  JOIN   CLARITY_SER   SER   ON   ENC.VISIT_PROV_ID     =   SER.PROV_ID
LEFT  JOIN   CLARITY_PRC   PRC   ON   ENC.APPT_PRC_ID       =   PRC.PRC_ID


WHERE DEP.SERV_AREA_ID     = 55
AND   ENC.APPT_STATUS_C   IN ( '2' , '6' )
AND   YEAR(ENC.CONTACT_DATE) BETWEEN 2018 AND 2022