SELECT *
FROM VIEW_RIDING_LIST;

CREATE OR REPLACE VIEW VIEW_RIDING_LIST
AS
SELECT T2.*, CASE WHEN OPEN<0 OR TO_DATE(START_DATE, 'YYYY-MM-DD') < TO_DATE(SYSDATE, 'YYYY-MM-DD') OR CONFIRM_DATE IS NOT NULL THEN '참여 불가' 
                  WHEN OPEN>0 AND TO_DATE(START_DATE, 'YYYY-MM-DD') > TO_DATE(SYSDATE, 'YYYY-MM-DD') AND CONFIRM_DATE IS NULL THEN '참여 가능'
                  ELSE '판별 불가' END AS STATUS
FROM
(
SELECT DISTINCT T.RIDING_ID, T.RIDING_NAME, T.MAXIMUM
     , CASE WHEN T.MAXIMUM-COUNT(T.USER_ID) OVER(PARTITION BY RIDING_ID) < 0 THEN 0 
            ELSE T.MAXIMUM-COUNT(T.USER_ID) OVER(PARTITION BY RIDING_ID) END AS OPEN
     , T.START_DATE, T.END_DATE, T.CONFIRM_DATE
     , T.STEP_ID, T.SPEED_ID, T.MOOD_P_ID, T.DINING_P_ID, T.EAT_P_ID, T.AGE_P_ID, T.SEX_P_ID
FROM
(
SELECT A.RIDING_ID, A.RIDING_NAME, A.MAXIMUM, A.START_DATE, A.END_DATE, A.CONFIRM_DATE, B.USER_ID, A.STEP_ID, A.SPEED_ID, A.MOOD_P_ID, A.DINING_P_ID, A.EAT_P_ID, A.AGE_P_ID, A.SEX_P_ID
FROM RIDING A LEFT JOIN PARTICIPATED_MEMBER B
ON A.RIDING_ID = B.RIDING_ID
GROUP BY A.RIDING_ID, A.RIDING_NAME, A.MAXIMUM, A.START_DATE, A.END_DATE, A.CONFIRM_DATE, B.USER_ID
     , A.STEP_ID, A.SPEED_ID, A.MOOD_P_ID, A.DINING_P_ID, A.EAT_P_ID, A.AGE_P_ID, A.SEX_P_ID
)
T
)T2;

SELECT *
FROM RIDING;

SELECT *
FROM PROFILE;

INSERT INTO PROFILE (PROFILE_ID, USER_ID, MOOD_P_ID, EAT_P_ID, PIMG_ID, DINING_P_ID, SEX_P_ID, AGE_P_ID, EMAIL, BIRTHDAY, SEX, PASSWORD, NICKNAME, INTRODUCE)
VALUES ('0', '0', 0, 0, '1', 0, 0, 0, 'admin0@test.com', SYSDATE, 'M', '12341234', '관리자0', NULL);

INSERT INTO PROFILE (PROFILE_ID, USER_ID, MOOD_P_ID, EAT_P_ID, PIMG_ID, DINING_P_ID, SEX_P_ID, AGE_P_ID, EMAIL, BIRTHDAY, SEX, PASSWORD, NICKNAME, INTRODUCE)
VALUES ('1', '1', 0, 0, '1', 0, 0, 0, 'admin1@test.com', SYSDATE, 'F', '12341234', '관리자1', NULL);

COMMIT;

SELECT *
FROM RIDING;
