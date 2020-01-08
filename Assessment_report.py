import configparser
import cx_Oracle
import sys
import datetime


config = configparser.ConfigParser()
config.read_file(open(r'config.txt'))
rep_username = config.get('Repository', 'username')
rep_password = config.get('Repository', 'password')
rep_ConnectString = config.get('Repository', 'ConnectString')
log_file= open("Assessment-Error-01.log", "a")

try:
    rep_con=cx_Oracle.connect(rep_username,rep_password,rep_ConnectString)
except cx_Oracle.DatabaseError as e:
    log_file.write('\n Assessment Report : '+ str(datetime.datetime.now()) +' >> Repository DB Database Connection Error '+ str(e.args[0]))
    log_file.close()
    quit()

report_file= open("Assessment_Result.html", "w")
line="""<pre style = "font-family:courier ;font-size:35px; font-weight:700">  
 Database Security Assessment Report  
</pre>"""
report_file.write(line)

try:
    query= " Select b.conn_name, b.conn_dbname, c.benchmark_name, to_char( a.ass_date,'dd-mm-yyyy hh24:mi') ,  d.conn_type_name,c.database_version, a.ass_score, a.pass_count,a.fail_count, a. not_made_count from cis_assessments  a ,  cis_connections b , cis_benchmarks c  ,cis_conntype d where ass_no={} and a.conn_no=b.conn_no and a.benchmark_no=c.benchmark_no and d.conn_type=c.conn_type ".format(sys.argv[1])
    rep_cur=rep_con.cursor()
    rep_cur.execute(query)
    result=rep_cur.fetchall()
    if len(result) == 0 :
        log_file.write('\n Assessment Report : '+ str(datetime.datetime.now()) +' >> Assessment not Found ' + str(sys.argv[1]))
        log_file.close()
        line="""<pre style = "font-family:courier ;font-size:15px; font-weight:700" > *****    Assessment Not found  ****  </pre> """
        report_file.write(line)
        report_file.close()
        quit()
    rep_cur.close()
except cx_Oracle.DatabaseError as e:
    log_file.write('\n Assessment Report : '+ str(datetime.datetime.now()) +' >> Error reading reporistory overall data ' + str(e.args[0]))
    log_file.close()
    quit() 


line="""<pre style = "font-family:courier ;font-size:15px; font-weight:400"> 
 Benchmark Name      : {}
 Connection Name     : {}
 Benchmark Exec Date : {}
 Database Type       : {}
 Database Version    : {}
 Database Name       : {}
</pre>""".format(result[0][2],result[0][0],result[0][3],result[0][4],result[0][5],result[0][1])
report_file.write(line)


line="""<pre style = "font-family:courier ;font-size:25px; font-weight:700">  
 Score      : {}
</pre>""".format(result[0][6])
report_file.write(line)

line="""<pre style = "font-family:courier ;font-size:15px; font-weight:400"> 
 Pass   Count        : {}
 Fail   Count        : {}
 NoMade Count        : {}
 Total Controls      : {} """.format(result[0][7],result[0][8],result[0][9],result[0][7]+result[0][8]+result[0][9])
 
report_file.write(line)

line="""<pre style = "font-family:courier ;font-size:25px; font-weight:700">  
 Control Point Results
</pre>""" 
report_file.write(line)

line="""<style>
table.GeneratedTable {
  width: 80%;
  background-color: #ffffff;
  border-collapse: collapse;
  border-width: 2px;
  border-color: #000000;
  border-style: solid;
  color: #000000;
  font-family: "Courier"
}

table.GeneratedTable td, table.GeneratedTable th {
  border-width: 2px;
  border-color: #000000;
  border-style: solid;
  padding: 3px;
  font-family: "Courier"
}

table.GeneratedTable thead {
  background-color: #c0c0c0;
  font-family: "Courier"
}
</style>


<!-- HTML Code: Place this code in the document's body (between the 'body' tags) where the table should appear -->
<table class="GeneratedTable">
  <thead>
    <tr>
      <th>Control No</th>
	  <th>Control Name </th>
	  <th>Result</th>
    </tr>
  </thead>
  <tbody>
"""
report_file.write(line)

try:
    query="""select exec_control_no,exec_control_name, case exec_result  when  0 then 'FAIL' WHEN 1 Then 'SUCCESS' when 2 Then 'ERROR' When 3 Then 'UNMADE'  END  from cis_ass_exec where ass_no={} order by exec_control_no""".format(sys.argv[1])
    rep_cur=rep_con.cursor()
    rep_cur.execute(query)
    result=rep_cur.fetchall()
    rep_cur.close()
except cx_Oracle.DatabaseError as e:
    log_file.write('\n Assessment Report : '+ str(datetime.datetime.now()) +' >> Error reading cis_ass_exec ' + str(e.args[0]))
    log_file.close()
    report_file.close()
    quit() 

for i in result:
    line ="""
    <tr>
    <td><pre >
      {}
    </pre>
    </td>

    <td><pre>
      {}
    </pre>
    </td>

    <td><pre>
      {}
    </pre>
    </td> 
    </tr>""".format(i[0],i[1],i[2])
    report_file.write(line+'\n')


line ="""
  </tbody>
</table>

"""
report_file.write(line)
 
report_file.close()
rep_con.close()