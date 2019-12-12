--------------------------------------------------------
--  File created - Thursday-December-12-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ASSESSMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CIS"."ASSESSMENT_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 261 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
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
	"CONN_GROUP" VARCHAR2(250 BYTE)
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
REM INSERTING into CIS.CIS_BENCHMARKS
SET DEFINE OFF;
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC) values (1,'CIS Oracle Database 11g R2 Benchmark v2.2.0 - 05-31-2016','visit http://benchmarks.cisecurity.org.');
REM INSERTING into CIS.CIS_CONNECTIONS
SET DEFINE OFF;
Insert into CIS.CIS_CONNECTIONS (CONN_NO,CONN_USERNAME,CONN_HOST,CONN_PORT,CONN_DBNAME,CONN_TYPE,CONN_DESC,CONN_NAME,CONN_GROUP) values (1,'system','192.168.56.107',1521,'db1',1,null,'db1-11g','live');
REM INSERTING into CIS.CIS_CONNTYPE
SET DEFINE OFF;
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (1,'ORACLE');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (2,'MSSQL');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (3,'MySQL');
REM INSERTING into CIS.CIS_CONTROLS
SET DEFINE OFF;
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4','xxxx',null,null,null,null,null,null,null,1);
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
