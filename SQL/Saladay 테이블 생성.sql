-- 프로젝트용 DB 계정 생성 코드 (sys계정)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 프로젝트 계정 생성
CREATE USER salaDay IDENTIFIED BY saladay1212;

-- 권한 부여
GRANT CONNECT, RESOURCE, CREATE VIEW TO salaDay;

-- 객체 생성 공간 할당
ALTER USER cafe DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

-----------------------------------------------------------------------