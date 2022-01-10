#!/bin/bash
  
mysql -u root -p'$(cat /root/.mysql_pass)' -e 'SHOW SLAVE STATUS \G' | grep -E 'Master_Host:|Slave_IO_Running:|Slave_SQL_Running:|Last_Error:|Seconds_Behind_Master:|Last_IO_Error:|Last_IO_Error_Timestamp:|Last_SQL_Error:|Last_SQL_Error_Timestamp' > replication_status.log

cat replication_status.log|awk '{$1=$1;print}'|tr '\n' '|\n'|logger -t mysql_replica_status
