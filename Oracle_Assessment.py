# -*- coding: utf-8 -*-
"""
Created on Sun Dec  1 17:01:18 2019

@author: Anil
"""


import configparser
import cx_Oracle
import getpass
from tabulate import tabulate
import datetime
import sys
import pyodbc

"""

Make Connection to Repository 

"""

config = configparser.ConfigParser()
config.read_file(open(r'config.txt'))
rep_username = config.get('Repository', 'username')
rep_password = config.get('Repository', 'password')
rep_ConnectString = config.get('Repository', 'ConnectString')


log_file= open("Assessment-Error-01.log", "a")



try:
    rep_con=cx_Oracle.connect(rep_username,rep_password,rep_ConnectString) 
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+str(datetime.datetime.now()) +' >> Repository DB Database Connection Error '+ str(e.args[0]))
    log_file.close()
    quit()


"""

Getting Target DB No and its data

"""

Target_DB_No=sys.argv[1]
try:
    cur = rep_con.cursor()
    query = """Select conn_username,conn_host,conn_port,conn_dbname,conn_password , conn_type from cis_connections where conn_no={}""".format(Target_DB_No)
    cur.execute(query)
    result=cur.fetchall()
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+str(datetime.datetime.now()) +' >> Error getting connection data ' + str(e.args[0]))
    log_file.close()
    quit()
if len(result) == 0 :
    log_file.write('\n'+str(datetime.datetime.now()) +' >> Connection Repository Data not found' )
    log_file.close()
    
conn_type=result[0][5]
target_username=result[0][0]
target_conn_info=result[0][1]+':'+str(result[0][2])+'/'+result[0][3]

cur.close()

"""

Getting password for Target DB and make connection

"""

target_pswd = result[0][4]

# Connect to ORACLE Database

if conn_type == 1 :

    try:
        target_con=cx_Oracle.connect(target_username,target_pswd,target_conn_info) 
    except cx_Oracle.DatabaseError as e:
        log_file.write('\n'+str(datetime.datetime.now()) +' >> Target DB Database Connection Error '+ str(e.args[0]))
        log_file.close()
        quit()
  
# Connect to SQL Server
        
if conn_type == 2 :
    
    try:
        target_conn_info = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER='+result[0][1]+';DATABASE='+result[0][3]+';UID='+result[0][0]+';PWD='+ result[0][4]+';PORT='+str(result[0][2])
        target_con = pyodbc.connect(target_conn_info)
    except: 
        log_file.write('\n'+str(datetime.datetime.now()) + ' >> target info :' + target_conn_info+ ' >> Target DB Database Connection Error '+  str(sys.exc_info()[0]) )
        log_file.close()
        quit()    

"""

Getting Benchmark No and Create Assessment

"""

Benchmark_No=sys.argv[2]
try:
    cur = rep_con.cursor()
    query = """Select Benchmark_name from cis_benchmarks where benchmark_no={}""".format(Benchmark_No)
    cur.execute(query)
    result=cur.fetchall()
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+str(datetime.datetime.now()) +' >> Error getting Benchmark Data ' + str(e.args[0]))
    log_file.close()
    quit()
if len(result) == 0 :
    log_file.write('\n'+str(datetime.datetime.now()) +' >> Benchmark Data not found' )
    log_file.close()
    quit()

cur.close()

""" Create Assessment no """
try:
    cur = rep_con.cursor()
    query = """Select assessment_seq.nextval from dual""".format(Benchmark_No)
    cur.execute(query)
    cur.close()
    cur = rep_con.cursor()
    query = """Select assessment_seq.currval from dual""".format(Benchmark_No)
    cur.execute(query)
    ass_no=cur.fetchall()[0][0]        
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error creating Assessment No ' + str(e.args[0]))
    log_file.close()
    quit()


cur.close()

""" Insert CIS ASSESSMENTS """
try:
    cur = rep_con.cursor()
    dml="""Begin
           Insert into cis_assessments (conn_no,benchmark_no,ass_no,ass_date,ass_score,ass_desc) values ({},{},{},sysdate,NULL,NULL);
           commit;
           end;""".format(Target_DB_No,Benchmark_No,ass_no);
    cur.execute(dml)
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error creating Assessment Record ' + str(e.args[0]))
    log_file.close()
    quit()
cur.close()    

    


# Open cursor for controls

try:
    control_cur=rep_con.cursor()
    control_query="""select control_no, control_audit_sql, control_cond_type,control_cond_result, control_detail_sql, control_remediation_sql, CONTROL_NAME, CONTROL_NOTES, CONTROL_SEVERITY from cis_controls where benchmark_no={} AND control_command_type=1 order by control_no """.format(Benchmark_No)
    control_cur.execute(control_query)
    control_list=control_cur.fetchall()
except cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error reading cis_controls ' + str(e.args[0]))
    log_file.close()
    quit()

exec_cursor=target_con.cursor()

"""
    Auditing start here
    
"""
#   control_result 3: Unmade , 2: Error , 1: Success , 0: Fail    
fail_count=0
pass_count=0
control_result=0



for control_sql in control_list:
    try:
        control_condition=control_sql[2]
        exec_cursor.execute(control_sql[1])
        audit_result=exec_cursor.fetchall()[0][0]
    except cx_Oracle.DatabaseError as e:
        log_file.write('\n'+ str(datetime.datetime.now()) +' Audit SQL Run Control no : '+control_sql[0]+' >> Error executing cis_controls ' + str(e.args[0]))
        control_result=2
        control_condition='ERROR'
    except:
        log_file.write('\n'+ str(datetime.datetime.now()) +' Audit SQL Run Control no : '+control_sql[0]+' >> Unexpected error: at ' + str(sys.exc_info()[0])  ) 
        control_condition='ERROR'
        control_result=2
    
    

   
# Check the Control
 
     
    if control_condition == '=':
        if audit_result == control_sql[3]:
            control_result=1
            pass_count=pass_count+1
        else:
            control_result=0
            fail_count=fail_count+1
            
            
    if control_condition == '<>':
        if audit_result != control_sql[3]:
            control_result=1
            pass_count=pass_count+1
        else:
            control_result=0
            fail_count=fail_count+1

    if control_condition == '>':
        if audit_result > control_sql[3]:
            control_result = 1
            pass_count=pass_count+1
        else:
            control_result= 0
            fail_count=fail_count+1
            
    if control_condition == '>=':
        if audit_result >= control_sql[3]:
            control_result = 1
            pass_count=pass_count+1
        else:
            control_result= 0
            fail_count=fail_count+1

    if control_condition == '<':
        if audit_result < control_sql[3]:
            control_result = 1
            pass_count=pass_count+1
        else:
            control_result= 0
            fail_count=fail_count+1
            
    if control_condition == '<=':
        if audit_result <= control_sql[3]:
            control_result = 1
            pass_count=pass_count+1
        else:
            control_result= 0
            fail_count=fail_count+1
            
    
    if control_result == 0 and  control_condition != 'ERROR' :
        try:
            exec_cursor.execute(control_sql[4])
            detail_result=exec_cursor.fetchall()
            header=['Objects Caused to FAIL']
            detail_result=tabulate(detail_result,header,tablefmt="grid")
        except cx_Oracle.DatabaseError as e:
                log_file.write('\n'+ str(datetime.datetime.now()) +' Detail SQL Run Control No : '+ control_sql[0]+' >> Error executing detail sql ' + str(e.args[0]))
                detail_result='Error executing detail sql ' + str(e.args[0])
        except:
            log_file.write('\n'+ str(datetime.datetime.now()) +' Detail SQL Run Control no : '+control_sql[0]+' >> Unexpected error: at ' + str(sys.exc_info()[0])  ) 
            detail_result='Error executing detail sql ' + str(sys.exc_info()[0]) 

# insert into CIS_ASS_EXEC in a loop
#       INSERT here

    try:
        cur = rep_con.cursor()
        dml="Insert into cis_ass_exec(  ASS_NO,\
                                        EXEC_CONTROL_NO,\
                                        EXEC_CONTROL_NAME,\
                                        EXEC_CONTROL_NOTES,\
                                        EXEC_CONTROL_AUDIT_SQL, \
                                        EXEC_CONTROL_DETAIL_SQL,\
                                        EXEC_CONTROL_REMEDIATION_SQL,\
                                        EXEC_CONTROL_COND_TYPE, \
		                                EXEC_CONTROL_COND_RESULT,\
                                        EXEC_DETAIL_SQL_RESULT,\
                                        EXEC_RESULT, \
                                        EXEC_SEVERITY) \
									  values (:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12)" 
        if control_result == 0:
            row=(ass_no,control_sql[0],control_sql[6],control_sql[7],control_sql[1],control_sql[4],control_sql[5],control_sql[2],control_sql[3],detail_result,control_result,control_sql[8])
        if (control_result == 1) or (control_result == 2):
            row=(ass_no,control_sql[0],control_sql[6],control_sql[7],control_sql[1],control_sql[4],control_sql[5],control_sql[2],control_sql[3],'',control_result,control_sql[8])
        
        cur.execute(dml,row)
        cur.execute('commit')
    except cx_Oracle.DatabaseError as e:
        log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error creating Assessment Exec Record ' + str(e.args[0]))
        log_file.close()
        quit()
    cur.close()




# Update Assessments_scores 
# Find unmade record numbers

dml="select count(*) from cis_controls where   benchmark_no=:1  and control_command_type=2 "
row=[int(Benchmark_No)]
try:
    cur = rep_con.cursor()
    cur.execute(dml,row)
    sql_return=cur.fetchall()
    not_made_count=sql_return[0][0]
except  cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error to find unmade record count' + str(e.args[0])) 
    log_file.close()
    quit()
cur.close()

    
ass_score=int(pass_count/(fail_count+pass_count)*100)
dml=" update cis_assessments set pass_count=:1 , fail_count=:2 ,ass_score=:3 , not_made_count=:4 where ass_no=:5 "
row=[pass_count,fail_count,ass_score, not_made_count,ass_no]
try:
    cur = rep_con.cursor()
    cur.execute(dml,row)
    cur.execute('commit')
except  cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' >> Error Update cis_assessments for not made records' + str(e.args[0]))
    log_file.close()
    quit()
cur.close()

# Update for Manual Control 

dml="insert into cis_ass_exec (ASS_NO,EXEC_CONTROL_NO,EXEC_CONTROL_NAME,EXEC_CONTROL_NOTES,EXEC_CONTROL_AUDIT_SQL,EXEC_CONTROL_DETAIL_SQL,EXEC_CONTROL_REMEDIATION_SQL,EXEC_SEVERITY,EXEC_RESULT )\
    select :1,CONTROL_NO,CONTROL_NAME,CONTROL_NOTES,CONTROL_AUDIT_SQL,CONTROL_DETAIL_SQL,CONTROL_REMEDIATION_SQL,CONTROL_SEVERITY,3 from cis_controls where   benchmark_no=:2 and control_command_type=2"
row=[ass_no,int(Benchmark_No)]    
try:
    cur = rep_con.cursor()
    cur.execute(dml,row)
    cur.execute('commit')
except  cx_Oracle.DatabaseError as e:
    log_file.write('\n'+ str(datetime.datetime.now()) +' Error During Insert of Manual Commands' + str(e.args[0])) 
    log_file.close()
    quit()
cur.close()
 
# after the loop calculate score of the assessment and update score column

"""
End of Programs 
Close Repository and Target Connection
"""
log_file.close()
rep_con.close()
target_con.close()
