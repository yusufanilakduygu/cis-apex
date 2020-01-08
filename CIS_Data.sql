--------------------------------------------------------
--  File created - Wednesday-January-08-2020   
--------------------------------------------------------
REM INSERTING into CIS.CIS_BENCHMARKS
SET DEFINE OFF;
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC,CONN_TYPE,DATABASE_VERSION) values (701,'Oracle 12','Deneme',1,'12');
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC,CONN_TYPE,DATABASE_VERSION) values (1,'CIS Oracle Database 11g R2 Benchmark v2.2.0 - 05-31-2016','visit http://benchmarks.cisecurity.org.',1,'11');
Insert into CIS.CIS_BENCHMARKS (BENCHMARK_NO,BENCHMARK_NAME,BENCHMARK_DESC,CONN_TYPE,DATABASE_VERSION) values (741,'CIS Microsoft SQL Server 2012 Benchmark v1.5.0 - 05-31-2019',null,2,'12');
REM INSERTING into CIS.CIS_CONNTYPE
SET DEFINE OFF;
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (1,'ORACLE');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (2,'SQL SERVER');
Insert into CIS.CIS_CONNTYPE (CONN_TYPE,CONN_TYPE_NAME) values (3,'MySQL');
REM INSERTING into CIS.CIS_CONTROLS
SET DEFINE OFF;
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.14','Ensure ''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' Is Set to ''DELAY,3'' or ''DROP,3''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_PROTOCOL_ERROR_FURTHER_ACTION setting determines the Oracle''s server''s
response to bad/malformed packets received from the client.
Rationale:
As bad packets received from the client can potentially indicate packet-based attacks on the
system, such as "TCP SYN Flood" or "Smurf" attacks, which could result in a Denial-of-
Service condition, this value should be set according to the needs of the organization.

Audit:

To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION'';

Ensure VALUE is set to DELAY,3 or DROP,3.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams224.htm#REFRN10282','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION'' and 
UPPER(VALUE) in (''(DROP,3)'',''(DELAY,3)'')','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_FURTHER_ACTION''','To remediate this setting execute one of the following SQL statements.
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DELAY,3'' SCOPE = SPFILE;
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_FURTHER_ACTION = ''DROP,3'' SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.15','Ensure ''SEC_PROTOCOL_ERROR_TRACE_ACTION'' Is Set to ''LOG''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SEC_PROTOCOL_ERROR_TRACE_ACTION setting determines the Oracle''s server''s logging
response level to bad/malformed packets received from the client, by generating ALERT,
LOG, or TRACE levels of detail in the log files.
Rationale:
As bad packets received from the client can potentially indicate packet-based attacks on the
system, such as "TCP SYN Flood" or "Smurf" attacks, which could result in a Denial-of-
Service condition, this diagnostic/logging value for ALERT, LOG, or TRACE conditions should
be set according to the needs of the organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_TRACE_ACTION'';

Ensure VALUE is set to LOG.

References:
1. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams214.htm','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_TRACE_ACTION''  and UPPER(VALUE) =''LOG''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_PROTOCOL_ERROR_TRACE_ACTION''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_PROTOCOL_ERROR_TRACE_ACTION=LOG SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.16','Ensure ''SEC_RETURN_SERVER_RELEASE_BANNER'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The information about patch/update release number provides information about the exact
patch/update release that is currently running on the database.
Rationale:
As allowing the database to return information about the patch/update release
number could facilitate unauthorized users'' attempts to gain access based upon known
patch weaknesses, this value should be set according to the needs of the organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_RETURN_SERVER_RELEASE_BANNER'';

Ensure VALUE is set to FALSE.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams226.htm#REFRN10275','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_RETURN_SERVER_RELEASE_BANNER''  and UPPER(VALUE) =''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_RETURN_SERVER_RELEASE_BANNER''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_RETURN_SERVER_RELEASE_BANNER = FALSE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.17','Ensure ''SQL92_SECURITY'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The sql92_security parameter setting TRUE requires a user to have SELECT privilege on a
column in order to reference it in the WHERE clause of a DELETE or UPDATE statement or
on the right hand side of a SET clause in an UPDATE statement.
Rationale:
A user without SELECT privilege can still infer the value stored in a column by referring to
that column in a DELETE or UPDATE statement. This setting prevents inadvertent
information disclosure by ensuring that only users who already have SELECT privilege can
execute the statements that would allow them to infer the stored values.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SQL92_SECURITY'';
Ensure VALUE is set to TRUE.


References:

1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams246.htm#REFRN10210','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SQL92_SECURITY'' and UPPER(VALUE) =''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SQL92_SECURITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SQL92_SECURITY = TRUE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.18','Ensure ''_TRACE_FILES_PUBLIC'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The _trace_files_public setting determines whether or not the system''s trace file is
world readable.
Rationale:
As permitting the read permission to other anyone can read the instance''s trace files file
which could contain sensitive information about instance operations, this value should be
restricted according to the needs of the organization.

Audit:
To assess this recommendation execute the following SQL statement.

SELECT VALUE
FROM V$PARAMETER
WHERE NAME=''_trace_files_public'';

A VALUE equal to FALSE or lack of results implies compliance.','select sum(A) from 
(
SELECT count(*) A
FROM V$PARAMETER
WHERE UPPER(NAME)=''_TRACE_FILES_PUBLIC'' and ( UPPER(VALUE)  = ''TRUE''  )
union all
SELECT count(*) A
FROM V$PARAMETER
WHERE UPPER(NAME)=''_TRACE_FILES_PUBLIC''  
)','SELECT UPPER(NAME)
FROM V$PARAMETER
WHERE UPPER(NAME)=''_TRACE_FILES_PUBLIC''','Remediation:
To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET "_trace_files_public" = FALSE SCOPE = SPFILE;',1,'<>',2,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.19','Ensure ''RESOURCE_LIMIT'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
RESOURCE_LIMIT determines whether resource limits are enforced in database profiles
Rationale:
If resource_limit is set to FALSE, none of the system resource limits that are set in any
database profiles are enforced. If resource_limit is set to TRUE, then the limits set in
database profiles are enforced.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''RESOURCE_LIMIT'';

Ensure VALUE is set to TRUE.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams214.htm#REFRN10188','SELECT count(*)  
FROM V$PARAMETER
WHERE UPPER(NAME)=''RESOURCE_LIMIT'' and ( UPPER(VALUE)  = ''TRUE''  )','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''RESOURCE_LIMIT''','Remediation:
To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET RESOURCE_LIMIT = TRUE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.3','Ensure ''GLOBAL_NAMES'' Is Set to ''TRUE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The global_names setting requires that the name of a database link matches that of the
remote database it will connect to.
Rationale:
As not requiring database connections to match the domain that is being called remotely
could allow unauthorized domain sources to potentially connect via brute-force tactics, this
value should be set according to the needs of the organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'';
Ensure VALUE is set to TRUE.


References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams096.htm#REFRN10065','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''GLOBAL_NAMES''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET GLOBAL_NAMES = TRUE SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.6','Ensure ''OS_ROLES'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The os_roles setting permits externally created groups to be applied to database
management.
Rationale:
As allowing the OS use external groups for database management could cause privilege
overlaps and generally weaken security, this value should be set according to the needs of
the organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''OS_ROLES'';

Ensure VALUE is set to FALSE.

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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LISTENER'';
Ensure VALUE is empty.

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

Audit:
To audit this recommendation follow these steps:
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
SECURE_CONTROL_LISTENER1=TCPS



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

To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I SECURE_REGISTER %ORACLE_HOME%\network\admin\listener.ora
Ensure SECURE_REGISTER_<listener_name> is set to TCPS or IPC.

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
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.9','Ensure ''REMOTE_OS_AUTHENT'' Is Set to ''FALSE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The remote_os_authent setting determines whether or not OS ''roles'' with the attendant
privileges are allowed for remote client connections.
Rationale:
As permitting OS roles for database connections to can allow the spoofing of connections
and permit granting the privileges of an OS role to unauthorized users to make
connections, this value should be restricted according to the needs of the organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_AUTHENT'';

Ensure VALUE is set to FALSE.


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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_OS_ROLES'';

Ensure VALUE is set to FALSE.

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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''UTIL_FILE_DIR'';

Ensure VALUE is empty.

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
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.1.2','Ensure ''extproc'' Is Not Present in ''listener.ora''','Profile Applicability:
? Level 1 - Linux Host OS
? Level 1 - Windows Server Host OS
Description:
Oracle extproc allows the database to run procedures from operating system libraries.
These library calls can, in turn, run any operating system command.
Rationale:
extproc should be removed from the listener.ora to mitigate the risk that OS libraries can
be invoked by the Oracle instance.

To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I extproc %ORACLE_HOME%\network\admin\listener.ora
Ensure extproc does not exist.

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


To audit this recommendation execute the following shell commands as appropriate for
your Unix/Windows environment.
Unix environment:
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
Windows environment:
find /I admin_restrictions %ORACLE_HOME%|\network\admin\listener.ora
Ensure ADMIN_RESTRICTIONS_<listener_name> is set to ON for all listeners.


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
Startup/Shutdown and Logon by SYSDBA/SYSOPER users are not audited.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'';
Ensure VALUE is set to TRUE.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams015.htm#REFRN10005','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS'' and UPPER(VALUE)=''TRUE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME) = ''AUDIT_SYS_OPERATIONS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET AUDIT_SYS_OPERATIONS = TRUE SCOPE=SPFILE;',1,'=',1,null);
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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''LOCAL_LISTENER'';

Ensure VALUE is set to (DESCRIPTION=(ADDRESS= (PROTOCOL=IPC)(KEY=REGISTER))).

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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'';

Ensure VALUE is set to FALSE.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY'' and UPPER(VALUE)=''FALSE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''O7_DICTIONARY_ACCESSIBILITY''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET O7_DICTIONARY_ACCESSIBILITY=FALSE SCOPE = SPFILE;',1,'=',1,1);
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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''AUDIT_TRAIL'';
Ensure VALUE is set to OS or DB or DB,EXTENDED or XML or XML,EXTENDED.

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

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_CASE_SENSITIVE_LOGON'';

Ensure VALUE is set to TRUE.

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

Audit:

To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS'';

Ensure VALUE is set to 10.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams223.htm#REFRN10274','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS'' and UPPER(VALUE)=''10''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''SEC_MAX_FAILED_LOGIN_ATTEMPTS''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET SEC_MAX_FAILED_LOGIN_ATTEMPTS = 10 SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.5','Ensure ''PASSWORD_REUSE_TIME'' Is Greater than or Equal to ''365''','Profile Applicability:
? Level 1 - RDBMS
Description:
The password_reuse_time setting determines the amount of time in days that must pass
before the same password may be reused.
Rationale:
As reusing the same password after only a short period of time has passed makes the
success of brute-force login attacks more likely, this value should be set according to the
needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_REUSE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 365
);
Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_REUSE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 365
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_REUSE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 365
)','Remediation:
Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME 365;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.6','Ensure ''PASSWORD_GRACE_TIME'' Is Less than or Equal to ''5''','Profile Applicability:
? Level 1 - RDBMS
Description:
The password_grace_time setting determines how many days can pass after the user''s
password expires before the user''s login capability is automatically locked out.
Rationale:
As locking the user account after the expiration of the password change requirement''s
grace period can help prevent password-based attack against a forgotten or disused
accounts, while still allowing the account and its information to be accessible by DBA
intervention, this value should be set according to the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_GRACE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
);
Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_GRACE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_GRACE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT PASSWORD_GRACE_TIME 5;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.7','Ensure ''DBA_USERS.PASSWORD'' Is Not Set to ''EXTERNAL'' for Any User','Profile Applicability:
? Level 1 - RDBMS
Description:
The password=''EXTERNAL'' setting determines whether or not a user can be authenticated
by a remote OS to allow access to the database with full authorization.
Rationale:
As allowing remote OS authentication of a user to the database can potentially allow
supposed "privileged users" to connect as "authenticated," even when the remote system is
compromised, these logins should be disabled/restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS
WHERE PASSWORD=''EXTERNAL'';
Lack of results implies compliance.','SELECT count(*)
FROM DBA_USERS
WHERE PASSWORD=''EXTERNAL''','SELECT USERNAME
FROM DBA_USERS
WHERE PASSWORD=''EXTERNAL''','To remediate this setting execute the following SQL statement.
ALTER USER <username> IDENTIFIED BY <password>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.8','Ensure ''PASSWORD_VERIFY_FUNCTION'' Is Set for All Profiles','Profile Applicability:
? Level 1 - RDBMS
Description:
The password_verify_function determines password settings requirements when a user
password is changed at the SQL command prompt. This setting does not apply for users
managed by the Oracle password file.
Rationale:
As requiring users to apply the 11gr2 security features in password creation, such as
forcing mixed-case complexity, the blocking of simple combinations, and change/history
settings can potentially thwart logins by unauthorized users, this function should be
applied/enabled according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT PROFILE, RESOURCE_NAME
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_VERIFY_FUNCTION''
AND (LIMIT = ''DEFAULT'' OR LIMIT = ''NULL'');

Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_VERIFY_FUNCTION''
AND (LIMIT = ''DEFAULT'' OR LIMIT = ''NULL'')','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_VERIFY_FUNCTION''
AND (LIMIT = ''DEFAULT'' OR LIMIT = ''NULL'')','Create a custom password verification function which fulfills the password requirements of
the organization.
From Oracle documentation: Oracle Database provides a sample password verification
function in the PL/SQL script UTLPWDMG.SQL (located in
ORACLE_BASE/ORACLE_HOME/RDBMS/ADMIN) that, when enabled, checks whether
users are correctly creating or modifying their passwords. The UTLPWDMG.SQL script
provides two password verification functions: one for previous releases of Oracle Database
and an updated version for Oracle Database Release 11g.
http://docs.oracle.com/cd/E25054_01/network.1111/e16543/authentication.htm',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.9','Ensure ''SESSIONS_PER_USER'' Is Less than or Equal to ''10''','Profile Applicability:
? Level 1 - RDBMS
Description:
The SESSIONS_PER_USER (Number of sessions allowed) determines the maximum number
of user sessions that are allowed to be open concurrently.
Rationale:
As limiting the number of the SESSIONS_PER_USER can help prevent memory resource
exhaustion by poorly formed requests or intentional Denial-of-Service attacks, this value
should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''SESSIONS_PER_USER''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 10
);
Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''SESSIONS_PER_USER''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 10
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''SESSIONS_PER_USER''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 10
)','To remediate this setting execute the following SQL statement.
ALTER PROFILE DEFAULT LIMIT SESSIONS_PER_USER 10;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.10','Ensure No Users Are Assigned the ''DEFAULT'' Profile','Profile Applicability:
? Level 1 - RDBMS
Description:
Upon creation database users are assigned to the DEFAULT profile unless otherwise
specified.
Rationale:
It is recommended that users be created with function-appropriate profiles. The DEFAULT
profile, being defined by Oracle, is subject to change at any time (e.g. by patch or version
update). The DEFAULT profile has unlimited settings that are often required by the SYS user
when patching; such unlimited settings should be tightly reserved and not applied to
unnecessary users.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT USERNAME
FROM DBA_USERS
WHERE PROFILE=''DEFAULT''
AND ACCOUNT_STATUS=''OPEN''
AND USERNAME NOT IN
(''ANONYMOUS'', ''CTXSYS'', ''DBSNMP'', ''EXFSYS'', ''LBACSYS'',
''MDSYS'', ''MGMT_VIEW'',''OLAPSYS'',''OWBSYS'', ''ORDPLUGINS'',
''ORDSYS'', ''OUTLN'', ''SI_INFORMTN_SCHEMA'',''SYS'',
''SYSMAN'', ''SYSTEM'', ''TSMSYS'', ''WK_TEST'', ''WKSYS'',
''WKPROXY'', ''WMSYS'', ''XDB'', ''CISSCAN'');
Lack of results implies compliance.','SELECT count(*)
FROM DBA_USERS
WHERE PROFILE=''DEFAULT''
AND ACCOUNT_STATUS=''OPEN''
AND USERNAME NOT IN
(''ANONYMOUS'', ''CTXSYS'', ''DBSNMP'', ''EXFSYS'', ''LBACSYS'',
''MDSYS'', ''MGMT_VIEW'',''OLAPSYS'',''OWBSYS'', ''ORDPLUGINS'',
''ORDSYS'', ''OUTLN'', ''SI_INFORMTN_SCHEMA'',''SYS'',
''SYSMAN'', ''SYSTEM'', ''TSMSYS'', ''WK_TEST'', ''WKSYS'',
''WKPROXY'', ''WMSYS'', ''XDB'', ''CISSCAN'')','SELECT USERNAME
FROM DBA_USERS
WHERE PROFILE=''DEFAULT''
AND ACCOUNT_STATUS=''OPEN''
AND USERNAME NOT IN
(''ANONYMOUS'', ''CTXSYS'', ''DBSNMP'', ''EXFSYS'', ''LBACSYS'',
''MDSYS'', ''MGMT_VIEW'',''OLAPSYS'',''OWBSYS'', ''ORDPLUGINS'',
''ORDSYS'', ''OUTLN'', ''SI_INFORMTN_SCHEMA'',''SYS'',
''SYSMAN'', ''SYSTEM'', ''TSMSYS'', ''WK_TEST'', ''WKSYS'',
''WKPROXY'', ''WMSYS'', ''XDB'', ''CISSCAN'')','To remediate this recommendation execute the following SQL statement for each user
returned by the audit query using a functional-appropriate profile.
ALTER USER <username> PROFILE <appropriate_profile>',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.1','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_ADVISOR''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_ADVISOR package can be used to write files located on the
server where the Oracle instance is installed.
Rationale:
As use of the DBMS_ADVISOR package could allow an unauthorized user to corrupt operating
system files on the instance''s host, use of this package should be restricted according to the
needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_ADVISOR'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_advis.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_ADVISOR''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_ADVISOR''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_ADVISOR FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.2','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_CRYPTO''','Profile Applicability:
? Level 1 - RDBMS
Description:
The DBMS_CRYPTO settings provide a toolset that determines the strength of the encryption
algorithm used to encrypt application data and is part of the SYS schema. The DES (56-bit
key), 3DES (168-bit key), 3DES-2KEY (112-bit key), AES (128/192/256-bit keys), and RC4
are available.
Rationale:
As execution of these cryptography procedures by the user PUBLIC can potentially
endanger portions of or all of the data storage, this value should be set according to the
needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND TABLE_NAME=''DBMS_CRYPTO'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_crypto.htm#ARPLS664','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND TABLE_NAME=''DBMS_CRYPTO''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND TABLE_NAME=''DBMS_CRYPTO''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_CRYPTO FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.3','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_JAVA''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_JAVA package can run Java classes (e.g. OS commands) or grant
Java privileges.
Rationale:
The DBMS_JAVA package could allow an attacker to run operating system commands from
the database.
Audit:
To assess this recommendation, execute the following SQL statement.

References:
1. http://docs.oracle.com/cd/E11882_01/java.112/e10588/appendixa.htm#JJDEV13000

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_JAVA FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.4','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_JAVA_TEST''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_JAVA_TEST package can run Java classes (e.g. OS commands) or
grant Java privileges.
Rationale:
The DBMS_JAVA_TEST package could allow an attacker to run operating system commands
from the database.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA_TEST''

The assessment fails if results are returned

References:
1. http://www.databasesecurity.com/HackingAurora.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA_TEST''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JAVA_TEST''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_JAVA_TEST FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.5','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_JOB''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_JOB package schedules and manages the jobs sent to the job
queue and has been superseded by the DBMS_SCHEDULER package, even though DBMS_JOB
has been retained for backwards compatibility.
Rationale:
As use of the DBMS_JOB package could allow an unauthorized user to disable or overload the
job queue and has been superseded by the DBMS_SCHEDULER package, this package should
be disabled or restricted according to the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JOB'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_job.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JOB''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_JOB''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_JOB FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.6','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_LDAP''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_LDAP package contains functions and procedures that enable
programmers to access data from LDAP servers.
Rationale:
As use of the DBMS_LDAP package can be used to create specially crafted error messages or
send information via DNS to the outside.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LDAP'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E23943_01/oid.1111/e10186/dbmsldap_ref.htm#OIMAD009','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LDAP''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LDAP''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_LDAP FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.7','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_LOB''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_LOB package provides subprograms that can manipulate and
read/write on BLOBs, CLOBs, NCLOBs, BFILEs, and temporary LOBs.
Rationale:
As use of the DBMS_LOB package could allow an unauthorized user to manipulate BLOBs,
CLOBs, NCLOBs, BFILEs, and temporary LOBs on the instance, either destroying data or
causing a Denial-of-Service condition due to corruption of disk space, use of this package
should be restricted according to the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LOB'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_lob.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LOB''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_LOB''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_LOB FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.8','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_OBFUSCATION_TOOLKIT''','Profile Applicability:
? Level 1 - RDBMS
Description:
The DBMS_OBFUSCATION_TOOLKIT settings provide one of the tools that determine the
strength of the encryption algorithm used to encrypt application data and is part of the SYS
schema. The DES (56-bit key) and 3DES (168-bit key) are the only two types available.
Rationale:
As allowing the PUBLIC user privileges to access this capability can be potentially harm the
data storage, this access should be set according to the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_OBFUSCATION_TOOLKIT'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_obtool.htm#ARPLS028','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_OBFUSCATION_TOOLKIT''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_OBFUSCATION_TOOLKIT''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_OBFUSCATION_TOOLKIT FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.9','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_RANDOM''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_RANDOM package is used for generating random numbers but
should not be used for cryptographic purposes.
Rationale:
As assignment of use of the DBMS_RANDOM package can allow the unauthorized application of
the random number-generating function, this capability should be restricted according to
the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_RANDOM'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_random.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_RANDOM''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_RANDOM''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_RANDOM FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.10','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_SCHEDULER''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_SCHEDULER package schedules and manages the database and
operating system jobs.
Rationale:
As use of the DBMS_SCHEDULER package could allow an unauthorized user to run database or
operating system jobs.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SCHEDULER'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_sched.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SCHEDULER''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SCHEDULER''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_SCHEDULER FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.11','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_SQL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_SQL package is used for running dynamic SQL statements.
Rationale:
The DBMS_SQL package could allow privilege escalation if the input validation is not done
properly.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SQL'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_sql.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SQL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SQL''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_SQL FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.12','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_XMLGEN''','Profile Applicability:
? Level 1 - RDBMS
Description:
The DBMS_XMLGEN package takes an arbitrary SQL query as input, converts it to XML
format, and returns the result as a CLOB.
Rationale:
The package DBMS_XMLGEN can be used to search the entire database for critical
information like credit card numbers, and other sensitive information.
Audit:

To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLGEN'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_xmlgen.htm
2. http://www.red-database-security.com/wp/confidence2009.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLGEN''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLGEN''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_XMLGEN FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.13','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_XMLQUERY''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle package DBMS_XMLQUERY takes an arbitrary SQL query, converts it to XML
format, and returns the result. This package is similar to DBMS_XMLGEN.
Rationale:
The package DBMS_XMLQUERY can be used to search the entire database for critical
information like credit card numbers and other sensitive information.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLQUERY'';
The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_xmlque.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLQUERY''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_XMLQUERY''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON DBMS_XMLQUERY FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.14','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_FILE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_FILE package can be used to read/write files located on the
server where the Oracle instance is installed.
Rationale:
As use of the UTL_FILE package could allow a user to read files at the operating system.
These files could contain sensitive information (e.g. passwords in .bash_history).
Audit:
To assess this recommendation, execute the following SQL statement

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_FILE'';

The assessment fails if results are returned.

Impact:
Use caution when revoking privileges from PUBLIC. After revoking privileges from PUBLIC,
recompile any invalid database objects. Specific grants to users and roles may be needed to
make objects valid. See IMPORTANT information at the start of this section for more
details.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/u_file.htm#ARPLS70896','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_FILE''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_FILE''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON UTL_FILE FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.15','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_INADDR''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_INADDR package can be used to create specially crafted error
messages or send information via DNS to the outside.
Rationale:
As use of the UTL_INADDR package is often used in SQL Injection attacks from the web it
should be revoked from public.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_INADDR'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/u_inaddr.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_INADDR''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_INADDR''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON UTL_INADDR FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.16','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_TCP''','Description:
The Oracle database UTL_TCP package can be used to read/write file to TCP sockets on the
server where the Oracle instance is installed.
Rationale:
As use of the UTL_TCP package could allow an unauthorized user to corrupt the TCP stream
used for carry the protocols that communicate with the instance''s external
communications, use of this package should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_TCP'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/u_tcp.htm#ARPLS71533','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_TCP''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_TCP''','Remediation:
To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON UTL_TCP FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.17','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_MAIL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_MAIL package can be used to send email from the server where
the Oracle instance is installed.
Rationale:
As use of the UTL_MAIL package could allow an unauthorized user to corrupt the SMTP
function to accept or generate junk mail that can result in a Denial-of-Service condition due
to network saturation, use of this package should be restricted according to the needs of
the organization.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_MAIL'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/u_mail.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_MAIL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_MAIL''','To remediate this setting execute the following SQL statement.
REVOKE EXECUTE ON UTL_MAIL FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.18','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_SMTP''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_SMTP package can be used to send email from the server where
the Oracle instance is installed.
Rationale:
As use of the UTL_SMTP package could allow an unauthorized user to corrupt the SMTP
function to accept or generate junk mail that can result in a Denial-of-Service condition due
to network saturation, use of this package should be restricted according to the needs of
the organization.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_SMTP'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/u_smtp.htm','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_SMTP''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_SMTP''','REVOKE EXECUTE ON UTL_SMTP FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.19','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_DBWS''','Description:
The Oracle database UTL_DBWS package can be used to read/write file to web-based
applications on the server where the Oracle instance is installed.
Rationale:
As use of the UTL_DBWS package could allow an unauthorized user to corrupt the HTTP
stream used for carry the protocols that communicate with the instance''s web-based
external communications, use of this package should be restricted according to the needs of
the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
References:
1. http://docs.oracle.com/cd/B19306_01/appdev.102/b14258/u_dbws.htm


SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_DBWS'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_DBWS''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_DBWS''','REVOKE EXECUTE ON UTL_DBWS FROM ''PUBLIC'';',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.3','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_AQADM_SYSCALLS''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_AQADM_SYSCALLS package is shipped as undocumented and
allows to run SQL commands as user SYS.
Rationale:
As use of the DBMS_AQADM_SYSCALLS package could allow an unauthorized user to run SQL
commands as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYSCALLS'';

The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYSCALLS''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYSCALLS''','REVOKE EXECUTE ON DBMS_AQADM_SYSCALLS FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.4','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_REPCAT_SQL_UTL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_REPCAT_SQL_UTL package is shipped as undocumented and
allows to run SQL commands as user SYS.
Rationale:
As use of the DBMS_REPCAT_SQL_UTL package could allow an unauthorized user to run SQL
commands as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_REPCAT_SQL_UTL'';

The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_REPCAT_SQL_UTL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_REPCAT_SQL_UTL''','revoke execute on DBMS_REPCAT_SQL_UTL FROM PUBLIC',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.5','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''INITJVMAUX''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database INITJVMAUX package is shipped as undocumented and allows to run
SQL commands as user SYS.
Rationale:
As use of the INITJVMAUX package could allow an unauthorized user to run SQL commands as
user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''INITJVMAUX'';

The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''INITJVMAUX''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''INITJVMAUX','REVOKE EXECUTE ON INITJVMAUX FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.6','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_STREAMS_ADM_UTL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_STREAMS_ADM_UTL package is shipped as undocumented and
allows to run SQL commands as user SYS.
Rationale:
As use of the DBMS_STREAMS_ADM_UTL package could allow an unauthorized user to run SQL
commands as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_ADM_UTL'';
The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_ADM_UTL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_ADM_UTL''','REVOKE EXECUTE ON DBMS_STREAMS_ADM_UTL FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.7','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_AQADM_SYS''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_AQADM_SYS package is shipped as undocumented and allows to
run SQL commands as user SYS.
Rationale:
As use of the DBMS_AQADM_SYS package could allow an unauthorized user to run SQL commands
as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYS'';

The assessment fails if results are returned.

References:
1. http://www.google.de/#hl=de&safe=off&sclient=psyab&
q=DBMS_STREAMS_ADM_UTL&oq=DBMS_STREAMS_ADM_UTL&gs_l=serp.3..0i1
0i30.38260.38260.0.38463.1.1.0.0.0.0.105.105.0j1.1.0...0.0...1c.2.1-
46wqcQeow&pbx=1&bav=on.2,or.r_gc.r_pw.r_cp.r_qf.&fp=2569366ac9a6532d&bpc','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYS''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_AQADM_SYS''','REVOKE EXECUTE ON DBMS_AQADM_SYS FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.8','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_STREAMS_RPC''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_STREAMS_RPC package is shipped as undocumented and allows to
run SQL commands as user SYS.
Rationale:
As use of the DBMS_STREAMS_RPC package could allow an unauthorized user to run SQL
commands as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_RPC'';

The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_RPC''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_STREAMS_RPC''','REVOKE EXECUTE ON DBMS_STREAMS_RPC FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.9','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_PRVTAQIM''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_PRVTAQIM package is shipped as undocumented and allows to
run SQL commands as user SYS.
Rationale:
As use of the DBMS_PRVTAQIM package could allow an unauthorized user to escalate privileges
because any SQL statements could be executed as user SYS.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_PRVTAQIM'';

The assessment fails if results are returned.

References:
1. http://www.databasesecurity.com/dbsec/ohh-indirect-privilege-escalation.pdf','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_PRVTAQIM''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_PRVTAQIM''','REVOKE EXECUTE ON DBMS_PRVTAQIM FROM PUBLIC',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.10','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''LTADM''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database LTADM package is shipped as undocumented and allows privilege
escalation if granted to unprivileged users.
Rationale:
As use of the LTADM package could allow an unauthorized user to run any SQL command as user
SYS.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''LTADM'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_PRVTAQIM''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''LTADM''','REVOKE EXECUTE ON LTADM FROM PUBLIC;',1,'=',0,null);
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
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.20','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_ORAMTS''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_ORAMTS package can be used to perform HTTP-requests. This
could be used to send information to the outside.
Rationale:
As use of the UTL_ORAMTS package could be used to send (sensitive) information to external
websites. The use of this package should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_ORAMTS'';

The assessment fails if results are returned.

http://docs.oracle.com/cd/E11882_01/win.112/e26104/recovery.htm#NTMTS139','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_ORAMTS''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_ORAMTS''','REVOKE EXECUTE ON UTL_ORAMTS FROM PUBLIC',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.21','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''UTL_HTTP''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database UTL_HTTP package can be used to perform HTTP-requests. This could
be used to send information to the outside.
Rationale:
As use of the UTL_HTTP package could be used to send (sensitive) information to external
websites. The use of this package should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_HTTP'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_HTTP''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''UTL_HTTP''','REVOKE EXECUTE ON UTL_HTTP FROM PUBLIC',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.1.22','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''HTTPURITYPE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database HTTPURITYPE object type can be used to perform HTTP-requests.
Rationale:
The ability to perform HTTP requests could be used to leak information from the database
to an external destination.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''HTTPURITYPE'';
The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''HTTPURITYPE''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''HTTPURITYPE''','REVOKE EXECUTE ON HTTPURITYPE FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.1','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_SYS_SQL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_SYS_SQL package is shipped as undocumented.
Rationale:
As use of the DBMS_SYS_SQL package could allow a user to run code as a different user
without entering user credentials.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SYS_SQL'';

The assessment fails if results are returned.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/guidelines.htm#DBSEG499
2. http://asktom.oracle.com/pls/asktom/f?p=100:11:0::::P11_QUESTION_ID:1325202421535','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SYS_SQL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_SYS_SQL''','REVOKE EXECUTE ON DBMS_SYS_SQL FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.2','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_BACKUP_RESTORE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_BACKUP_RESTORE package is used for applying PL/SQL
commands to the native RMAN sequences.
Rationale:
As assignment of use of the DBMS_BACKUP_RESTORE package can allow to access file
permissions on operating system level.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_BACKUP_RESTORE'';

The assessment fails if results are returned.

References:
1. http://psoug.org/reference/dbms_backup_restore.html
2. http://davidalejomarcos.wordpress.com/2011/09/13/how-to-list-files-on-adirectory-
from-oracle-database/','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_BACKUP_RESTORE''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_BACKUP_RESTORE''','REVOKE EXECUTE ON DBMS_BACKUP_RESTORE FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'2.2.8','Ensure ''REMOTE_LOGIN_PASSWORDFILE'' Is Set to ''NONE''','Description:
The remote_login_passwordfile setting specifies whether or not Oracle checks for a
password file during login and how many databases can use the password file.
Rationale:
As the use of this sort of password login file could permit unsecured, privileged
connections to the database, this value should be set according to the needs of the
organization.

Audit:
To assess this recommendation execute the following SQL statement.
SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'';

Ensure VALUE is set to NONE.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams212.htm#REFRN10184
2. http://docs.oracle.com/cd/B28359_01/server.111/b28320/initparams198.htm#REFRN10184','SELECT count(*)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE'' and UPPER(VALUE)=''NONE''','SELECT UPPER(VALUE)
FROM V$PARAMETER
WHERE UPPER(NAME)=''REMOTE_LOGIN_PASSWORDFILE''','To remediate this setting execute the following SQL statement.
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = ''NONE'' SCOPE = SPFILE;',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.1','Ensure ''FAILED_LOGIN_ATTEMPTS'' Is Less than or Equal to ''5''','Profile Applicability:
? Level 1 - RDBMS
Description:
The failed_login_attempts setting determines how many failed login attempts are
permitted before the system locks the user''s account. While different profiles can have
different and more restrictive settings, such as USERS and APPS, the minimum(s)
recommended here should be set on the DEFAULT profile.
Rationale:
As repeated failed login attempts can indicate the initiation of a brute-force login attack,
this value should be set according to the needs of the organization (see warning below on
a known bug that can make this security measure backfire).
Audit:

To assess this recommendation, execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''FAILED_LOGIN_ATTEMPTS''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
);

Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''FAILED_LOGIN_ATTEMPTS''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''FAILED_LOGIN_ATTEMPTS''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT FAILED_LOGIN_ATTEMPTS 5;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.2','Ensure ''PASSWORD_LOCK_TIME'' Is Greater than or Equal to ''1''','Profile Applicability:
? Level 1 - RDBMS
Description:
The PASSWORD_LOCK_TIME setting determines how many days must pass for the user''s
account to be unlocked after the set number of failed login attempts has occurred.
Rationale:
As locking the user account after repeated failed login attempts can block further bruteforce
login attacks, but can create administrative headaches as this account unlocking
process always requires DBA intervention, this value should be set according to the needs
of the organization.
Audit:

To assess this recommendation, execute the following SQL statement. 
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LOCK_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 1
);

Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LOCK_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LOCK_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 5
)','Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME 1;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.3','Ensure ''PASSWORD_LIFE_TIME'' Is Less than or Equal to ''90''','Profile Applicability:
? Level 1 - RDBMS
Description:
The password_life_time setting determines how long a password may be used before the
user is required to be change it.
Rationale:
As allowing passwords to remain unchanged for long periods makes the success of bruteforce
login attacks more likely, this value should be set according to the needs of the
organization.

Audit:

To assess this recommendation, execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LIFE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 90
);
Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LIFE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 90
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LIFE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT > 90
)','Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT PASSWORD_LOCK_TIME 1;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'3.4','Ensure ''PASSWORD_REUSE_MAX'' Is Greater than or Equal to ''20''','Profile Applicability:
? Level 1 - RDBMS
Description:
The password_reuse_max setting determines how many different passwords must be used
before the user is allowed to reuse a prior password.
Rationale:
As allowing reuse of a password within a short period of time after the password''s initial
use can make the success of both social-engineering and brute-force password-based
attacks more likely, this value should be set according to the needs of the organization.
Audit:
To assess this recommendation, execute the following SQL statement.
SELECT PROFILE, RESOURCE_NAME, LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_REUSE_MAX''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 20
);
Lack of results implies compliance.','SELECT count(*)
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_REUSE_MAX''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 20
)','SELECT ''Profile: ''||PROFILE||'' Resource Name: ''||RESOURCE_NAME||'' Limit:''||LIMIT
FROM DBA_PROFILES
WHERE RESOURCE_NAME=''PASSWORD_LIFE_TIME''
AND
(
LIMIT = ''DEFAULT''
OR LIMIT = ''UNLIMITED''
OR LIMIT < 20
)','Remediate this setting by executing the following SQL statement.
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_MAX 20;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.2','Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''USER_HISTORY$''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SYS.USER_HISTORY$ table contains all the audit records for the user''s
password change history. (This table gets updated by password changes if the user has an
assigned profile that has password reuse limit set, e.g., PASSWORD_REUSE_TIME set to other
than UNLIMITED.)
Rationale:
As permitting non-privileged users the authorization to manipulate the records in the
SYS.USER_HISTORY$ table can allow distortion of the audit trail, potentially hiding
unauthorized data confidentiality attacks or integrity changes, this capability should be
restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER_HISTORY$'';

Lack of results implies compliance.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER_HISTORY$''','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER_HISTORY$''','REVOKE ALL ON USER_HISTORY$ FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.3','Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''LINK$''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SYS.LINK$ table contains all the user''s password information and data
table link information.
Rationale:
As permitting non-privileged users to manipulate or view the SYS.LINK$ table can allow
capture of password information and/or corrupt the primary database linkages, this
capability should be restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''LINK$'';
Lack of results implies compliance.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''LINK$''','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''LINK$''','REVOKE ALL ON LINK$ FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.4','Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''SYS.USER$''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SYS.USER$ table contains the users'' hashed password information.
Rationale:
As permitting non-privileged users the authorization to open the SYS.USER$ table can allow
the capture of password hashes for the later application of password cracking algorithms
to breach confidentiality, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER$''
AND GRANTEE NOT IN (''CTXSYS'',''XDB'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''ORACLE_OCM'');

Lack of results implies compliance.

References:
1. http://dba.stackexchange.com/questions/17513/what-do-the-columns-in-sysuser-represent','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER$''
AND GRANTEE NOT IN (''CTXSYS'',''XDB'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''ORACLE_OCM'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''USER$''
AND GRANTEE NOT IN (''CTXSYS'',''XDB'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''ORACLE_OCM'')','REVOKE ALL ON SYS.USER$ FROM <username>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.5','Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''DBA_%''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBA_ views show all information which is relevant to administrative
accounts.
Rationale:
As permitting users the authorization to manipulate the DBA_ views can expose sensitive
data.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT * FROM DBA_TAB_PRIVS
WHERE TABLE_NAME LIKE ''DBA_%''
AND GRANTEE NOT IN (''APPQOSSYS'',''AQ_ADMINISTRATOR_ROLE'',''CTXSYS'',
''EXFSYS'',''MDSYS'',''OLAP_XS_ADMIN'',''OLAPSYS'',''ORDSYS'',''OWB$CLIENT'',''OWBSYS'',
''SELECT_CATALOG_ROLE'',''WM_ADMIN_ROLE'',''WMSYS'',''XDBADMIN'',''LBACSYS'',
''ADM_PARALLEL_EXECUTE_TASK'',''CISSCANROLE'')
AND NOT REGEXP_LIKE(grantee,''^APEX_0[3-9][0-9][0-9][0-9][0-9]$'') 

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e25789/datadict.htm#autoId2','SELECT count(*) FROM DBA_TAB_PRIVS
WHERE TABLE_NAME LIKE ''DBA_%''
AND GRANTEE NOT IN (''APPQOSSYS'',''AQ_ADMINISTRATOR_ROLE'',''CTXSYS'',
''EXFSYS'',''MDSYS'',''OLAP_XS_ADMIN'',''OLAPSYS'',''ORDSYS'',''OWB$CLIENT'',''OWBSYS'',
''SELECT_CATALOG_ROLE'',''WM_ADMIN_ROLE'',''WMSYS'',''XDBADMIN'',''LBACSYS'',
''ADM_PARALLEL_EXECUTE_TASK'',''CISSCANROLE'')
AND NOT REGEXP_LIKE(grantee,''^APEX_0[3-9][0-9][0-9][0-9][0-9]$'')','SELECT  ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE||'', OWNER : ''||OWNER||'' , ''||'' TABLE_NAME : ''||TABLE_NAME  FROM DBA_TAB_PRIVS
WHERE TABLE_NAME LIKE ''DBA_%''
AND GRANTEE NOT IN (''APPQOSSYS'',''AQ_ADMINISTRATOR_ROLE'',''CTXSYS'',
''EXFSYS'',''MDSYS'',''OLAP_XS_ADMIN'',''OLAPSYS'',''ORDSYS'',''OWB$CLIENT'',''OWBSYS'',
''SELECT_CATALOG_ROLE'',''WM_ADMIN_ROLE'',''WMSYS'',''XDBADMIN'',''LBACSYS'',
''ADM_PARALLEL_EXECUTE_TASK'',''CISSCANROLE'')
AND NOT REGEXP_LIKE(grantee,''^APEX_0[3-9][0-9][0-9][0-9][0-9]$'')','REVOKE ALL ON DBA_ FROM <Non-DBA/SYS grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.6','4.5.6 Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''SYS.SCHEDULER$_CREDENTIAL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SCHEDULER$_CREDENTIAL table contains the database scheduler
credential information.
Rationale:
As permitting non-privileged users the authorization to open the
SYS.SCHEDULER$_CREDENTIAL table.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''SCHEDULER$_CREDENTIAL'';

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_sched.htm#ARPLS72292
2. http://berxblog.blogspot.de/2012/02/restore-dbmsschedulercreatecredential.html','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''SCHEDULER$_CREDENTIAL''','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''SCHEDULER$_CREDENTIAL''','REVOKE ALL ON SYS.SCHEDULER$_CREDENTIAL FROM <username>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.7','Ensure ''SYS.USER$MIG'' Has Been Dropped','Profile Applicability:
? Level 1 - RDBMS
Description:
The table sys.user$mig is created during migration and contains the Oracle password
hashes before the migration starts.
Rationale:
The table sys.user$mig is not deleted after the migration. An attacker could access the table
containing the Oracle password hashes.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT OWNER, TABLE_NAME
FROM ALL_TABLES
WHERE OWNER=''SYS''
AND TABLE_NAME=''USER$MIG'';

Lack of results implies compliance.','SELECT count(*)
FROM ALL_TABLES
WHERE OWNER=''SYS''
AND TABLE_NAME=''USER$MIG''','SELECT ''OWNER : ''||OWNER||'' , TABLE_NAME : ''||TABLE_NAME
FROM ALL_TABLES
WHERE OWNER=''SYS''
AND TABLE_NAME=''USER$MIG''','DROP TABLE SYS.USER$MIG;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.6','Ensure ''%ANY%'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database ANY keyword provides the user the capability to alter any item in the
catalog of the database.
Rationale:
As authorization to use the ANY expansion of a privilege can allow an unauthorized user to
potentially change confidential data or damage the data catalog, this capability should be
restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE LIKE ''%ANY%''
AND GRANTEE NOT IN (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''DBSNMP'',''EXFSYS'',
''EXP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'',
''JAVADEBUGPRIV'',''MDSYS'',''OEM_MONITOR'',''OLAPSYS'',''OLAP_DBA'',''ORACLE_OCM'',
''OWB$CLIENT'',''OWBSYS'',''SCHEDULER_ADMIN'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''SYSMAN'',''SYSTEM'',''WMSYS'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''LBACSYS'',''OUTLN'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99877','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE LIKE ''%ANY%''
AND GRANTEE NOT IN (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''DBSNMP'',''EXFSYS'',
''EXP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'',
''JAVADEBUGPRIV'',''MDSYS'',''OEM_MONITOR'',''OLAPSYS'',''OLAP_DBA'',''ORACLE_OCM'',
''OWB$CLIENT'',''OWBSYS'',''SCHEDULER_ADMIN'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''SYSMAN'',''SYSTEM'',''WMSYS'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''LBACSYS'',''OUTLN'')','Select count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE LIKE ''%ANY%''
AND GRANTEE NOT IN (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''DBSNMP'',''EXFSYS'',
''EXP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'',
''JAVADEBUGPRIV'',''MDSYS'',''OEM_MONITOR'',''OLAPSYS'',''OLAP_DBA'',''ORACLE_OCM'',
''OWB$CLIENT'',''OWBSYS'',''SCHEDULER_ADMIN'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''SYSMAN'',''SYSTEM'',''WMSYS'',''APEX_030200'',
''APEX_040000'',''APEX_040100'',''APEX_040200'',''LBACSYS'',''OUTLN'')','REVOKE ''<ANY Privilege>'' FROM <grantee>',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.7','Ensure ''DBA_SYS_PRIVS.%'' Is Revoked from Unauthorized ''GRANTEE'' with ''ADMIN_OPTION'' Set to ''YES''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database WITH_ADMIN privilege allows the designated user to grant another user
the same privileges.
Rationale:
As assignment of the WITH_ADMIN privilege can allow the granting of a restricted privilege to
an unauthorized user, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE ADMIN_OPTION=''YES''
AND GRANTEE not in (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''OWBSYS'',
''SCHEDULER_ADMIN'',''SYS'',''SYSTEM'',''WMSYS'',
''APEX_030200'',''APEX_040000'',''APEX_040100'',''APEX_040200'');

Lack of results implies compliance.','Select count(*)
FROM DBA_SYS_PRIVS
WHERE ADMIN_OPTION=''YES''
AND GRANTEE not in (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''OWBSYS'',
''SCHEDULER_ADMIN'',''SYS'',''SYSTEM'',''WMSYS'',
''APEX_030200'',''APEX_040000'',''APEX_040100'',''APEX_040200'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE ADMIN_OPTION=''YES''
AND GRANTEE not in (''AQ_ADMINISTRATOR_ROLE'',''DBA'',''OWBSYS'',
''SCHEDULER_ADMIN'',''SYS'',''SYSTEM'',''WMSYS'',
''APEX_030200'',''APEX_040000'',''APEX_040100'',''APEX_040200'')','REVOKE <privilege> FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.3','Enable ''DROP USER'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The USER object for the Oracle database is a specification of an object which is an account
through which either a human or an application can connect to, via a JDBC or log into, via a
CLI, and interact with the database instance according to the roles and privileges allotted to
account.
Rationale:
As the logging of user activities involving the creation, alteration, or dropping of a USER can
provide forensic evidence about a pattern of suspect/unauthorized activities, the audit
capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT DROP USER;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.4','Enable ''ROLE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The ROLE object allows for the creation of a set of privileges that can be granted to users or
other roles. This audits all attempts, successful or not, to create, drop, alter or set roles.
Rationale:
Roles are a key database security infrastructure component. Any attempt to create, drop or alter
a role should be audited. This statement auditing option also audits attempts, successful or not,
to set a role in a session. Any unauthorized attempts to create, drop or alter a role may be worthy
of investigation. Attempts to set a role by users without the role privilege may warrant
investigation.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ROLE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

Impact:
The change to the audit/check is to ensure that the audit is in effect for all users, regardless
of proxy or success.
The change to the title, description and rationale are to better clarify what it actually
does. (e.g. It does NOT audit "all ROLE activities/requests". For example, it does not audit
role grants and revokes.)','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ROLE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ROLE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT ROLE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.8','Ensure Proxy Users Have Only ''CONNECT'' Privilege','Profile Applicability:
? Level 1 - RDBMS
Description:
Do not grant privileges directly to proxy users
Rationale:
A proxy user should only have the ability to connect to the database.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN
(
SELECT PROXY
FROM DBA_PROXIES
)
AND GRANTED_ROLE NOT IN (''CONNECT'');

Lack of results implies compliance.','SELECT count(*)
FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN
(
SELECT PROXY
FROM DBA_PROXIES
)
AND GRANTED_ROLE NOT IN (''CONNECT'')','SELECT ''GRANTEE : ''||GRANTEE||'', GRANTED_ROLE : ''||GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN
(
SELECT PROXY
FROM DBA_PROXIES
)
AND GRANTED_ROLE NOT IN (''CONNECT'')','REVOKE [PRIVILEGE] FROM <proxy_user>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.9','Ensure ''EXECUTE ANY PROCEDURE'' Is Revoked from ''OUTLN'' (','Profile Applicability:
? Level 1 - RDBMS
Description:
Remove unneeded privileges from OUTLN
Rationale:
Migrated OUTLN users have more privileges than required.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''OUTLN'';

Lack of results implies compliance.','Select count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''OUTLN''','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''OUTLN''','REVOKE EXECUTE ANY PROCEDURE FROM OUTLN;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.10','Ensure ''EXECUTE ANY PROCEDURE'' Is Revoked from ''DBSNMP''','Profile Applicability:
? Level 1 - RDBMS
Description:
Remove unneeded privileges from DBSNMP
Rationale:
Migrated DBSNMP users have more privileges than required.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''DBSNMP'';

Lack of results implies compliance.','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''DBSNMP''','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXECUTE ANY PROCEDURE''
AND GRANTEE=''DBSNMP''','REVOKE EXECUTE ANY PROCEDURE FROM DBSNMP;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.1','Enable ''USER'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The USER object in the Oracle database an account through which a connection may be
made to interact with the database according to the roles and privileges allotted to
account. It is also a schema with may own database objects. This audits all activities and
requests to create, drop or alter a user, including a user changing their own
password. (The latter is not audited by ''audit ALTER USER''.)
Rationale:
Any unauthorized attempts to create, drop or alter a user should cause concern, whether
successful or not. It can also be useful in forensics if an account is compromised and is
mandated by many common security initiatives. An abnormally high number of these
activities in a given period might be worth investigation. Any failed attempt to drop a user
or create a user may be worth further review.
Audit:
To assess this recommendation execute the following SQL Statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''

Lack of results implies a finding.

Impact:
This would the current 5.2 (audit CREATE USER), 5.3 (audit ALTER USER), and 5.4 (audit
DROP USER) privilege audits with the single statement auditing option "audit USER". Any
action audited by those three privilege audits would also be audited by this. In addition,
this would audit:
1) Attempts to create user by anyone without the CREATE USER system privilege
2) Attempts to drop user by anyone without the DROP USER system privilege
3) Attempts to alter user by anyone without the ALTER USER system privilege
4) Users changing or attempting to change their own passwords (which is not done by
auditing ALTER USER).','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT USER;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.2','Enable ''ALTER USER'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The USER object for the Oracle database is a specification of an object which is an account
through which either a human or an application can connect to, via a JDBC or log into, via a
CLI, and interact with the database instance according to the roles and privileges allotted to
account.
Rationale:
As the logging of user activities involving the creation, alteration, or dropping of a USER can
provide forensic evidence about a pattern of suspect/unauthorized activities, the audit
capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER USER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT ALTER USER;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.11','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''WWV_DBMS_SQL''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database WWV_DBMS_SQL package is shipped as undocumented and allows Oracle
Application Express to run dynamic SQL statements.
Rationale:
As use of the WWV_DBMS_SQL package could allow an unauthorized user to run SQL statements as
Application Express (APEX) user.
Audit:
To assess this recommendation, execute the following SQL statement.

References:
1. http://docs.oracle.com/cd/E11882_01/install.112/e12196/trouble.htm#HTMIG267

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_DBMS_SQL'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_DBMS_SQL''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_DBMS_SQL''','REVOKE EXECUTE ON WWV_DBMS_SQL FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.12','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''WWV_EXECUTE_IMMEDIATE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database WWV_EXECUTE_IMMEDIATE package is shipped as undocumented and
allows Oracle Application Express to run dynamic SQL statements.
Rationale:
As use of the WWV_EXECUTE_IMMEDIATE package could allow an unauthorized user to run SQL
statements as Application Express (APEX) user.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_EXECUTE_IMMEDIATE'';

The assessment fails if results are returned.

References:
1. http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1811
2. https://forums.oracle.com/forums/thread.jspa?threadID=953790','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_EXECUTE_IMMEDIATE''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''WWV_EXECUTE_IMMEDIATE''','REVOKE EXECUTE ON WWV_EXECUTE_IMMEDIATE FROM PUBLIC',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.13','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_IJOB''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_IJOB package is shipped as undocumented and allows to run
database jobs in the context of another user.
Rationale:
As use of the DBMS_IJOB package could allow an attacker to change identities by using a
different username to execute a database job.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_IJOB'';

The assessment fails if results are returned.','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_IJOB''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_IJOB''','REVOKE EXECUTE ON DBMS_IJOB FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.2.14','Ensure ''EXECUTE'' Is Revoked from ''PUBLIC'' on ''DBMS_FILE_TRANSFER''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBMS_FILE_TRANSFER package allows to transfer files from one
database server to another.
Rationale:
As use of the DBMS_FILE_TRANSFER package could allow to transfer files from one database
server to another.
Audit:
To assess this recommendation, execute the following SQL statement.

SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_FILE_TRANSFER'';

The assessment fails if results are returned.
References:
1. http://docs.oracle.com/cd/E11882_01/appdev.112/e25788/d_ftran.htm#ARPLS095','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_FILE_TRANSFER''','SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE=''PUBLIC''
AND PRIVILEGE=''EXECUTE''
AND TABLE_NAME=''DBMS_FILE_TRANSFER''','REVOKE EXECUTE ON DBMS_FILE_TRANSFER FROM PUBLIC;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.1','Ensure ''SELECT_ANY_DICTIONARY'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SELECT ANY DICTIONARY privilege allows the designated user to access
SYS schema objects.
Rationale:
The Oracle database SELECT ANY DICTIONARY privilege allows the designated user to access
SYS schema objects. The Oracle password hashes are part of the SYS schema and can be
selected using SELECT ANY DICTIONARY privileges.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY DICTIONARY''
AND GRANTEE NOT IN (''DBA'',''DBSNMP'',''OEM_MONITOR'',
''OLAPSYS'',''ORACLE_OCM'',''SYSMAN'',''WMSYS'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#BABHFJFJ
2. http://docs.oracle.com/cd/E11882_01/server.112/e25513/initparams157.htm#REFRN10133
3. http://arup.blogspot.de/2011/07/difference-between-select-any.html','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY DICTIONARY''
AND GRANTEE NOT IN (''DBA'',''DBSNMP'',''OEM_MONITOR'',
''OLAPSYS'',''ORACLE_OCM'',''SYSMAN'',''WMSYS'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY DICTIONARY''
AND GRANTEE NOT IN (''DBA'',''DBSNMP'',''OEM_MONITOR'',''OLAPSYS'',''ORACLE_OCM'',''SYSMAN'',''WMSYS'')','REVOKE SELECT_ANY_DICTIONARY FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.2','Ensure ''SELECT ANY TABLE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SELECT ANY TABLE privilege allows the designated user to open any
table, except of SYS, to view it.
Rationale:
As assignment of the SELECT ANY TABLE privilege can allow the unauthorized viewing of
sensitive data, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY TABLE''
AND GRANTEE NOT IN (''DBA'', ''MDSYS'', ''SYS'', ''IMP_FULL_DATABASE'', ''EXP_FULL_DATABASE'',
''DATAPUMP_IMP_FULL_DATABASE'', ''WMSYS'',
''SYSTEM'',''OLAP_DBA'',''OLAPSYS'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_10002.htm#SQLRF01702','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY TABLE''
AND GRANTEE NOT IN (''DBA'', ''MDSYS'', ''SYS'', ''IMP_FULL_DATABASE'', ''EXP_FULL_DATABASE'',
''DATAPUMP_IMP_FULL_DATABASE'', ''WMSYS'',
''SYSTEM'',''OLAP_DBA'',''OLAPSYS'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''SELECT ANY TABLE''
AND GRANTEE NOT IN (''DBA'', ''MDSYS'', ''SYS'', ''IMP_FULL_DATABASE'', ''EXP_FULL_DATABASE'',
''DATAPUMP_IMP_FULL_DATABASE'', ''WMSYS'',
''SYSTEM'',''OLAP_DBA'',''OLAPSYS'')','REVOKE SELECT ANY TABLE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.3','Ensure ''AUDIT SYSTEM'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database AUDIT SYSTEM privilege allows the change auditing activities on the
system.
Rationale:
As assignment of the AUDIT SYSTEM privilege can allow the unauthorized alteration of
system audit activities, disabling the creation of audit trails, this capability should be
restricted according to the needs of the organization.
Audit:
To asses this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''AUDIT SYSTEM''
AND GRANTEE NOT IN (''DBA'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''SYS'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_4007.htm#SQLRF01107','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''AUDIT SYSTEM''
AND GRANTEE NOT IN (''DBA'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''SYS'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''AUDIT SYSTEM''
AND GRANTEE NOT IN (''DBA'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',''SYS'')','REVOKE AUDIT SYSTEM FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.4','Ensure ''EXEMPT ACCESS POLICY'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database EXEMPT ACCESS POLICY keyword provides the user the capability to
access all the table rows regardless of row-level security lockouts.
Rationale:
As assignment of the EXEMPT ACCESS POLICY privilege can allow an unauthorized user to
potentially access/change confidential data, this capability should be restricted according
to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXEMPT ACCESS POLICY'';

Lack of results implies compliance.','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXEMPT ACCESS POLICY''','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''EXEMPT ACCESS POLICY''','REVOKE EXEMPT ACCESS POLICY FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.5','Ensure ''BECOME USER'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database BECOME USER privilege allows the designated user to inherit the rights
of another user.
Rationale:
As assignment of the BECOME USER privilege can allow the unauthorized use of another
user''s privileges, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''BECOME USER''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/B19306_01/network.102/b14266/cfgaudit.htm','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''BECOME USER''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''BECOME USER''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'')','REVOKE BECOME USER FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.6','Ensure ''CREATE_PROCEDURE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database CREATE PROCEDURE privilege allows the designated user to create a
stored procedure that will fire when given the correct command sequence.
Rationale:
As assignment of the CREATE PROCEDURE privilege can lead to severe problems in
unauthorized hands, such as rogue procedures facilitating data theft or Denial-of-Service by
corrupting data tables, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE PROCEDURE''
AND GRANTEE NOT IN ( ''DBA'',''DBSNMP'',''MDSYS'',''OLAPSYS'',''OWB$CLIENT'',
''OWBSYS'',''RECOVERY_CATALOG_OWNER'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''RESOURCE'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_6009.htm#SQLRF01309','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE PROCEDURE''
AND GRANTEE NOT IN ( ''DBA'',''DBSNMP'',''MDSYS'',''OLAPSYS'',''OWB$CLIENT'',
''OWBSYS'',''RECOVERY_CATALOG_OWNER'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''RESOURCE'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE PROCEDURE''
AND GRANTEE NOT IN ( ''DBA'',''DBSNMP'',''MDSYS'',''OLAPSYS'',''OWB$CLIENT'',
''OWBSYS'',''RECOVERY_CATALOG_OWNER'',''SPATIAL_CSW_ADMIN_USR'',
''SPATIAL_WFS_ADMIN_USR'',''SYS'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''RESOURCE'')','REVOKE CREATE PROCEDURE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.7','Ensure ''ALTER SYSTEM'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database ALTER SYSTEM privilege allows the designated user to dynamically
alter the instance''s running operations.
Rationale:
As assignment of the ALTER SYSTEM privilege can lead to severe problems, such as the
instance''s session being killed or the stopping of redo log recording, which would make
transactions unrecoverable, this capability should be severely restricted according to the
needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''ALTER SYSTEM''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''DBA'');
Lack of results implies compliance.','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''ALTER SYSTEM''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''DBA'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''ALTER SYSTEM''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''APEX_030200'',''APEX_040000'',
''APEX_040100'',''APEX_040200'',''DBA'')','REVOKE ALTER SYSTEM FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.8','Ensure ''CREATE ANY LIBRARY'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database CREATE ANY LIBRARY privilege allows the designated user to create
objects that are associated to the shared libraries.
Rationale:
As assignment of the CREATE ANY LIBRARY privilege can allow the creation of numerous
library-associated objects and potentially corrupt the libraries'' integrity, this capability
should be restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE ANY LIBRARY''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''DBA'',''IMP_FULL_DATABASE'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_6001.htm#SQLRF01301
2. http://docs.oracle.com/cd/E18283_01/server.112/e17120/manproc007.htm','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE ANY LIBRARY''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''DBA'',''IMP_FULL_DATABASE'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE ANY LIBRARY''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'',''DBA'',''IMP_FULL_DATABASE'')','REVOKE CREATE ANY LIBRARY FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.9','Ensure ''CREATE LIBRARY'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database CREATE LIBRARY privilege allows the designated user to create objects
that are associated to the shared libraries.
Rationale:
As assignment of the CREATE LIBRARY privilege can allow the creation of numerous libraryassociated
objects and potentially corrupt the libraries'' integrity, this capability should be
restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE LIBRARY''
AND GRANTEE NOT IN
(''SYS'',''SYSTEM'',''DBA'',''SPATIAL_CSW_ADMIN_USR'',''XDB'',''EXFSYS'',''MDSYS'',''SPATIAL_WFS_ADMI
N_USR'');
Lack of results implies compliance.','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE LIBRARY''
AND GRANTEE NOT IN
(''SYS'',''SYSTEM'',''DBA'',''SPATIAL_CSW_ADMIN_USR'',''XDB'',''EXFSYS'',''MDSYS'',''SPATIAL_WFS_ADMI
N_USR'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''CREATE LIBRARY''
AND GRANTEE NOT IN
(''SYS'',''SYSTEM'',''DBA'',''SPATIAL_CSW_ADMIN_USR'',''XDB'',''EXFSYS'',''MDSYS'',''SPATIAL_WFS_ADMI
N_USR'')','REVOKE CREATE LIBRARY FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.10','Ensure ''GRANT ANY OBJECT PRIVILEGE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database GRANT ANY OBJECT PRIVILEGE keyword provides the grantee the
capability to grant access to any single or multiple combinations of objects to any grantee
in the catalog of the database.
Rationale:
As authorization to use the GRANT ANY OBJECT PRIVILEGE capability can allow an
unauthorized user to potentially access/change confidential data or damage the data
catalog due to potential complete instance access, this capability should be restricted
according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'');
Lack of results implies compliance.','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'')','REVOKE GRANT ANY OBJECT PRIVILEGE FROM <grantee>',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.11','Ensure ''GRANT ANY ROLE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database GRANT ANY ROLE keyword provides the grantee the capability to grant
any single role to any grantee in the catalog of the database.
Rationale:
As authorization to use the GRANT ANY ROLE capability can allow an unauthorized user to
potentially access/change confidential data or damage the data catalog due to potential
complete instance access, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',
''SPATIAL_WFS_ADMIN_USR'',''SPATIAL_CSW_ADMIN_USR'');
Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99903','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',
''SPATIAL_WFS_ADMIN_USR'',''SPATIAL_CSW_ADMIN_USR'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''DATAPUMP_IMP_FULL_DATABASE'',''IMP_FULL_DATABASE'',
''SPATIAL_WFS_ADMIN_USR'',''SPATIAL_CSW_ADMIN_USR'')','REVOKE GRANT ANY ROLE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.3.12','Ensure ''GRANT ANY PRIVILEGE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database GRANT ANY PRIVILEGE keyword provides the grantee the capability to
grant any single privilege to any item in the catalog of the database.
Rationale:
As authorization to use the GRANT ANY PRIVILEGE capability can allow an unauthorized
user to potentially access/change confidential data or damage the data catalog due to
potential complete instance access, this capability should be restricted according to the
needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'');

Lack of results implies compliance.
References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99876','SELECT count(*)
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE'')','SELECT ''Grantee : ''||GRANTEE||'', Privilege : ''||PRIVILEGE 
FROM DBA_SYS_PRIVS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND GRANTEE NOT IN (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''DATAPUMP_IMP_FULL_DATABASE''))','REVOKE GRANT ANY PRIVILEGE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.4.1','Ensure ''DELETE_CATALOG_ROLE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DELETE_CATALOG_ROLE provides DELETE privileges for the records in
the system''s audit table (AUD$).
Rationale:
As permitting unauthorized access to the DELETE_CATALOG_ROLE can allow the destruction
of audit records vital to the forensic investigation of unauthorized activities, this capability
should be restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''DELETE_CATALOG_ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99873
2. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG4414','SELECT count(*)
FROM DBA_ROLE_PRIVS
WHERE granted_role=''DELETE_CATALOG_ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''GRANTED_ROLE : ''||GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''DELETE_CATALOG_ROLE''
AND GRANTEE NOT IN (''DBA'',''SYS'')','REVOKE DELETE_CATALOG_ROLE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.4.2','Ensure ''SELECT_CATALOG_ROLE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SELECT_CATALOG_ROLE provides SELECT privileges on all data
dictionary views held in the SYS schema.
Rationale:
As permitting unauthorized access to the SELECT_CATALOG_ROLE can allow the disclosure of
all dictionary data, this capability should be restricted according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''SELECT_CATALOG_ROLE''
AND grantee not in
(''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'',''OEM_MONITOR'',''SYSMAN'');
Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99873
2. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG4414','SELECT count(*)
FROM DBA_ROLE_PRIVS
WHERE granted_role=''SELECT_CATALOG_ROLE''
AND grantee not in
(''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'',''OEM_MONITOR'',''SYSMAN'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''GRANTED_ROLE : ''||GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''SELECT_CATALOG_ROLE''
AND grantee not in
(''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'',''OEM_MONITOR'',''SYSMAN'')','REVOKE DELETE_CATALOG_ROLE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.4.3','4.4.3 Ensure ''EXECUTE_CATALOG_ROLE'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database EXECUTE_CATALOG_ROLE provides EXECUTE privileges for a number of
packages and procedures in the data dictionary in the SYS schema.
Rationale:
As permitting unauthorized access to the EXECUTE_CATALOG_ROLE can allow the disruption
of operations by initialization of rogue procedures, this capability should be restricted
according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''EXECUTE_CATALOG_ROLE''
AND grantee not in (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG99873
2. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG4414','SELECT count(*)
FROM DBA_ROLE_PRIVS
WHERE granted_role=''EXECUTE_CATALOG_ROLE''
AND grantee not in (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''GRANTED_ROLE : ''||GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE granted_role=''EXECUTE_CATALOG_ROLE''
AND grantee not in (''DBA'',''SYS'',''IMP_FULL_DATABASE'',''EXP_FULL_DATABASE'')','REVOKE EXECUTE_CATALOG_ROLE FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.4.4','Ensure ''DBA'' Is Revoked from Unauthorized ''GRANTEE''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database DBA role is the default database administrator role provided for the
allocation of administrative privileges.
Rationale:
As assignment of the DBA role to an ordinary user can provide a great number of
unnecessary privileges to that user and opens the door to data breaches, integrity
violations, and Denial-of-Service conditions, application of this role should be restricted
according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT GRANTEE, GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE GRANTED_ROLE=''DBA''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'');
Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/authorization.htm#DBSEG4414','SELECT count(*)
FROM DBA_ROLE_PRIVS
WHERE GRANTED_ROLE=''DBA''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''GRANTED_ROLE : ''||GRANTED_ROLE
FROM DBA_ROLE_PRIVS
WHERE GRANTED_ROLE=''DBA''
AND GRANTEE NOT IN (''SYS'',''SYSTEM'')','REVOKE DBA FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'4.5.1','Ensure ''ALL'' Is Revoked from Unauthorized ''GRANTEE'' on ''AUD$''','Profile Applicability:
? Level 1 - RDBMS
Description:
The Oracle database SYS.AUD$ table contains all the audit records for the database of the
non-Data Manipulation Language (DML) events, such as ALTER, DROP, CREATE, and so
forth. (DML changes need trigger-based audit events to record data alterations.)
Rationale:
As permitting non-privileged users the authorization to manipulate the SYS_AUD$ table can
allow distortion of the audit records, hiding unauthorized activities, this capability should
be restricted according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''AUD$''
AND GRANTEE NOT IN (''DELETE_CATALOG_ROLE'');

Lack of results implies compliance.

References:
1. http://docs.oracle.com/cd/E11882_01/network.112/e16543/auditing.htm#CEGDGIAF','SELECT count(*)
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''AUD$''
AND GRANTEE NOT IN (''DELETE_CATALOG_ROLE'')','SELECT ''Grantee : ''||GRANTEE||'' , ''||''PRIVILEGE : ''||PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE TABLE_NAME=''AUD$''
AND GRANTEE NOT IN (''DELETE_CATALOG_ROLE'')','REVOKE ALL ON AUD$ FROM <grantee>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.10','Enable ''PUBLIC DATABASE LINK'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The PUBLIC DATABASE LINK object allows for the creation of a public link for an
application-based "user" to access the database for connections/session creation.
Rationale:
As the logging of user activities involving the creation, alteration, or dropping of a PUBLIC
DATABASE LINK can provide forensic evidence about a pattern of unauthorized activities,
the audit capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT PUBLIC DATABASE LINK;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.11','Enable ''PUBLIC SYNONYM'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The PUBLIC SYNONYM object allows for the creation of an alternate description of an object
and public synonyms are accessible by all users that have the appropriate privileges to the
underlying object.
Rationale:
As the logging of user activities involving the creation or dropping of a PUBLIC SYNONYM can
provide forensic evidence about a pattern of unauthorized activities, the audit capability
should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PUBLIC SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT PUBLIC SYNONYM;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.12','Enable ''SYNONYM'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The SYNONYM operation allows for the creation of a an alternative name for a database
object such as a Java class schema object, materialized view, operator, package, procedure,
sequence, stored function, table, view, user-defined object type, even another synonym;
this synonym puts a dependency on its target and is rendered invalid if the target object is
changed/dropped.
Rationale:
As the logging of user activities involving the creation or dropping of a SYNONYM can
provide forensic evidence about a pattern of suspect/unauthorized activities, the audit
capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_4007.htm#SQLRF01107','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYNONYM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT SYNONYM;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.13','Enable ''GRANT DIRECTORY'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The DIRECTORY object allows for the creation of a directory object that specifies an alias for
a directory on the server file system, where the external binary file LOBs (BFILEs)/ table
data are located.
Rationale:
As the logging of user activities involving the creation or dropping of a DIRECTORY can
provide forensic evidence about a pattern of unauthorized activities, the audit capability
should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''GRANT DIRECTORY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''GRANT DIRECTORY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''GRANT DIRECTORY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT GRANT DIRECTORY;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.14','Enable ''SELECT ANY DICTIONARY'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The SELECT ANY DICTIONARY capability allows the user to view the definitions of all schema
objects in the database.
Rationale:
As the logging of user activities involving the capability to access the description of all
schema objects in the database can provide forensic evidence about a pattern of
unauthorized activities, the audit capability should be set according to the needs of the
organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SELECT ANY DICTIONARY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_4007.htm#SQLRF01107','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SELECT ANY DICTIONARY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SELECT ANY DICTIONARY''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT SELECT ANY DICTIONARY;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.15','Enable ''GRANT ANY OBJECT PRIVILEGE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
GRANT ANY OBJECT PRIVILEGE allows the user to grant or revoke any object privilege,
which includes privileges on tables, directories, mining models, etc. This audits all uses of
that privilege.
Rationale:
Logging of privilege grants that can lead to the creation, alteration, or deletion of critical
data, the modification of objects, object privilege propagation and other such activities can
be critical to forensic investigations.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT PRIVILEGE, SUCCESS, FAILURE
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

Impact:

The change to the check/audit insures that it is in effect for all users regardless of proxy or
success.
The change to the title more accurately reflects what it actually does.
The previous reference to being able to drop or modify "users and other critical system
components" is essentially wrong. There is no object privilege I know of that can be used
directly to drop or create a user. There may be some confusion due to documentation bugs
(see notes), but this allows one only to grant object privileges, not system privileges like
DROP ANY TABLE, DROP USER or ALTER PROFILE. (Of course, one could construct
scenarios where granting execute on something might enable one to do so.)','SELECT count(*)
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Privilege : ''||PRIVILEGE||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY OBJECT PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT GRANT ANY OBJECT PRIVILEGE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'1.1.1','Ensure Latest SQL Server Service Packs and Hotfixes are Installed','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
SQL Server patches contain program updates that fix security and product functionality
issues found in the software. These patches can be installed with a hotfix which is a single
patch, a cumulative update which is a small group of patches or a service pack which is a
large collection of patches. The SQL Server version and patch levels should be the most
recent compatible with the organizations'' operational needs.
Rationale:
Using the most recent SQL Server software, along with all applicable patches can help limit
the possibilities for vulnerabilities in the software, the installation version and/or patches
applied during setup should be established according to the needs of the organization.
Audit:
To determine your SQL Server service pack level, run the following code snippet.
SELECT SERVERPROPERTY(''ProductLevel'') as SP_installed,
SERVERPROPERTY(''ProductVersion'') as Version;
First column returns the installed Service Pack level, the second is the exact build number.

References:
1. https://support.microsoft.com/en-us/kb/2755533
2. support.microsoft.com/tr-tr/help/321185.','select count(*) from 
( SELECT SERVERPROPERTY(''ProductLevel'') as x ) mytable 
where x=''SP4''','SELECT CAST(SERVERPROPERTY(''ProductLevel'') AS varchar(10)) AS x','Remediation:
Identify the current version and patch level of your SQL Server instances and ensure they
contain the latest security fixes. Make sure to test these fixes in your test environments
before updating production instances.
10 | P a g e
The most recent SQL Server patches can be found here:
? Hotfixes and Cumulative updates: http://blogs.msdn.com/b/sqlreleaseservices/
? Service Packs: https://support.microsoft.com/en-us/kb/2755533',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'1.1.2','Ensure Latest SQL Server Service Packs and Hotfixes are Installed','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
SQL Server patches contain program updates that fix security and product functionality
issues found in the software. These patches can be installed with a hotfix which is a single
patch, a cumulative update which is a small group of patches or a service pack which is a
large collection of patches. The SQL Server version and patch levels should be the most
recent compatible with the organizations'' operational needs.
Rationale:
Using the most recent SQL Server software, along with all applicable patches can help limit
the possibilities for vulnerabilities in the software, the installation version and/or patches
applied during setup should be established according to the needs of the organization.
Audit:
To determine your SQL Server service pack level, run the following code snippet.
SELECT SERVERPROPERTY(''ProductLevel'') as SP_installed,
SERVERPROPERTY(''ProductVersion'') as Version;
First column returns the installed Service Pack level, the second is the exact build number.','select count(*) from 
( SELECT SERVERPROPERTY(''ProductVersion'') as x ) mytable 
where x=''11.0.6607.3''','Select cast (SERVERPROPERTY(''ProductVersion'') AS varchar(20))','Remediation:
Identify the current version and patch level of your SQL Server instances and ensure they
contain the latest security fixes. Make sure to test these fixes in your test environments
before updating production instances.
The most recent SQL Server patches can be found here:
? Hotfixes and Cumulative updates: http://blogs.msdn.com/b/sqlreleaseservices/
? Service Packs: https://support.microsoft.com/en-us/kb/2755533',1,'=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.1','Ensure ''Ad Hoc Distributed Queries'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
Enabling Ad Hoc Distributed Queries allows users to query data and execute statements on
external data sources. This functionality should be disabled.
Rationale:
This feature can be used to remotely access and exploit vulnerabilities on remote SQL
Server instances and to run unsafe Visual Basic for Application functions.
Audit:
Run the following T-SQL command:
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as
int) as value_in_use
FROM sys.configurations
WHERE name = ''Ad Hoc Distributed Queries'';
Both value columns must show 0.','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''Ad Hoc Distributed Queries''','SELECT name + '' Value : ''+ cast( value as varchar ) + '' Valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''Ad Hoc Distributed Queries''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''Ad Hoc Distributed Queries'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.2','Ensure ''CLR Enabled'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The clr enabled option specifies whether user assemblies can be run by SQL Server.
Rationale:
Enabling use of CLR assemblies widens the attack surface of SQL Server and puts it at risk
from both inadvertent and malicious assemblies.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''clr enabled'';
Both value columns must show 0.

Impact:
If CLR assemblies are in use, applications may need to be rearchitected to eliminate their
usage before disabling this setting. Alternatively, some organizations may allow this setting
to be enabled 1 for assemblies created with the SAFE permission set, but disallow
assemblies created with the riskier UNSAFE and EXTERNAL_ACCESS permission sets. To find
user-created assemblies, run the following query in all databases, replacing
<database_name> with each database name:

USE [<database_name>]

GO
SELECT name AS Assembly_Name, permission_set_desc
FROM sys.assemblies
WHERE is_user_defined = 1;
GO

Default Value:
By default, this option is disabled.
References:
1. https://docs.microsoft.com/en-us/sql/t-sql/statements/create-assembly-transactsql','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''clr enabled''','SELECT name + '' value : ''+ cast( value as varchar ) + '' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''clr enabled''','EXECUTE sp_configure ''clr enabled'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.6','Ensure ''Remote Access'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The remote access option controls the execution of local stored procedures on remote
servers or remote stored procedures on local server.
Rationale:
Functionality can be abused to launch a Denial-of-Service (DoS) attack on remote servers
by off-loading query processing to a target.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''remote access'';
Both value columns must show 0.

Default Value:
By default, this option is enabled (1).
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
configure-the-remote-access-server-configuration-option','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''remote access''','SELECT name + '' value : ''+cast( value as varchar ) + '' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''remote access''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''remote access'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.7','Ensure ''Remote Admin Connections'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The remote admin connections option controls whether a client application on a remote
computer can use the Dedicated Administrator Connection (DAC).
Rationale:
The Dedicated Administrator Connection (DAC) lets an administrator access a running
server to execute diagnostic functions or Transact-SQL statements, or to troubleshoot
problems on the server, even when the server is locked or running in an abnormal state
and not responding to a SQL Server Database Engine connection. In a cluster scenario, the
administrator may not actually be logged on to the same node that is currently hosting the
SQL Server instance and thus is considered "remote". Therefore, this setting should usually
be enabled (1) for SQL Server failover clusters; otherwise it should be disabled (0) which is
the default.
Audit:
Run the following T-SQL command:
USE master;
GO
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''remote admin connections''
AND SERVERPROPERTY(''IsClustered'') = 0;

If no data is returned, the instance is a cluster and this recommendation is not applicable. If
data is returned, then both the value columns must show 0 to be compliant.

Default Value:
By default, this option is disabled (0), only local connections may use the DAC.
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
remote-admin-connections-server-configuration-option

Notes:
If it''s a clustered installation, it must be enabled as a clustered SQL Server cannot bind to
localhost and DAC will be unavailable otherwise. Enable it for clustered installations.
Disable it for standalone installations where not required.','DECLARE @x int;

SELECT @x=isnull(CAST(value as int) + CAST(value_in_use as int),100)
FROM sys.configurations
WHERE name = ''remote admin connections''

IF @x = 100
       SELECT 0 ;
ELSE 
   SELECT CAST(value as int) + CAST(value_in_use as int) 
   FROM sys.configurations
   WHERE name = ''remote admin connections'';','SELECT name + '' value : ''+cast( value as varchar ) + '' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''remote admin connections''','EXECUTE sp_configure ''remote admin connections'', 0;
RECONFIGURE;
GO',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.11','Ensure SQL Server is configured to use non-standard ports','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
If enabled, the default SQL Server instance will be assigned a default port of TCP:1433 for
TCP/IP communication. Administrators can also configure named instances to use
TCP:1433 for communication. TCP:1433 is a widely known SQL Server port and this port
assignment should be changed.
Rationale:
Using a non-default port helps protect the database from attacks directed to the default
port.
Audit:
Run the following T-SQL script:
DECLARE @value nvarchar(256);
EXECUTE master.dbo.xp_instance_regread
N''HKEY_LOCAL_MACHINE'',
N''SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib\Tcp\IPAll'',
N''TcpPort'',
@value OUTPUT,
N''no_output'';
SELECT @value AS TCP_Port WHERE @value = ''1433'';
This should return no rows.

Impact:
Changing the default port will force the DAC (Dedicated Administrator Connection) to
listen on a random port. Also, it might make benign applications, such as application
firewalls, require special configuration. In general, you should set a static port for
consistent usage by applications, including firewalls, instead of using dynamic ports which
will be chosen randomly at each SQL Server start up.
Default Value:
By default, default SQL Server instances listen on to TCP/IP traffic on TCP port 1433 and
named instances use dynamic ports.
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
configure-a-server-to-listen-on-a-specific-tcp-port','DECLARE       @portNo2   NVARCHAR(10)

EXEC   xp_instance_regread
@rootkey    = ''HKEY_LOCAL_MACHINE'',
@key        = ''Software\Microsoft\Microsoft SQL Server\MSSQLServer\SuperSocketNetLib\Tcp\IpAll'',
@value_name = ''TcpDynamicPorts'',
@value      = @portNo2 OUTPUT

DECLARE       @portNo   NVARCHAR(10)

EXEC   xp_instance_regread
@rootkey    = ''HKEY_LOCAL_MACHINE'',
@key        = ''Software\Microsoft\Microsoft SQL Server\MSSQLServer\SuperSocketNetLib\Tcp\IpAll'',
@value_name = ''TcpPort'',
@value      = @portNo OUTPUT

SELECT  cast( isnull(@portno2,0) as int) + cast( isnull(@portno ,0) as int)','Select ''Default Port : 1433''','1. In SQL Server Configuration Manager, in the console pane, expand SQL Server
Network Configuration, expand Protocols for <InstanceName>, and then doubleclick
the TCP/IP or VIA protocol
2. In the TCP/IP Properties dialog box, on the IP Addresses tab, several IP addresses
appear in the format IP1, IP2, up to IPAll. One of these is for the IP address of the
loopback adapter, 127.0.0.1. Additional IP addresses appear for each IP Address on
the computer
3. Change the TCP Port field from 1433 to another non-standard port or leave the TCP
Port field empty and set the TCP Dynamic Ports value to 0 to enable dynamic port
assignment and then click OK.
4. In the console pane, click SQL Server Services.
5. In the details pane, right-click SQL Server (<InstanceName>) and then click
Restart, to stop and restart SQL Server.',1,'<>',1433,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.12','** Ensure ''Hide Instance'' option is set to ''Yes'' for Production SQL Server instances','Profile Applicability:
? Level 1 - Database Engine
Description:
Non-clustered SQL Server instances within production environments should be designated
as hidden to prevent advertisement by the SQL Server Browser service.
Rationale:
Designating production SQL Server instances as hidden leads to a more secure installation
because they cannot be enumerated. However, clustered instances may break if this option
is selected.
Audit:
Perform either the GUI or T-SQL method shown:
GUI Method
1. In SQL Server Configuration Manager, expand SQL Server Network
Configuration, right-click Protocols for <server instance>, and then select
Properties.
2. On the Flags tab, in the Hide Instance box, verify Yes is selected.
T-SQL Method
Execute the following T-SQL. A value of 1 should be returned.
DECLARE @getValue INT;
EXEC master.sys.xp_instance_regread
@rootkey = N''HKEY_LOCAL_MACHINE'',
@key = N''SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib'',
@value_name = N''HideInstance'',
@value = @getValue OUTPUT;
SELECT @getValue;

Impact:
This method only prevents the instance from being listed on the network. If the instance is
hidden (not exposed by SQL Browser), then connections will need to specify the server and
port in order to connect. It does not prevent users from connecting to server if they know
the instance name and port.
If you hide a clustered named instance, the cluster service may not be able to connect to the
SQL Server. Please refer to the Microsoft documentation reference.
Default Value:
By default, SQL Server instances are not hidden.
References:
1. http://msdn.microsoft.com/en-us/library/ms179327(v=sql.110).aspx','GUI Method
1. In SQL Server Configuration Manager, expand SQL Server Network
Configuration, right-click Protocols for <server instance>, and then select
Properties.
2. On the Flags tab, in the Hide Instance box, verify Yes is selected',null,'GUI Method
1. In SQL Server Configuration Manager, expand SQL Server Network
Configuration, right-click Protocols for <server instance>, and then select
Properties.
2. On the Flags tab, in the Hide Instance box, select Yes, and then click OK to close the
dialog box. The change takes effect immediately for new connections.
T-SQL Method
Execute the following T-SQL to remediate:
EXEC master.sys.xp_instance_regwrite
@rootkey = N''HKEY_LOCAL_MACHINE'',
@key = N''SOFTWARE\Microsoft\Microsoft SQL
Server\MSSQLServer\SuperSocketNetLib'',
@value_name = N''HideInstance'',
@type = N''REG_DWORD'',
@value = 1;',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.16','Enable ''GRANT ANY PRIVILEGE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
This audits all uses of the system privilege named GRANT ANY PRIVILEGE. Actions
by users not holding this privilege are not audited.
Rationale:
GRANT ANY PRIVILEGE allows a user to grant any system privilege, including the most
powerful privileges typically available only to administrators - to change the security
infrastructure, to drop/add/modify users and more. Auditing the use of this privilege is
part of a comprehensive auditing policy that can help in detecting issues and can be useful
in forensics.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT PRIVILEGE, SUCCESS, FAILURE
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_4007.htm#SQLRF01107','SELECT count(*)
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Privilege : ''||Privilege||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_PRIV_AUDIT_OPTS
WHERE PRIVILEGE=''GRANT ANY PRIVILEGE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT GRANT ANY OBJECT PRIVILEGE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.17','Enable ''DROP ANY PROCEDURE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The AUDIT DROP ANY PROCEDURE command is auditing the creation of procedures in other
schema.
Rationale:
Dropping procedures of another user could be part of a privilege escalation exploit
and should be audited.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP ANY PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP ANY PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP ANY PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT DROP ANY PROCEDURE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.18','5.18 Enable ''ALL'' Audit Option on ''SYS.AUD$''','Profile Applicability:
? Level 1 - RDBMS
Description:
The logging of attempts to alter the audit trail in the SYS.AUD$ table (open for
read/update/delete/view) will provide a record of any activities that may indicate
unauthorized attempts to access the audit trail.
Rationale:
As the logging of attempts to alter the SYS.AUD$ table can provide forensic evidence of the
initiation of a pattern of unauthorized activities, this logging capability should be set
according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT *
FROM DBA_OBJ_AUDIT_OPTS
WHERE OBJECT_NAME=''AUD$''
AND ALT=''A/A''
AND AUD=''A/A''
AND COM=''A/A''
AND DEL=''A/A''
AND GRA=''A/A''
AND IND=''A/A''
AND INS=''A/A''
AND LOC=''A/A''
AND REN=''A/A''
AND SEL=''A/A''
AND UPD=''A/A''
AND FBK=''A/A'';

Lack of results implies a finding.','SELECT  count(*)
FROM DBA_OBJ_AUDIT_OPTS
WHERE OBJECT_NAME=''AUD$''
AND ALT=''A/A''
AND AUD=''A/A''
AND COM=''A/A''
AND DEL=''A/A''
AND GRA=''A/A''
AND IND=''A/A''
AND INS=''A/A''
AND LOC=''A/A''
AND REN=''A/A''
AND SEL=''A/A''
AND UPD=''A/A''
AND FBK=''A/A''','SELECT '' Owner : ''||Owner||'' Object Name : ''||Object_name
FROM DBA_OBJ_AUDIT_OPTS
WHERE OBJECT_NAME=''AUD$''
AND ALT=''A/A''
AND AUD=''A/A''
AND COM=''A/A''
AND DEL=''A/A''
AND GRA=''A/A''
AND IND=''A/A''
AND INS=''A/A''
AND LOC=''A/A''
AND REN=''A/A''
AND SEL=''A/A''
AND UPD=''A/A''
AND FBK=''A/A''','AUDIT ALL ON SYS.AUD$ BY ACCESS;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.19','Enable ''PROCEDURE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
In this statement audit, "PROCEDURE" means any procedure, function, package or library.
Any attempt, successful or not, to create or drop any of these types of objects is audited,
regardless of privilege or lack thereof. Java schema objects (sources, classes, and resources)
are considered the same as procedures for purposes of auditing SQL statements.
Rationale:
Any unauthorized attempts to create or drop a procedure in another''s schema should cause
concern, whether successful or not. Changes to critical store code can dramatically change
the behavior of the application and produce serious security consequences, including
privilege escalation and introducing SQL injection vulnerabilities. Audit records of such
changes can be helpful in forensics.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROCEDURE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT PROCEDURE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.20','Enable ''ALTER SYSTEM'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
This will audit all attempts to ALTER SYSTEM, whether successful or not and regardless of
whether or not the ALTER SYSTEM privilege is held by the user attempting the action.
Rationale:
Alter system allows one to change instance settings, including security settings and
auditing options. Additionally, alter system can be used to run operating system commands
using undocumented Oracle functionality. Any unauthorized attempt to alter the system
should be cause for concern. Alterations outside of some specified maintenance window
may be of concern. In forensics, these audit records could be quite useful.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER SYSTEM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

Impact:
The change to the check/audit is to ensure that the audit is in effect for all users regardless
of proxy, whether successful or not.
The previous Description was wrong - it is not "auditing" that "allows to modify the
database settings".','SELECT  count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER SYSTEM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER SYSTEM''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT ALTER SYSTEM;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.21','Enable ''TRIGGER'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
A TRIGGER may be used to modify DML actions or invoke other (recursive) actions when
some types of user-initiated actions occur. This will audit any attempt, successful or not, to
create, drop, enable or disable any schema trigger in any schema regardless of privilege or
lack thereof. For enabling and disabling a trigger, it covers both alter trigger and alter table.
Rationale:
Triggers are often part of schema security, data validation and other critical constraints
upon actions and data. A trigger in another schema may be used to escalate privileges,
redirect operations, transform data and perform other sorts of perhaps undesired actions.
Any unauthorized attempt to create, drop or alter a trigger in another schema may be cause
for investigation.
Audit:
To assess this recommendation execute the following SQL statement.
SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''TRIGGER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

Impact:
The statement auditing option ''audit TRIGGER'' audits almost everything that the three
privilege audits "audit CREATE ANY TRIGGER", "audit ALTER ANY TRIGGER" and "audit
DROP ANY TRIGGER" audit, but also audits:
1. Statements to create, drop, enable or disable a trigger in the user''s own schema.
2. Attempts to create a trigger by a user without the CREATE TRIGGER system
privilege.
3. Attempts to create a trigger in another schema by users without the CREATE ANY
TRIGGER privilege.
4. Attempts to drop a trigger in another schema by users without the DROP ANY
TRIGGER privilege.
5. Attempts to disable or enable a trigger in another schema by users without the
ALTER ANY TRIGGER privilege.
The one thing is audited by any of the three privilege audits that is not audited by this is
"alter trigger ...compile" if the trigger is in another''s schema, which is audited by "audit
ALTER ANY TRIGGER"'', but only if the user attempting the alteration actually holds the
ALTER ANY TRIGGER system privilege. "Audit TRIGGER" only audits "alter table" or "alter
trigger" statements used to enable or disable triggers','SELECT Count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''TRIGGER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''TRIGGER''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT TRIGGER;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.22','Enable ''CREATE SESSION'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
Audit all attempts to connect to the database, whether successful or not. Also
audits session disconnects/logoffs. The commands to audit SESSION, CONNECT or CREATE
SESSION all accomplish exactly the same thing - they initiate statement auditing of the
connect statement used to create a database session.
Rationale:
Auditing attempts to connect to the database is basic and mandated by most security
initiatives. Any attempt to logon to a locked account, failed attempts to logon to default
accounts or an unusually high number of failed logon attempts of any sort, for any user, in a
particular time period may indicate an intrusion attempt. In forensics, the logon record
may be first in a chain of evidence and contains information found in no other type of audit
record for the session. Logon and logoff in the audit trail define the period and duration of
the session.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''CREATE SESSION''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''CREATE SESSION''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''CREATE SESSION''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT SESSION;',1,'>',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'1.2','1.2 Ensure Single-Function Member Servers are Used','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
It is recommended that SQL Server software be installed on a dedicated server. This
architectural consideration affords security flexibility in that the database server can be
placed on a separate subnet allowing access only from particular hosts and over particular
protocols. Degrees of availability are easier to achieve as well - over time, an enterprise can
move from a single database server to a failover to a cluster using load balancing or to
some combination thereof.
Rationale:
It is easier to manage (i.e. reduce) the attack surface of the server hosting SQL Server
software if the only surfaces to consider are the underlying operating system, SQL Server
itself, and any security/operational tooling that may additionally be installed. As noted in
the description, availability can be more easily addressed if the database is on a dedicated
server.
Audit:
Ensure that no other roles are enabled for the underlying operating system and that no
excess tooling is installed, per enterprise policy.',null,null,'Remediation:
Uninstall excess tooling and/or remove unnecessary roles from the underlying operating
system.
Impact:
It is difficult to see any reasonably adverse impact to making this architectural change,
once the costs of making the change have been paid. Custom applications may need to be
modified to accommodate database connections over the wire rather than on the host (i.e.
using TCP/IP instead of Named Pipes). Additional hardware and operating system licenses
may be required to make these architectural changes.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.3','Ensure ''Cross DB Ownership Chaining'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The cross db ownership chaining option controls cross-database ownership chaining
across all databases at the instance (or server) level.
Rationale:
When enabled, this option allows a member of the db_owner role in a database to gain
access to objects owned by a login in any other database, causing an unnecessary
information disclosure. When required, cross-database ownership chaining should only be
enabled for the specific databases requiring it instead of at the instance level for all
databases by using the ALTER DATABASE <database_name> SET DB_CHAINING ON
command. This database option may not be changed on the master, model, or tempdb
system databases.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''cross db ownership chaining'';
Both value columns must show 0 to be compliant.

Default Value:
By default, this option is disabled (0).
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/crossdb-
ownership-chaining-server-configuration-option','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''cross db ownership chaining''','SELECT name + '' value : ''+cast( value as varchar ) + '' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''cross db ownership chaining''','EXECUTE sp_configure ''cross db ownership chaining'', 0;
RECONFIGURE;
GO',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.4','Ensure ''Database Mail XPs'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The Database Mail XPs option controls the ability to generate and transmit email
messages from SQL Server.
Rationale:
Disabling the Database Mail XPs option reduces the SQL Server surface, eliminates a DOS
attack vector and channel to exfiltrate data from the database server to a remote host.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''Database Mail XPs'';
Both value columns must show 0 to be compliant.

Default Value:
By default, this option is disabled (0).

References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/databasemail/database-mail','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''Database Mail XPs''','SELECT name + '' value : ''+cast( value as varchar ) + 
'' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''Database Mail XPs''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''Database Mail XPs'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.5','Ensure ''Ole Automation Procedures'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The Ole Automation Procedures option controls whether OLE Automation objects can be
instantiated within Transact-SQL batches. These are extended stored procedures that allow
SQL Server users to execute functions external to SQL Server.
Rationale:
Enabling this option will increase the attack surface of SQL Server and allow users to
execute functions in the security context of SQL Server.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''Ole Automation Procedures'';
Both value columns must show 0 to be compliant.

Default Value:
By default, this option is disabled (0).

References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/oleautomation-
procedures-server-configuration-option','SELECT CAST(value as int) + CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''Ole Automation Procedures''','SELECT name + '' value : ''+cast( value as varchar ) + '' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''Ole Automation Procedures''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''Ole Automation Procedures'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.5','Enable ''SYSTEM GRANT'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
This will audit any attempt, successful or not, to grant or revoke any system privilege or
role - regardless of privilege held by the user attempting the operation.
Rationale:
Logging of all grant and revokes (roles and system privileges) can provide forensic
evidence about a pattern of suspect/unauthorized activities. Any unauthorized attempt
may be cause for further investigation.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYSTEM GRANT''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYSTEM GRANT''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''SYSTEM GRANT''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT SYSTEM GRANT;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.6','Enable ''PROFILE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The PROFILE object allows for the creation of a set of database resource limits that can be
assigned to a user, so that that user cannot exceed those resource limitations. This will
audit all attempts, successful or not, to create, drop or alter any profile.
Rationale:
As profiles are part of the database security infrastructure, auditing the modification of
profiles is recommended.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.
Impact:
The statement auditing option ''audit PROFILE'' audits everything that the three privilege
audits ''audit CREATE PROFILE'', ''audit DROP PROFILE'' and ''audit ALTER PROFILE'' do, but
also audits:
1) Attempts to create a profile by a user without the CREATE PROFILE system privilege.
2) Attempts to drop a profile by a user without the DROP PROFILE system privilege
3) Attempts to alter a profile by a user without the ALTER PROFILE system privilege.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT PROFILE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.7','Enable ''ALTER PROFILE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The PROFILE object allows for the creation of a set of database resource limits that can be
assigned to a user, so that that user cannot exceed those resource limitations.
Rationale:
As the logging of user activities involving the creation, alteration, or dropping of a PROFILE
can provide forensic evidence about a pattern of unauthorized activities, the audit
capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''ALTER PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT ALTER PROFILE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.8','Enable ''DROP PROFILE'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
The PROFILE object allows for the creation of a set of database resource limits that can be
assigned to a user, so that that user cannot exceed those resource limitations.
Rationale:
As the logging of user activities involving the creation, alteration, or dropping of a PROFILE
can provide forensic evidence about a pattern of unauthorized activities, the audit
capability should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''


Lack of results implies a finding.','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DROP PROFILE''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT DROP PROFILE;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (1,'5.9','Enable ''DATABASE LINK'' Audit Option','Profile Applicability:
? Level 1 - RDBMS
Description:
All activities on database links should be audited.
Rationale:
As the logging of user activities involving the creation or dropping of a DATABASE LINK can
provide forensic evidence about a pattern of unauthorized activities, the audit capability
should be set according to the needs of the organization.
Audit:
To assess this recommendation execute the following SQL statement.

SELECT AUDIT_OPTION, SUCCESS, FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS'';

Lack of results implies a finding.

References:
1. http://docs.oracle.com/cd/E11882_01/server.112/e26088/statements_4007.htm#SQLRF01107','SELECT count(*)
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','SELECT ''Audit Option : ''||AUDIT_OPTION||'' , Success : ''||SUCCESS||'' , Failure : ''||FAILURE
FROM DBA_STMT_AUDIT_OPTS
WHERE AUDIT_OPTION=''DATABASE LINK''
AND USER_NAME IS NULL
AND PROXY_NAME IS NULL
AND SUCCESS = ''BY ACCESS''
AND FAILURE = ''BY ACCESS''','AUDIT DATABASE LINK;',1,'>=',1,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.8','Ensure ''Scan For Startup Procs'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The scan for startup procs option, if enabled, causes SQL Server to scan for and
automatically run all stored procedures that are set to execute upon service startup.
Rationale:
Enforcing this control reduces the threat of an entity leveraging these facilities for
malicious purposes.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''scan for startup procs'';

Both value columns must show 0.

Impact:
Setting Scan for Startup Procedures to 0 will prevent certain audit traces and other
commonly used monitoring SPs from re-starting on start up. Additionally, replication
requires this setting to be enabled (1) and will automatically change this setting if needed.
Default Value:
By default, this option is disabled (0).
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
configure-the-scan-for-startup-procs-server-configuration-option','SELECT CAST(value as int) +
       CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''scan for startup procs''','SELECT name + '' value : ''+cast( value as varchar ) +
'' value in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''scan for startup procs''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''scan for startup procs'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;
Restart the Database Engine.',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.9','Ensure ''Trustworthy'' Database Property is set to ''Off''','Profile Applicability:
? Level 1 - Database Engine
Description:
The TRUSTWORTHY database option allows database objects to access objects in other
databases under certain circumstances.
Rationale:
Provides protection from malicious CLR assemblies or extended procedures.
Audit:
Run the following T-SQL query to list any databases with a Trustworthy database property
value of ON:
SELECT name
FROM sys.databases
WHERE is_trustworthy_on = 1
AND name != ''msdb'';
No rows should be returned.

By default, this database property is OFF (is_trustworthy_on = 0), except for the msdb
database in which it is required to be ON.
References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/security/trustworthydatabase-
property
2. https://support.microsoft.com/it-it/help/2183687/guidelines-for-using-thetrustworthy-
database-setting-in-sql-server','SELECT count(name)
FROM sys.databases
WHERE is_trustworthy_on = 1
AND name != ''msdb'';','SELECT name
FROM sys.databases
WHERE is_trustworthy_on = 1
AND name != ''msdb'';','ALTER DATABASE [<database_name>] SET TRUSTWORTHY OFF;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.10','Ensure Unnecessary SQL Server Protocols are set to ''Disabled''','Profile Applicability:
? Level 1 - Database Engine
Description:
SQL Server supports Shared Memory, Named Pipes, TCP/IP and VIA protocols. However,
SQL Server should be configured to use the bare minimum required based on the
organization''s needs.
Rationale:
Using fewer protocols minimizes the attack surface of SQL Server and, in some cases, can
protect it from remote attacks.
Audit:
Open SQL Server Configuration Manager; go to the SQL Server Network Configuration.
Ensure that only required protocols are enabled.

Impact:
The Database Engine must be stopped and restarted for the change to take effect.
Default Value:
By default, TCP/IP and Shared Memory protocols are enabled on all commercial editions.
References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
enable-or-disable-a-server-network-protocol','Open SQL Server Configuration Manager; go to the SQL Server Network Configuration.
Ensure that only required protocols are enabled.',null,'Open SQL Server Configuration Manager; go to the SQL Server Network Configuration.
Ensure that only required protocols are enabled. Disable protocols not necessary.',2,null,null,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.13','Ensure ''sa'' Login Account is set to ''Disabled''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The sa account is a widely known and often widely used SQL Server account with sysadmin
privileges. This is the original login created during installation and always has the
principal_id=1 and sid=0x01.
Rationale:
Enforcing this control reduces the probability of an attacker executing brute force attacks
against a well-known principal.
Audit:
Use the following syntax to determine if the sa account is disabled. Checking for sid=0x01
ensures that the original sa account is being checked in case it has been renamed per best
practices.
SELECT name, is_disabled
FROM sys.server_principals
WHERE sid = 0x01
AND is_disabled = 0;
No rows should be returned to be compliant.
An is_disabled value of 0 indicates the login is currently enabled and therefore needs
remediation.

Impact:
It is not a good security practice to code applications or scripts to use the sa account.
However, if this has been done, disabling the sa account will prevent scripts and
applications from authenticating to the database server and executing required tasks or
functions.
Default Value:
By default, the sa login account is disabled at install time when Windows Authentication
Mode is selected. If mixed mode (SQL Server and Windows Authentication) is selected at
install, the default for the sa login is enabled.
References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/system-catalogviews/
sys-server-principals-transact-sql
2. https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-login-transact-sql
3. https://docs.microsoft.com/en-us/sql/relational-databases/security/choose-anauthentication-
mode','SELECT  count(*)
FROM sys.server_principals
WHERE sid = 0x01
AND is_disabled = 0','SELECT ''sa user name : ''+ name+'' is disabled : '' +  cast( is_disabled as char)
FROM sys.server_principals
WHERE sid = 0x01
AND is_disabled = 0','USE [master]
GO
DECLARE @tsql nvarchar(max)
SET @tsql = ''ALTER LOGIN '' + SUSER_NAME(0x01) + '' DISABLE''
EXEC (@tsql)
GO',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.14','Ensure ''sa'' Login Account has been renamed','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The sa account is a widely known and often widely used SQL Server login with sysadmin
privileges. The sa login is the original login created during installation and always has
principal_id=1 and sid=0x01.
Rationale:
It is more difficult to launch password-guessing and brute-force attacks against the sa login
if the name is not known.
Audit:
Use the following syntax to determine if the sa account is renamed.
SELECT name
FROM sys.server_principals
WHERE sid = 0x01;
A name of sa indicates the account has not been renamed.

Impact:
It is not a good security practice to code applications or scripts to use the sa account.
However, if this has been done renaming the sa account will prevent scripts and
applications for authenticating to the database server and executing required tasks or
functions.
Default Value:
By default, the sa login name is ''sa''.

References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/security/choose-anauthentication-
mode
Notes:
In the case of AWS RDS the default name for this account is rdsa instead of sa.','SELECT count(*)
FROM sys.server_principals
WHERE sid = 0x01 and name=''sa''','SELECT name
FROM sys.server_principals
WHERE sid = 0x01;','ALTER LOGIN sa WITH NAME = <different_user>;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.15','Ensure ''xp_cmdshell'' Server Configuration Option is set to ''0''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The xp_cmdshell option controls whether the xp_cmdshell extended stored procedure can
be used by an authenticated SQL Server user to execute operating-system command shell
commands and return results as rows within the SQL client.
Rationale:
The xp_cmdshell procedure is commonly used by attackers to read or write data to/from
the underlying Operating System of a database server.
Audit:
Run the following T-SQL command:
SELECT name,
CAST(value as int) as value_configured,
CAST(value_in_use as int) as value_in_use
FROM sys.configurations
WHERE name = ''xp_cmdshell'';
Both value columns must show 0 to be compliant.

Default Value:
By default, this option is disabled (0).

References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/system-storedprocedures/
xp-cmdshell-transact-sql
2. https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/xpcmdshell-
server-configuration-option','SELECT CAST(value as int) +
       CAST(value_in_use as int)
FROM sys.configurations
WHERE name = ''xp_cmdshell''','SELECT name + '' value : ''+cast( value as varchar ) +
'' valuen in Use : ''+cast( value_in_use  as varchar)
FROM sys.configurations
WHERE name = ''xp_cmdshell''','EXECUTE sp_configure ''show advanced options'', 1;
RECONFIGURE;
EXECUTE sp_configure ''xp_cmdshell'', 0;
RECONFIGURE;
GO
EXECUTE sp_configure ''show advanced options'', 0;
RECONFIGURE;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.16','Ensure ''AUTO_CLOSE'' is set to ''OFF'' on contained databases','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
AUTO_CLOSE determines if a given database is closed or not after a connection terminates. If
enabled, subsequent connections to the given database will require the database to be
reopened and relevant procedure caches to be rebuilt.
Rationale:
Because authentication of users for contained databases occurs within the database not at
the server\instance level, the database must be opened every time to authenticate a user.
The frequent opening/closing of the database consumes additional server resources and
may contribute to a denial of service.
Audit:
Perform the following to find contained databases that are not configured as prescribed:
SELECT name, containment, containment_desc, is_auto_close_on
FROM sys.databases
WHERE containment <> 0 and is_auto_close_on = 1;
No rows should be returned.

Default Value:
By default, the database property AUTO_CLOSE is OFF which is equivalent to
is_auto_close_on = 0.

References:
1. https://docs.microsoft.com/en-us/sql/relational-databases/databases/securitybest-
practices-with-contained-databases','SELECT count(*)
FROM sys.databases
WHERE containment <> 0 and is_auto_close_on = 1','SELECT ''Database Name :''+ name + ''Containment : ''+ containment
FROM sys.databases
WHERE containment <> 0 and is_auto_close_on = 1','ALTER DATABASE <database_name> SET AUTO_CLOSE OFF;',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'2.17','Ensure no login exists with the name ''sa''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
The sa login (e.g. principal) is a widely known and often widely used SQL Server account.
Therefore, there should not be a login called sa even when the original sa login
(principal_id = 1) has been renamed.
Rationale:
Enforcing this control reduces the probability of an attacker executing brute force attacks
against a well-known principal name.
Audit:
Use the following syntax to determine if there is an account named sa.
SELECT principal_id, name
FROM sys.server_principals
WHERE name = ''sa'';
No rows should be returned.

Impact:
It is not a good security practice to code applications or scripts to use the sa account. Given
that it is a best practice to rename and disable the sa account, some 3rd party applications
check for the existence of a login named sa and if it doesn''t exist, creates one. Removing the
sa login will prevent these scripts and applications from authenticating to the database
server and executing required tasks or functions.
Default Value:
The login with a principal_id = 1 is named sa by default.','SELECT count(*)
FROM sys.server_principals
WHERE name = ''sa''','SELECT name
FROM sys.server_principals
WHERE name = ''sa''','USE [master]
GO
-- If principal_id = 1 or the login owns database objects, rename the sa
login
ALTER LOGIN [sa] WITH NAME = <different_name>;
GO
-- If the login owns no database objects, then drop it
-- Do NOT drop the login if it is principal_id = 1
DROP LOGIN sa',1,'=',0,null);
Insert into CIS.CIS_CONTROLS (BENCHMARK_NO,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_COMMAND_TYPE,CONTROL_COND_TYPE,CONTROL_COND_RESULT,CONTROL_SEVERITY) values (741,'3.1','Ensure ''Server Authentication'' Property is set to ''Windows Authentication Mode''','Profile Applicability:
? Level 1 - Database Engine
? Level 1 - AWS RDS
Description:
Uses Windows Authentication to validate attempted connections.
Rationale:
Windows provides a more robust authentication mechanism than SQL Server
authentication.
Audit:
Execute the following syntax:
SELECT SERVERPROPERTY(''IsIntegratedSecurityOnly'') as [login_mode];
A login_mode of 1 indicates the Server Authentication property is set to Windows
Authentication Mode. A login_mode of 0 indicates mixed mode authentication.
Remediation:
Perform either the GUI or T-SQL method shown:
GUI Method
1. Open SQL Server Management Studio.
2. Open the Object Explorer tab and connect to the target database instance.
3. Right click the instance name and select Properties.
4. Select the Security page from the left menu.
5. Set the Server authentication setting to Windows Authentication Mode



References:
1. https://docs.microsoft.com/en-us/sql/database-engine/configurewindows/
server-properties-security-page','select count(*) from 
( SELECT cast( SERVERPROPERTY(''IsIntegratedSecurityOnly'') as varchar)  as x ) mytable 
where x=''1''','SELECT cast( SERVERPROPERTY(''IsIntegratedSecurityOnly'') as varchar)','T-SQL Method
Run the following T-SQL in a Query Window:
USE [master]
GO
EXEC xp_instance_regwrite N''HKEY_LOCAL_MACHINE'',
N''Software\Microsoft\MSSQLServer\MSSQLServer'', N''LoginMode'', REG_DWORD, 1
GO
Restart the SQL Server service for the change to take effect.
Default Value:
Windows Authentication Mode',1,'=',1,null);
