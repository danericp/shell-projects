
## --------------------------------------------------
## Setup Bash as Shebang
# #!/usr/bin/bash
## --------------------------------------------------

## --------------------------------------------------
## Enable Debug mode
# set -vx
## --------------------------------------------------

## --------------------------------------------------
## Setup Directories
## --------------------------------------------------
mkdir -p log
mkdir -p tmp
mkdir -p html

## --------------------------------------------------
## Setup Connection String for the database
## --------------------------------------------------
export STR_DB_USER=system
export STR_DB_PASS=sys123
export STR_DB_HOST=localhost
export STR_DB_PORT=1521
export STR_DB_SID=ORCL3
export STR_DB_CONN="${STR_DB_USER}/${STR_DB_PASS}@${STR_DB_HOST}:${STR_DB_PORT}/STR_DB_SID"
export STR_DB_TABLE="tb_sqlplus_crud"

## --------------------------------------------------
## Setup Timestamp for output files
## --------------------------------------------------
STR_TIMESTAMP=$(date +%Y%d%m_%H%M%S)

## --------------------------------------------------
## Create a Logging Function
## --------------------------------------------------
function_logger()
{
	echo "$(date +${STR_TIMESTAMP}) - ${1}" | tee -a ${2}
}

## --------------------------------------------------
## Customized function for sending HTML email
## --------------------------------------------------
function_sendmail ()
{
	MAIL_BODY=${1}
	MAIL_FROM=${2}
	MAIL_TO=${3}
	MAIL_SUBJECT="${4}"
	MAIL_CC=${5}
	MAIL_BCC=${6}
	MAIL_PART=`uuidgen` ## Generates Unique ID
	MAIL_PART_BODY=`uuidgen` ## Generates Unique ID
	(
		echo "Date: `date -R`"
		echo "To: ${MAIL_TO}"
		echo "From: ${MAIL_FROM}"
		echo "Cc: ${MAIL_CC}"
		echo "Bcc: ${MAIL_BCC}"
		echo "Subject: ${MAIL_SUBJECT}"
		echo "MIME-Version: 1.0"
		echo "Content-Type: multipart/mixed; boundary=\"${MAIL_PART}\""
		echo "--${MAIL_PART}"
		echo "Content-Type: multipart/alternative; boundary=\"${MAIL_PART_BODY}\""
		echo ""
		echo "--${MAIL_PART_BODY}"
		echo "Content-Type: text/html; charset=ISO-8859-1"
		echo "Content-Disposition: inline"
		echo ""
		cat ${MAIL_BODY}
		echo ""
		for ATTACH in "${ARGS[@]}"
		do
			echo "--${MAIL_PART}"
			echo "Content-Type: application/pdf; charset=ISO-8859-1; name=`basename ${ATTACH}`"
			echo "Content-Transfer-Encoding: base64"
			echo "Content-Disposition: attachment; filename=`basename ${ATTACH}`"
			echo ""
			base64 < "${ATTACH}"
		done
	) | sendmail ${MAIL_TO}
}

## --------------------------------------------------
## Customized function for generating CSS
## --------------------------------------------------
function_gen_css ()
{
MAIL_OUTPUT=${1}
cat<<EOF>>${MAIL_OUTPUT}
<style type="text/css">
table.customtable {
        font-family: Helvetica,arial,Courier;
        font-size:13px;
        color:#111111;
        border-width: 1px;
        border-color: #111111;
        border-collapse: collapse;
}
table.customtable th {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #111111;
        background-color: #dedede;
}
table.customtable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #111111;
        background-color:
}
table.tablehead {
        font-family: Helvetica,arial,Courier;
        font-size:13px;
        color:#111111;
        border-width: 1px;
        border-color: #111111;
        border-collapse: collapse;
}
font {
        font-family: Helvetica,arial,Courier;
        font-size:13px;
        color:blue;
}
</style>
EOF
}