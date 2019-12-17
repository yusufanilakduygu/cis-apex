--------------------------------------------------------
--  File created - Tuesday-December-17-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ASSESSMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CIS"."ASSESSMENT_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 541 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CIS_ASSESSMENTS
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_ASSESSMENTS" 
   (	"CONN_NO" NUMBER, 
	"BENCHMARK_NO" NUMBER, 
	"ASS_NO" NUMBER, 
	"ASS_DATE" DATE, 
	"ASS_SCORE" NUMBER, 
	"ASS_DESC" VARCHAR2(250 BYTE), 
	"PASS_COUNT" NUMBER, 
	"FAIL_COUNT" NUMBER, 
	"NOT_MADE_COUNT" NUMBER
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
	"EXEC_CONTROL_NO" VARCHAR2(200 BYTE), 
	"EXEC_CONTROL_NAME" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_NOTES" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_AUDIT_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_DETAIL_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_REMEDIATION_SQL" VARCHAR2(2500 BYTE), 
	"EXEC_CONTROL_COND_TYPE" VARCHAR2(20 BYTE), 
	"EXEC_CONTROL_COND_RESULT" NUMBER, 
	"EXEC_DETAIL_SQL_RESULT" CLOB, 
	"EXEC_RESULT" NUMBER, 
	"EXEC_SEVERITY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("EXEC_DETAIL_SQL_RESULT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "CIS"."CIS_ASS_EXEC"."EXEC_RESULT" IS '0:Fail,1:Success,2:Error 3: Not Made';
   COMMENT ON COLUMN "CIS"."CIS_ASS_EXEC"."EXEC_SEVERITY" IS '1:High,2:Medium,3:Low';
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
	"CONN_DESC" VARCHAR2(500 BYTE), 
	"CONN_NAME" VARCHAR2(250 BYTE), 
	"CONN_GROUP" VARCHAR2(250 BYTE), 
	"CONN_PASSWORD" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "CIS"."CIS_CONNECTIONS"."CONN_TYPE" IS '1: ORACLE 2: MS SQL 3: MY SQL';
--------------------------------------------------------
--  DDL for Table CIS_CONNTYPE
--------------------------------------------------------

  CREATE TABLE "CIS"."CIS_CONNTYPE" 
   (	"CONN_TYPE" NUMBER, 
	"CONN_TYPE_NAME" VARCHAR2(200 BYTE)
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
	"CONTROL_COND_RESULT" NUMBER, 
	"CONTROL_SEVERITY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "CIS"."CIS_CONTROLS"."CONTROL_COND_TYPE" IS '1:SQL 2: Manuel';
   COMMENT ON COLUMN "CIS"."CIS_CONTROLS"."CONTROL_SEVERITY" IS '1:Critical 2: Medium 3: Low';
--------------------------------------------------------
--  DDL for View ASSESSMENT_VIEWS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "CIS"."ASSESSMENT_VIEWS" ("ASS_DATE", "CONN_NAME", "CONN_TYPE_NAME", "BENCHMARK_NAME", "CONN_GROUP", "ASS_SCORE", "PASS_COUNT", "FAIL_COUNT", "NOT_MADE_COUNT", "ASS_NO") AS 
  select to_char(a.ass_date,'dd-mm-yyyy hh24:mi') ass_date , 
b.conn_name conn_name,  
d.conn_type_name conn_type_name,
c.benchmark_name benchmark_name, 
b.conn_group conn_group,
a.ass_score ass_score,
a.pass_count pass_count,
a.fail_count fail_count,
a.not_made_count not_made_count,
a.ass_no ass_no
from
cis_assessments a , cis_connections b , cis_benchmarks c , cis_conntype d
where a.conn_no =b.conn_no and 
a.benchmark_no=c.benchmark_no and
b.conn_type = d.conn_type
;
REM INSERTING into CIS.CIS_ASSESSMENTS
SET DEFINE OFF;
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,10,to_date('01-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,21,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,22,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,41,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,42,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,43,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,142,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,143,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,145,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,146,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,161,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,162,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,164,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,165,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,181,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,345,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,364,to_date('14-DEC-19','DD-MON-RR'),20,null,1,4,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,381,to_date('14-DEC-19','DD-MON-RR'),20,null,1,4,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,403,to_date('14-DEC-19','DD-MON-RR'),16,null,1,5,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,421,to_date('14-DEC-19','DD-MON-RR'),12,null,1,7,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,441,to_date('15-DEC-19','DD-MON-RR'),30,null,3,7,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,521,to_date('16-DEC-19','DD-MON-RR'),50,null,9,9,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,45,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,47,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,48,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,49,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,50,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,51,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,52,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,82,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,125,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,144,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,163,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,301,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,342,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,363,to_date('14-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,46,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,141,to_date('06-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,203,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,221,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,461,to_date('15-DEC-19','DD-MON-RR'),33,null,4,8,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,81,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,101,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,121,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,122,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,123,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,124,to_date('04-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,202,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,204,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,205,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,241,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,242,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,481,to_date('15-DEC-19','DD-MON-RR'),38,null,5,8,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,44,to_date('02-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,61,to_date('03-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,201,to_date('08-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,261,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,0);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,281,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,3);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,321,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,341,to_date('14-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,343,to_date('14-DEC-19','DD-MON-RR'),33,null,1,2,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,344,to_date('14-DEC-19','DD-MON-RR'),33,null,1,2,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,361,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,362,to_date('14-DEC-19','DD-MON-RR'),25,null,1,3,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,401,to_date('14-DEC-19','DD-MON-RR'),20,null,1,4,4);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,402,to_date('14-DEC-19','DD-MON-RR'),null,null,null,null,null);
Insert into CIS.CIS_ASSESSMENTS (CONN_NO,BENCHMARK_NO,ASS_NO,ASS_DATE,ASS_SCORE,ASS_DESC,PASS_COUNT,FAIL_COUNT,NOT_MADE_COUNT) values (1,1,501,to_date('16-DEC-19','DD-MON-RR'),50,null,8,8,4);
REM INSERTING into CIS.CIS_ASS_EXEC
SET DEFINE OFF;
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (201,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (201,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (204,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (204,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (205,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (205,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (204,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (204,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (201,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (201,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (205,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (205,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (221,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (242,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (261,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (261,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (261,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (261,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (242,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (242,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (221,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (242,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (221,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (221,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (301,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (321,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (281,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,null,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (342,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (343,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''jkjk','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,2,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (344,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (363,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (363,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (363,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (363,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (363,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (362,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (345,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (361,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT
    COUNT(*)
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (
        ''OS'',
        ''DB'',
        ''DB,EXTENDED'',
        ''XML'',
        ''XML,EXTENDED''
    )','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;',null,null,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (364,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (402,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (402,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (402,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (402,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT
    COUNT(*)
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (
        ''OS'',
        ''DB'',
        ''DB,EXTENDED'',
        ''XML'',
        ''XML,EXTENDED''
    )','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;',null,null,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (401,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (381,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (421,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (402,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (403,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (441,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.7','Ensure ''REMOTE_LISTENER'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_listener setting determines whether or not a valid listener can be established
on a system separate from the database instance.
Rationale:
As permitting a remote listener for connections to the database instance can allow for the
potential spoofing of connections and that could compromise data confidentiality and
integrity, this value should be disabled/restricted according to the needs of the
organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams208.htm#REFRN10183','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'' and UPPER(VALUE) is null','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LISTENER = '''' SCOPE = SPFILE;','=',1,1,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.7','Ensure ''REMOTE_LISTENER'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_listener setting determines whether or not a valid listener can be established
on a system separate from the database instance.
Rationale:
As permitting a remote listener for connections to the database instance can allow for the
potential spoofing of connections and that could compromise data confidentiality and
integrity, this value should be disabled/restricted according to the needs of the
organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams208.htm#REFRN10183','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'' and UPPER(VALUE) is null;','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LISTENER = '''' SCOPE = SPFILE;','=',1,2,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams210.htm#REFRN10185','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (461,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.10','Ensure ''REMOTE_OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_roles setting permits remote users'' OS roles to be applied to database
management.
Rationale:
As allowing remote clients OS roles to have permissions for database management could
cause privilege overlaps and generally weaken security, this value should be set according
to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams211.htm#REFRN10186','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.11','Ensure ''UTIL_FILE_DIR'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The utl_file_dir setting allows packages like utl_file to access
(read/write/modify/delete) files specified in utl_file_dir. (This is deprecated but usable
in 11g.)
Rationale:
As using the utl_file_dir to create directories allows the manipulation of files in these
directories.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams266.htm#REFRN10230','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','Remediation:
To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET UTIL_FILE_DIR = '''' SCOPE = SPFILE;','=',0,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.12','Ensure ''SEC_CASE_SENSITIVE_LOGON'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_CASE_SENSITIVE_LOGON information determines whether or not case-sensitivity is
required for passwords during login.
Due to the security bug CVE-2012-3137 it is recommended to set this parameter to TRUE if
the October 2012 CPU/PSU or later was applied.
If the patch was not applied it is recommended to set this parameter to FALSE to avoid that
the vulnerability could be abused.
Rationale:
Oracle 11g databases without CPU October 2012 patch or later are vulnerable to CVE-
2012-3137 if case-sensitive SHA-1 password hashes are used. To avoid this kind of attack
the old DES-hashes have to be used.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = TRUE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.7','Ensure ''REMOTE_LISTENER'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_listener setting determines whether or not a valid listener can be established
on a system separate from the database instance.
Rationale:
As permitting a remote listener for connections to the database instance can allow for the
potential spoofing of connections and that could compromise data confidentiality and
integrity, this value should be disabled/restricted according to the needs of the
organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams208.htm#REFRN10183','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'' and UPPER(VALUE) is null','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LISTENER = '''' SCOPE = SPFILE;','=',1,1,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams210.htm#REFRN10185','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.10','Ensure ''REMOTE_OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_roles setting permits remote users'' OS roles to be applied to database
management.
Rationale:
As allowing remote clients OS roles to have permissions for database management could
cause privilege overlaps and generally weaken security, this value should be set according
to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams211.htm#REFRN10186','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.11','Ensure ''UTIL_FILE_DIR'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The utl_file_dir setting allows packages like utl_file to access
(read/write/modify/delete) files specified in utl_file_dir. (This is deprecated but usable
in 11g.)
Rationale:
As using the utl_file_dir to create directories allows the manipulation of files in these
directories.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams266.htm#REFRN10230','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','Remediation:
To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET UTIL_FILE_DIR = '''' SCOPE = SPFILE;','=',0,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.12','Ensure ''SEC_CASE_SENSITIVE_LOGON'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_CASE_SENSITIVE_LOGON information determines whether or not case-sensitivity is
required for passwords during login.
Due to the security bug CVE-2012-3137 it is recommended to set this parameter to TRUE if
the October 2012 CPU/PSU or later was applied.
If the patch was not applied it is recommended to set this parameter to FALSE to avoid that
the vulnerability could be abused.
Rationale:
Oracle 11g databases without CPU October 2012 patch or later are vulnerable to CVE-
2012-3137 if case-sensitive SHA-1 password hashes are used. To avoid this kind of attack
the old DES-hashes have to be used.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams222.htm#REFRN10299
2. https://support.oracle.com/epmos/faces/DocumentDisplay?id=1492721.1
3. http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-3137','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = TRUE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.13','Ensure ''SEC_MAX_FAILED_LOGIN_ATTEMPTS'' Is Set to ''10''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_MAX_FAILED_LOGIN_ATTEMPTS parameter determines how many failed login
attempts are allowed before Oracle closes the login connection.
Rationale:
As allowing an unlimited number of login attempts for a user connection can facilitate both
brute-force login attacks and the occurrence of Denial-of-Service, this value (10) should be
set according to the needs of the organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams223.htm#REFRN10274','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS'' and UPPER(VALUE)=''10''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_MAX_FAILED_LOGIN_ATTEMPTS = 10 SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql','=',0,0,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.','>',0,1,3);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..','>',0,0,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (501,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/','=',0,0,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams210.htm#REFRN10185','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (481,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.14','Ensure ''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' Is Set to ''DELAY,3'' or ''DROP,3''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_PROTOCOL_ERROR_FURTHER_ACTION setting determines the Oracle''s server''s
response to bad/malformed packets received from the client.
Rationale:
As bad packets received from the client can potentially indicate packet-based attacks on the
system, such as "TCP SYN Flood" or "Smurf" attacks, which could result in a Denial-of-
Service condition, this value should be set according to the needs of the organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams224.htm#REFRN10282','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' and 
UPPER(VALUE) in (''(DROP,3)'',''(DELAY,3)'')','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DELAY,3'' SCOPE = SPFILE;
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DROP,3'' SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;','=',1,1,1);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.7','Ensure ''REMOTE_LISTENER'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_listener setting determines whether or not a valid listener can be established
on a system separate from the database instance.
Rationale:
As permitting a remote listener for connections to the database instance can allow for the
potential spoofing of connections and that could compromise data confidentiality and
integrity, this value should be disabled/restricted according to the needs of the
organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams208.htm#REFRN10183','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'' and UPPER(VALUE) is null','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LISTENER = '''' SCOPE = SPFILE;','=',1,1,2);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;','=',1,0,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams210.htm#REFRN10185','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE SCOPE = SPFILE;','=',1,1,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',null,null,3,null);
Insert into CIS.CIS_ASS_EXEC (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_CONTROL_COND_TYPE,EXEC_CONTROL_COND_RESULT,EXEC_RESULT,EXEC_SEVERITY) values (521,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',null,null,3,null);
REM INSERTING into CIS.CIS_BENCHMARKS
SET DEFINE OFF;
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC) values (1,'CIS Oracle Database 11g R2 Benchmark v2.2.0 - 05-31-2016','visit http://benchmarks.cisecurity.org.');
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC) values (2,'CIS Oracle Database 12c Benchmark v2.2.0 - 05-31-2016',null);
REM INSERTING into CIS.CIS_CONNECTIONS
SET DEFINE OFF;
Insert into CIS.CIS_CONNECTIONS (CONN_NO,CONN_USERNAME,CONN_HOST,CONN_PORT,CONN_DBNAME,CONN_TYPE,CONN_DESC,CONN_NAME,CONN_GROUP,CONN_PASSWORD) values (2,'system','xxxxx',1521,'db2',1,null,'db12c','live','oracle');
Insert into CIS.CIS_CONNECTIONS (CONN_NO,CONN_USERNAME,CONN_HOST,CONN_PORT,CONN_DBNAME,CONN_TYPE,CONN_DESC,CONN_NAME,CONN_GROUP,CONN_PASSWORD) values (1,'system','192.168.56.107',1521,'db1',1,null,'db1-11g','live','oracle');
REM INSERTING into CIS.CIS_CONNTYPE
SET DEFINE OFF;
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (1,'ORACLE');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (2,'MSSQL');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (3,'MySQL');
REM INSERTING into CIS.CIS_CONTROLS
SET DEFINE OFF;
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10836/advcfg.htm#NETAG0132','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.',null,'Remove extproc from the listener.ora file.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.1.3','Ensure ''ADMIN_RESTRICTIONS_<listener_name>'' Is Set to ''ON''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The admin_restrictions_<listener_name> setting in the listener.ora file can require
that any attempted real-time alteration of the parameters in the listener via the set
command file be refused unless the listener.ora file is manually altered then restarted by
a privileged user.
Rationale:
As blocking unprivileged users from making alterations of the listener.ora file, where
remote data/services are specified, will help protect data confidentiality, this value should
be set to the needs of the organization.

Default Value:
Not set.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF310','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.',null,'Use a text editor such as vi to set the ADMIN_RESTRICTIONS_<listener_name> to the value
ON.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.1','Ensure ''AUDIT_SYS_OPERATIONS'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT_SYS_OPERATIONS setting provides for the auditing of all user activities conducted
under the SYSOPER and SYSDBA accounts.
Rationale:
If the parameter AUDIT_SYS_OPERATIONS is FALSE all statements except of
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.4','Ensure ''LOCAL_LISTENER'' Is Set Appropriately','Profile Applicability:
? Level 1 - RDBMS
Description:
The local_listener setting specifies a network name that resolves to an address of the
Oracle TNS listener.
Rationale:
The TNS poisoning attack allows to redirect TNS network traffic to another system by
registering a listener to the TNS listener. This attack can be performed by unauthorized
users with network access. By specifying the IPC protocol it is no longer possible to register
listeners via TCP/IP.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams118.htm#REFRN10082
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'' and 
UPPER(VALUE)=''(DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER)))''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET LOCAL_LISTENER=''[description]'' SCOPE = BOTH;
Replace [description] with the appropriate description from your listener.ora file,
where that description sets the PROTOCOL parameter to IPC. For example:
ALTER SYSTEM SET LOCAL_LISTENER=''(DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=REGISTER)))''
SCOPE=BOTH;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.5','Ensure ''O7_DICTIONARY_ACCESSIBILITY'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The O7_dictionary_accessibility setting is a database initializations parameter that
allows/disallows with the EXECUTE ANY PROCEDURE and SELECT ANY DICTIONARY
access to objects in the SYS schema; this functionality was created for the ease of migration
from Oracle 7 databases to later versions.
Rationale:
As leaving the SYS schema so open to connection could permit unauthorized access to
critical data structures, this value should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;',1,'=',1,1);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams175.htm#REFRN10153','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT  UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET OS_ROLES = FALSE SCOPE = SPFILE;',1,'=',1,1);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.7','Ensure ''REMOTE_LISTENER'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_listener setting determines whether or not a valid listener can be established
on a system separate from the database instance.
Rationale:
As permitting a remote listener for connections to the database instance can allow for the
potential spoofing of connections and that could compromise data confidentiality and
integrity, this value should be disabled/restricted according to the needs of the
organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams208.htm#REFRN10183','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'' and UPPER(VALUE) is null','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LISTENER = '''' SCOPE = SPFILE;',1,'=',1,2);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.1.1','Ensure ''SECURE_CONTROL_<listener_name>'' Is Set In ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_CONTROL_<listener_name> setting determines the type of control connection
the Oracle server requires for remote configuration of the listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF
327','To audit this recommendation follow these steps:
? Open the $ORACLE_HOME/network/admin/listener.ora file (or
%ORACLE_HOME%\network\admin\listener.ora on Windows)
? Ensure that each defined listener as an
associated SECURE_CONTROL_<listener_name> directive.
For example:
LISTENER1 =
(DESCRIPTION=
(ADDRESS=(PROTOCOL=TCP) (HOST=sales-server)(PORT=1521))
(ADDRESS=(PROTOCOL=IPC) (KEY=REGISTER))
(ADDRESS=(PROTOCOL=TCPS) (HOST=sales-server)(PORT=1522)))
SECURE_CONTROL_LISTENER1=TCPS',null,'Set the SECURE_CONTROL_<listener_name> for each defined listener in the listener.ora
file, according to the needs of the organization.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.1.4','Ensure ''SECURE_REGISTER_<listener_name>'' Is Set to ''TCPS'' or ''IPC''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
The SECURE_REGISTER_<listener_name> setting specifies the protocols which are used to
connect to the TNS listener.
Rationale:
As listener configuration changes via unencrypted remote connections can result in
unauthorized users sniffing the control configuration information from the network, these
control values should be set according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e10835/listener.htm#NETRF328
2. https://support.oracle.com/epmos/faces/ui/km/DocumentDisplay.jspx?id=1453883.1','To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.',null,'Use a text editor such as vi to set the SECURE_REGISTER_<listener_name>=TCPS or
SECURE_REGISTER_<listener_name>=IPC for each listener found in
$ORACLE_HOME/network/admin/listener.ora.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams210.htm#REFRN10185','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.10','Ensure ''REMOTE_OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_roles setting permits remote users'' OS roles to be applied to database
management.
Rationale:
As allowing remote clients OS roles to have permissions for database management could
cause privilege overlaps and generally weaken security, this value should be set according
to the needs of the organization.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams211.htm#REFRN10186','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_OS_ROLES = FALSE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.11','Ensure ''UTIL_FILE_DIR'' Is Empty','Profile Applicability:
? Level 1 - RDBMS
Description:
The utl_file_dir setting allows packages like utl_file to access
(read/write/modify/delete) files specified in utl_file_dir. (This is deprecated but usable
in 11g.)
Rationale:
As using the utl_file_dir to create directories allows the manipulation of files in these
directories.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams266.htm#REFRN10230','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR''','Remediation:
To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET UTIL_FILE_DIR = '''' SCOPE = SPFILE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'1.1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed - 2','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';

To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-
069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#R
EFRN23549','SELECT  count(*)
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000','SELECT to_char(ACTION)||to_char(VERSION)||to_char(ID)
FROM DBA_REGISTRY_HISTORY','Download and apply the latest quarterly Critical Patch Update patches..',1,'>',0,1);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'1.2','Ensure All Default Passwords Are Changed','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation has a view called DBA_USERS_WITH_DEFPWD, which keeps a list of all
database users making use of default passwords.
Rationale:
Default passwords should be considered "well known" to attackers. Consequently, if
default passwords remain in place any attacker with access to the database then has the
ability to authenticate as the user with that default password. When default passwords are
altered, this circumstance is mitigated.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%'';
The assessment fails if results are returned.
Remediation:
To remediate this recommendation, you may perform either of the following actions.
? Manually issue the following SQL statement for each USERNAME returned in the
Audit Procedure:
PASSWORD <username>
? Execute the following SQL script to randomly assign passwords:
begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10575/tdpsg_user_accounts.htm#TDPSG20000','SELECT count(*)
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''','SELECT USERNAME
FROM DBA_USERS_WITH_DEFPWD
WHERE USERNAME NOT LIKE ''%XS$NULL%''xvc','begin
for r_user in
(select username from dba_users_with_defpwd where username not like ''%XS$NULL%'')
loop
DBMS_OUTPUT.PUT_LINE(''Password for user ''||r_user.username||'' will be
changed.'');
execute immediate ''alter user "''||r_user.username||''" identified by
"''||DBMS_RANDOM.string(''a'',16)||''"account lock password expire'';
end loop;
end;
/',1,'=',0,2);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'1.1','Ensure the Appropriate Version/Patches for Oracle Software Is Installed -1','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle installation should be supported with security patches and the latest Critical
Patch Updates should be applied quarterly.
Rationale:
As using the most recent Oracle database software, along with all applicable patches can
help limit the possibilities for vulnerabilities in the software, the installation version
and/or patches applied during setup should be established according to the needs of the
organization. Ensure you are using a release that is covered by a level of support that
includes the generation of Critical Patch Updates.
Audit:
To assess this recommendation, execute the following SQL statements.
To check for a supported version of Oracle Database 11g R2:
SELECT PRODUCT, VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%'';
To check for application of quarterly Critical Patch Updates:
SELECT ACTION, VERSION,ID
FROM DBA_REGISTRY_HISTORY
WHERE TO_DATE(TRIM(TO_CHAR(ID)), ''YYMMDD'') > SYSDATE-90 AND ID > 160000;
A row returned by each SQL statement would be a pass for the recommendation.
Remediation:
Download and apply the latest quarterly Critical Patch Update patches.
References:
1. http://www.oracle.com/us/support/assurance/fixing-policies/index.html
2. http://www.oracle.com/technetwork/topics/security/alerts-086861.html
3. http://www.oracle.com/us/support/library/lifetime-support-technology-069183.pdf
4. http://docs.oracle.com/cd/E11882_01/server.112/e40402/statviews_4212.htm#REFRN23549','SELECT  count(*)
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','SELECT PRODUCT||''-''||VERSION
FROM PRODUCT_COMPONENT_VERSION
WHERE PRODUCT LIKE ''%Database%'' AND VERSION LIKE ''11.2.0.4%''','Download and apply the latest quarterly Critical Patch Update patches.',1,'>',0,3);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'1.3','Ensure All Sample Data And Users Have Been Removed','Profile Applicability:
? Level 1 - RDBMS
Description:
Oracle sample schemas are not needed for the operation of the database. These include,
among others, information pertaining to a sample schemas pertaining to Human Resources,
Business Intelligence, Order Entry, and the like. These samples create sample users
(BI,HR,OE,PM,IX,SH, SCOTT), in addition to tables and fictitious data.
Rationale:
The sample data is typically not required for production operations of the database and
provides users with well-known default passwords, particular views, and
procedures/functions. Such users, views, and/or procedures/functions could be used to
launch exploits against production environments.
Audit:
To assess this recommendation, check for the presence of Oracle sample users by executing
the following SQL statement.
SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'');
Remediation:
To remediate this setting, it is recommended that you execute the following SQL script.
$ORACLE_HOME/demo/schema/drop_sch.sql
NOTE: The recyclebin is not set to OFF within the default drop script, which means that
the data will still be present in your environment until the recyclebin is emptied.
Impact:
The Oracle sample user names may be in use on a production basis. It is important that you
first verify that BI, HR, IX, OE, PM, SCOTT, and/or SH are not valid production user names
before executing the dropping SQL scripts. This may be particularly true with the HR and
BI users. If any of these users are present, it is important to be cautious and confirm
the schemas present are, in fact, Oracle sample schemas and not production schemas
being relied upon by business operations.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e10831/toc.htm','SELECT count(*)
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','SELECT USERNAME
FROM ALL_USERS
WHERE USERNAME IN (''BI'',''HR'',''IX'',''OE'',''PM'',''SCOTT'',''SH'')','exec $ORACLE_HOME/demo/schema/drop_sch.sql',1,'=',0,3);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.2','Ensure ''AUDIT_TRAIL'' Is Set to ''OS'', ''DB'', ''XML'', ''DB,EXTENDED'', or ''XML,EXTENDED''','Profile Applicability:
? Level 1 - RDBMS
Description:
The audit_trail setting determines whether or not Oracle''s basic audit features are
enabled. These can be set to "Operating System"(OS), "DB", "DB,EXTENDED", "XML"
or "XML,EXTENDED".
Rationale:
As enabling the basic auditing features for the Oracle instance permits the collection of data
to troubleshoot problems, as well as providing value forensic logs in the case of a system
breach, this value should be set according to the needs of the organization.

References:
1. https://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams017.htm#REFRN10006
2. http://www.oracle.com/technetwork/products/audit-vault/learnmore/twpsecurity-auditperformance-166655.pdf','SELECT COUNT(*) FROM v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''
    AND upper(value) IN (''OS'',''DB'',''DB,EXTENDED'',''XML'',''XML,EXTENDED'')','SELECT
    VALUE
FROM
    v$parameter
WHERE
    upper(name) = ''AUDIT_TRAIL''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET AUDIT_TRAIL = DB SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = DB, EXTENDED SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = OS SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML SCOPE = SPFILE;
ALTER SYSTEM SET AUDIT_TRAIL = XML, EXTENDED SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.12','Ensure ''SEC_CASE_SENSITIVE_LOGON'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_CASE_SENSITIVE_LOGON information determines whether or not case-sensitivity is
required for passwords during login.
Due to the security bug CVE-2012-3137 it is recommended to set this parameter to TRUE if
the October 2012 CPU/PSU or later was applied.
If the patch was not applied it is recommended to set this parameter to FALSE to avoid that
the vulnerability could be abused.
Rationale:
Oracle 11g databases without CPU October 2012 patch or later are vulnerable to CVE-
2012-3137 if case-sensitive SHA-1 password hashes are used. To avoid this kind of attack
the old DES-hashes have to be used.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams222.htm#REFRN10299
2. https://support.oracle.com/epmos/faces/DocumentDisplay?id=1492721.1
3. http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2012-3137','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON = TRUE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.13','Ensure ''SEC_MAX_FAILED_LOGIN_ATTEMPTS'' Is Set to ''10''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_MAX_FAILED_LOGIN_ATTEMPTS parameter determines how many failed login
attempts are allowed before Oracle closes the login connection.
Rationale:
As allowing an unlimited number of login attempts for a user connection can facilitate both
brute-force login attacks and the occurrence of Denial-of-Service, this value (10) should be
set according to the needs of the organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams223.htm#REFRN10274','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS'' and UPPER(VALUE)=''10''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_MAX_FAILED_LOGIN_ATTEMPTS = 10 SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.14','Ensure ''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' Is Set to ''DELAY,3'' or ''DROP,3''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_PROTOCOL_ERROR_FURTHER_ACTION setting determines the Oracle''s server''s
response to bad/malformed packets received from the client.
Rationale:
As bad packets received from the client can potentially indicate packet-based attacks on the
system, such as "TCP SYN Flood" or "Smurf" attacks, which could result in a Denial-of-
Service condition, this value should be set according to the needs of the organization.
References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams224.htm#REFRN10282','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' and 
UPPER(VALUE) in (''(DROP,3)'',''(DELAY,3)'')','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DELAY,3'' SCOPE = SPFILE;
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DROP,3'' SCOPE = SPFILE;',1,'=',1,null);
