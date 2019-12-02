--------------------------------------------------------
--  File created - Sunday-December-01-2019   
--------------------------------------------------------
DROP SEQUENCE "CIS"."ASSESSMENT_SEQ";
DROP TABLE "CIS"."CIS_ASSESSMENTS" cascade constraints;
DROP TABLE "CIS"."CIS_ASS_EXEC" cascade constraints;
DROP TABLE "CIS"."CIS_BENCHMARKS" cascade constraints;
DROP TABLE "CIS"."CIS_CONNECTIONS" cascade constraints;
DROP TABLE "CIS"."CIS_CONTROLS" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence ASSESSMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CIS"."ASSESSMENT_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CIS_ASSESSMENTS
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_ASSESSMENTS" 
   (	"CONN_NO" NUMBER, 
	"BENCHMARK_NO" NUMBER, 
	"ASS_NO" NUMBER, 
	"ASS_DATE" DATE, 
	"ASS_SCORE" NUMBER, 
	"ASS_DESC" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CIS_ASS_EXEC
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_ASS_EXEC" 
   (	"ASS_NO" NUMBER, 
	"EXEC_DATE" DATE, 
	"EXEC_CONTROL_NO" VARCHAR2(200 BYTE), 
	"EXEC_CONTROL_NAME" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_NOTES" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_AUDIT_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_DETAIL_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_REMEDIATION_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_COMMAND_TYPE" NUMBER, 
	"EXEC_DETAIL_SQL_RESULT" CLOB, 
	"EXEC_RESULT" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("EXEC_DETAIL_SQL_RESULT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
--------------------------------------------------------
--  DDL for Table CIS_BENCHMARKS
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_BENCHMARKS" 
   (	"BENCHMARK_NO" NUMBER, 
	"BENCHMARK_NAME" VARCHAR2(500 BYTE), 
	"BENCHMARK_DESC" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CIS_CONNECTIONS
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_CONNECTIONS" 
   (	"CONN_NO" NUMBER, 
	"CONN_USERNAME" VARCHAR2(250 BYTE), 
	"CONN_HOST" VARCHAR2(250 BYTE), 
	"CONN_PORT" NUMBER, 
	"CONN_DBNAME" VARCHAR2(250 BYTE), 
	"CONN_TYPE" NUMBER, 
	"CONN_DESC" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CIS_CONTROLS
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_CONTROLS" 
   (	"BENCHMARK_NO" NUMBER, 
	"CONTROL_NO" VARCHAR2(200 BYTE), 
	"CONTROL_NAME" VARCHAR2(2500 BYTE), 
	"CONTROL_NOTES" VARCHAR2(2500 BYTE), 
	"CONTROL_AUDIT_SQL" VARCHAR2(2500 BYTE), 
	"CONTROL_DETAIL_SQL" VARCHAR2(2500 BYTE), 
	"CONTROL_REMEDIATION_SQL" VARCHAR2(2500 BYTE), 
	"CONTROL_COMMAND_TYPE" NUMBER, 
	"CONTROL_COND_TYPE" VARCHAR2(2 BYTE), 
	"CONTROL_COND_RESULT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;