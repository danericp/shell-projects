
## Setup Bash as Shebang
# #!/usr/bin/bash

## Enable Debug mode
# set -vx

## Setup Directories
mkdir -p log
mkdir -p tmp
mkdir -p html
mkdir -p oracle

## Setup Connection String for the database
STR_ORACLE_CONN=system/sys123@localhost:1521
## Setup Timestamp for output files
STR_TIMESTAMP=$(date +%Y%d%m_%H%M%S)

## Create a Logging Function
f_logger()
{
echo "$(date +${STR_TIMESTAMP}) - ${1}" | tee -a ${FILE_LOG}
}