
sqlplus -s / as sysdba <<EOF >/dev/null
set feedback off trimspool on 
spool file_name.log;
select sid,serial#,substr(username,1,10) username,substr(osuser,1,10) osuser,substr(program||module,1,15) program,substr(machine,1,22) host,to_char(logon_time,'ddMon hh24:mi') login,last_call_et "last call",status
from v$session; 
spool off;
exit;
EOF



---sql 
set linesize 2000 trims on pagesize 0 feedback off 
set headling on
set pagesize 50000
select sid,serial#,substr(username,1,10) username,substr(osuser,1,10) osuser,substr(program||module,1,15) program,substr(machine,1,22) host,to_char(logon_time,'ddMon hh24:mi') login,last_call_et "last call",status
from gv$session;
exit

--filesh
sqlplus -s / as sysdba >>file.log <<EOF
@1.sql
EOF
