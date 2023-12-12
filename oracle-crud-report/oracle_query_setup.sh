
## Setup Bash as Shebang
#!/usr/bin/bash
## Enable Debug mode
# set -vx

## Call the Library Script
. ./library.sh

## Setup a Basename
STR_BASENAME="oracle_query_setup"
## Setup Log File
FILE_LOG=./log/${STR_BASENAME}_${STR_TIMESTAMP}.log>${FILE_LOG}

echo ${STR_ORACLE_CONN}
sqlplus -s ${STR_ORACLE_CONN}<<SQLPLUS
SELECT SYSDATE FROM dual;
SQLPLUS