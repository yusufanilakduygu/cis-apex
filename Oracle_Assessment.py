# -*- coding: utf-8 -*-
"""
Created on Sun Dec  1 17:01:18 2019

@author: Anil
"""

import cx_Oracle
import getpass
from tabulate import tabulate


"""

Make Connection to Repository 

"""

print('\n')
print('Welcome to Oracle Database Assessment tools-')
print('ver 1.0 - The Last Build Date: 01/11/2019 17:01')
print('\n')
print('Trying to connect Repository DB....')
try:
    rep_con=cx_Oracle.connect('cis','adana147','192.168.56.110:1521/db1.localdomain') 
except cx_Oracle.DatabaseError as e:
    print('Repository DB Database Connection Error '+ str(e.args[0]))
    quit()
print('Successfully connected to  Repository DB')

"""

Getting Target DB No and its data

"""

Target_DB_No=input("Enter Target Connection number : ")
try:
    cur = rep_con.cursor()
    query = """Select conn_username,conn_host,conn_port,conn_dbname from cis_connections where conn_type=1 and conn_no={}""".format(Target_DB_No)
    cur.execute(query)
    result=cur.fetchall()
except cx_Oracle.DatabaseError as e:
    print('Error getting connection data ' + str(e.args[0]))
    quit()
if len(result) == 0 :
    print('Connection Repository Data not found' )
    quit()
target_username=result[0][0]
target_conn_info=result[0][1]+':'+str(result[0][2])+'/'+result[0][3]
print (target_username,target_conn_info)
cur.close()

"""

Getting password for Target DB and make connection

"""

target_pswd = getpass.getpass('Password for Target DB: ')
print('Trying to connect Target  DB....')
try:
    target_con=cx_Oracle.connect(target_username,target_pswd,target_conn_info) 
except cx_Oracle.DatabaseError as e:
    print('Target DB Database Connection Error '+ str(e.args[0]))
    quit()
print('Successfully connected to Target DB')

"""

Getting Benchmark No and Create Assessment

"""

Benchmark_No=input("Enter Benchmark Number : ")
try:
    cur = rep_con.cursor()
    query = """Select Benchmark_name from cis_benchmarks where benchmark_no={}""".format(Benchmark_No)
    cur.execute(query)
    result=cur.fetchall()
except cx_Oracle.DatabaseError as e:
    print('Error getting Benchmark Data ' + str(e.args[0]))
    quit()
if len(result) == 0 :
    print('benchmark Data not found' )
    quit()
print('The Chosen Benchmark Name : '+ result[0][0])
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
    print('Error creating Assessment No ' + str(e.args[0]))
    quit()

print('New Created Assessment No : ', ass_no)
cur.close()

""" Insert CIS ASSESSMENTS """
try:
    cur = rep_con.cursor()
    dml="""Begin
           Insert into cis_assessments values ({},{},{},sysdate,NULL,NULL);
           commit;
           end;""".format(Target_DB_No,Benchmark_No,ass_no);
    print(dml)
    cur.execute(dml)
except cx_Oracle.DatabaseError as e:
    print('Error creating Assessment Record ' + str(e.args[0]))
    quit()
cur.close()    

    


# Open cursor for controls

try:
    control_cur=rep_con.cursor()
    control_query="""select control_no, control_audit_sql, control_cond_type,control_cond_result, control_detail_sql, control_remediation_sql, CONTROL_NAME, CONTROL_NOTES, CONTROL_SEVERITY from cis_controls where benchmark_no={} AND control_command_type=1 order by control_no """.format(Benchmark_No)
    control_cur.execute(control_query)
    control_list=control_cur.fetchall()
except cx_Oracle.DatabaseError as e:
    print('Error reading cis_controls ' + str(e.args[0]))
    quit()

exec_cursor=target_con.cursor()

"""
    Auditing start here
    
"""
#   control_result 3: Not made , 2: Error , 1: Success , 0: Fail    
control_result=3

for control_sql in control_list:
    try:
        exec_cursor.execute(control_sql[1])
    except cx_Oracle.DatabaseError as e:
        print('Error executing cis_controls ' + str(e.args[0]))
        control_result=2
        quit()
    audit_result=exec_cursor.fetchall()[0][0]
    

   
# Check the Control
    
     
    if control_sql[2] == '=':
        if audit_result == control_sql[3]:
            control_result=1
        else:
            control_result=0
            
    if control_sql[2] == '<>':
        if audit_result != control_sql[3]:
            control_result=1
        else:
            control_result=0

    if control_sql[2] == '>':
        if audit_result > control_sql[3]:
            control_result = 1
        else:
            control_result= 0
            
    if control_sql[2] == '>=':
        if audit_result >= control_sql[3]:
            control_result = 1
        else:
            control_result= 0  

    if control_sql[2] == '<':
        if audit_result < control_sql[3]:
            control_result = 1
        else:
            control_result= 0
            
    if control_sql[2] == '<=':
        if audit_result <= control_sql[3]:
            control_result = 1
        else:
            control_result= 0
            
    
    if control_result == 0:
        try:
            exec_cursor.execute(control_sql[4])
        except cx_Oracle.DatabaseError as e:
                print('Error executing detail sql ' + str(e.args[0]))
                quit()
        detail_result=exec_cursor.fetchall()
        header=['Objects Caused to FAIL']
        detail_result=tabulate(detail_result,header,tablefmt="grid")
        print(detail_result)

    

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
        if control_result == 1:
            row=(ass_no,control_sql[0],control_sql[6],control_sql[7],control_sql[1],control_sql[4],control_sql[5],control_sql[2],control_sql[3],'',control_result,control_sql[8])
        
        print('DML ----> ', dml)
        cur.execute(dml,row)
        cur.execute('commit')
    except cx_Oracle.DatabaseError as e:
        print('Error creating Assessment Exec Record ' + str(e.args[0]))
        quit()
    cur.close()


# after the loop calculate score of the assessment and update score column

"""
End of Programs 
Close Repository and Target Connection
"""

rep_con.close()
target_con.close()
