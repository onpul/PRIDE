-- 테이블 스페이스 생성
CREATE TABLESPACE TBS_TEAM1
DATAFILE 'C:\TESTDATA\TBS_TEAM1.DBF'
SIZE 100M
EXTENT MANAGEMENT LOCAL
SEGMENT SPACE MANAGEMENT AUTO;

-- 테이블 스페이스 용량 조회문
SELECT TABLESPACE_NAME, FILE_NAME, BYTES/1024 AS MBytes, RESULT/1024 AS USE_MBytes FROM
   (
   SELECT E.TABLESPACE_NAME,E.FILE_NAME,E.BYTES, (E.BYTES-SUM(F.BYTES)) RESULT
   FROM DBA_DATA_FILES E, DBA_FREE_SPACE F
   WHERE E.FILE_ID = F.FILE_ID
   GROUP BY E.TABLESPACE_NAME, E.FILE_NAME, E.BYTES
   ) A;

-- 테이블 스페이스 용량 변경해야할 때
ALTER DATABASE DATAFILE 'C:\TESTDATA\TBS_TEAM1.DBF' RESIZE 100M;

-- 조회 확인
SELECT *
FROM DBA_TABLESPACES;

-- 오라클 유저 생성
CREATE USER TEAM1 IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_TEAM1;

-- 오라클 서버 접속 권한 부여
GRANT CREATE SESSION TO TEAM1;

-- 테이블 생성 권한
GRANT CREATE TABLE TO TEAM1;

-- 테이블스페이스에서 쓸 수 있는 할당량? 제한 제거
ALTER USER TEAM1
QUOTA UNLIMITED ON TBS_TEAM1;

-- 계정 잠금 해제
ALTER USER TEAM1 ACCOUNT UNLOCK;

-- 뷰 권한
GRANT CREATE VIEW TO TEAM1;

-- 트리거 생성 권한
GRANT CREATE TRIGGER TO TEAM1;

-- 프로시저 생성 권한
GRANT CREATE PROCEDURE TO TEAM1;

-- 시퀀스 생성 권한
GRANT CREATE SEQUENCE TO TEAM1;


-- 유저 삭제
drop user TEAM1 cascade;