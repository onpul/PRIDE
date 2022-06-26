-- MEMBER 테이블 데이터 확인 (왜 홍체리가 유저아이디가 4번인가)
SELECT *
FROM MEMBER
ORDER BY 1;
/*
0	0	2022-06-23
1	0	2022-06-23
2	1	2022-06-23
3	1	2022-06-23
4	1	2022-06-26
*/

-- PROFILE 테이블 데이터 확인(왜 MyPageMainController.java 진입이 안되는가 user_id 4로 받아가는데)
SELECT *
FROM PROFILE;

-- 이메일,닉네임, 한마디, 이미지 주소 조회
SELECT USER_ID,EMAIL,NICKNAME,ONEWORD,PI_ADDRESS
FROM VIEW_MYPAGEMAIN
WHERE USER_ID = 4