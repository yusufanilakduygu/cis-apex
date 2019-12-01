# -*- coding: utf-8 -*-
"""
Created on Sun Dec  1 17:01:18 2019

@author: Anil
"""

import cx_Oracle
import getpass


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

    
"""
Close Repository and Target Connection
"""
rep_con.close()
target_con.close()
