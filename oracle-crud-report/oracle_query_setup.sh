
## --------------------------------------------------
## Setup Bash as Shebang
## --------------------------------------------------
#!/usr/bin/bash
## --------------------------------------------------
## Enable Debug mode
## --------------------------------------------------
# set -vx

## --------------------------------------------------
## Call the Library Script
## --------------------------------------------------
. ./library.sh

## --------------------------------------------------
## Initialize Mandatory Variables and Files
## --------------------------------------------------
STR_BASENAME="oracle_query_setup"
STR_MAIL_SUBJECT="Profiles Report"
STR_MAIL_SENDER="sender@email.com"
STR_MAIL_RECIPIENT="recipient@email.com"
FILE_CSV=./tmp/${STR_BASENAME}_${STR_TIMESTAMP}.csv>${FILE_CSV}
FILE_HTML=./html/${STR_BASENAME}_${STR_TIMESTAMP}.html>${FILE_HTML}
FILE_LOG=./log/${STR_BASENAME}_${STR_TIMESTAMP}.log>${FILE_LOG}
FILE_TMP=./tmp/${STR_BASENAME}_${STR_TIMESTAMP}.tmp>${FILE_TMP}
FILE_TMP_HTML=./tmp/${STR_BASENAME}_${STR_TIMESTAMP}_BODY.tmp>${FILE_TMP_HTML}

## --------------------------------------------------
## Connect to database and create the table
## --------------------------------------------------
crudCreateTable ()
{
function_logger "Create a Table" ${FILE_LOG}
sqlplus -s ${1}<<EOL

DROP TABLE tb_sqlplus_crud;
COMMIT;

CREATE TABLE tb_sqlplus_crud (
	id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(50),
	country_code VARCHAR(50)
);
COMMIT;

EXIT;
EOL
echo ${QUERY_RESULT}
}

## --------------------------------------------------
## Connect to database and insert data
## --------------------------------------------------
crudInsertUpdateDelete ()
{
function_logger "Connect to database and insert data" ${FILE_LOG}
sqlplus -s ${1}<<EOL

INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (1, 'Rudie', 'Swires', 'rswires0@google.pl', 'Male', 'RU');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (2, 'Estell', 'McQuorkell', 'emcquorkell1@dell.com', 'Female', 'ID');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (3, 'Oriana', 'Smeuin', 'osmeuin2@vk.com', 'Female', 'CN');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (4, 'Allyn', 'Rainy', 'arainy3@jugem.jp', 'Male', 'PH');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (5, 'Jaine', 'Hedworth', 'jhedworth4@amazon.co.jp', 'Female', 'RU');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (6, 'Germaine', 'Northen', 'gnorthen5@about.com', 'Male', 'CN');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (7, 'Eustace', 'Quemby', 'equemby6@biblegateway.com', 'Male', 'CZ');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (8, 'Arlin', 'Udie', 'audie7@twitpic.com', 'Agender', 'ID');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (9, 'Deonne', 'Rocca', 'drocca8@reddit.com', 'Female', 'CN');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (10, 'Celie', 'Paolone', 'cpaolone9@gov.uk', 'Female', 'GP');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (11, 'Hester', 'McLinden', 'hmclindena@pcworld.com', 'Female', 'SE');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (12, 'Marley', 'Ianinotti', 'mianinottib@newsvine.com', 'Non-binary', 'ID');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (13, 'Beitris', 'Schlagh', 'bschlaghc@gravatar.com', 'Female', 'FR');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (14, 'Mahmoud', 'Satterfitt', 'msatterfittd@wikimedia.org', 'Male', 'PE');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (15, 'Crysta', 'Willavize', 'cwillavizee@independent.co.uk', 'Female', 'BR');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (16, 'Link', 'Poznanski', 'lpoznanskif@google.co.jp', 'Male', 'CZ');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (17, 'Tome', 'Balden', 'tbaldeng@chron.com', 'Male', 'CZ');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (18, 'Val', 'Glendining', 'vglendiningh@amazonaws.com', 'Male', 'TG');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (19, 'Lyndsay', 'Draijer', 'ldraijeri@wufoo.com', 'Female', 'US');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (20, 'Fonzie', 'Foskett', 'ffoskettj@pcworld.com', 'Male', 'ID');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (21, 'Irwinn', 'Revitt', 'irevittk@hud.gov', 'Male', 'RU');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (22, 'Lenora', 'Geldeard', 'lgeldeardl@google.it', 'Female', 'SV');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (23, 'Jyoti', 'Labuschagne', 'jlabuschagnem@opensource.org', 'Bigender', 'CN');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (24, 'Kipp', 'Dring', 'kdringn@posterous.com', 'Female', 'CN');
INSERT INTO tb_sqlplus_crud (id, first_name, last_name, email, gender, country code) VALUES (25, 'Maddie', 'Bustin', 'mbustino@admin.ch', 'Male', 'AR');
COMMIT;

UPDATE tb_sqlplus_crud
SET first_name = 'Maddison'
WHERE id = 25;
COMMIT;

DELETE FROM tb_sqlplus_crud
WHERE id = 1;
COMMIT;

EXIT;
EOL
}

## --------------------------------------------------
## Generate datum for report
## --------------------------------------------------
crudSelectTable ()
{
function_logger "Generate datum for report" ${FILE_LOG}
QUERY_RESULT=`sqlplus -s ${1}<<EOL

SET LINESIZE 30000;
SET TRIMSPOOL ON;
SET FEEDBACK OFF;
SET NEWPAGE NONE;
SET HEAD OFF;

SPOOL ${FILE_TMP};
SELECT id
||'|'|| first_name
||'|'|| last_name
||'|'|| email
||'|'|| gender
||'|'|| country code
FROM tb_sqlplus_crud;
SPOOL OFF;

SPOOL ${FILE_CSV};
SELECT id
||','|| first_name
||','|| last_name
||','|| email
||','|| gender
||','|| country code
FROM tb_sqlplus_crud;
SPOOL OFF;

EXIT;
EOL`
}

## --------------------------------------------------
## Generate HTML body
## --------------------------------------------------
generateHTMLBody ()
{
function_logger "Generate HTML body" ${FILE_LOG}
echo " <table class=customtable> " >> ${FILE_TMP_HTML}
echo " <tr> " >> ${FILE_TMP_HTML}
echo " <th colspan=6> Profiles </th> " >> ${FILE_TMP_HTML}
echo " </tr><tr> " >> ${FILE_TMP_HTML}
echo " <th> ID </th> " >> ${FILE_TMP_HTML}
echo " <th> First Name </th> " >> ${FILE_TMP_HTML}
echo " <th> Last Name </th> " >> ${FILE_TMP_HTML}
echo " <th> Email </th> " >> ${FILE_TMP_HTML}
echo " <th> Gender </th> " >> ${FILE_TMP_HTML}
echo " <th> Country Code </th> " >> ${FILE_TMP_HTML}
echo " </tr> " >> ${FILE_TMP_HTML}
cat ${FILE_TMP} | while read DATA
do
echo  ${DATA} | IFS="|" read ARG_ID ARG_FN ARG_LN ARG_EM ARG_GD ARG_CC
echo " <tr> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_ID}</td> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_FN}</td> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_LN}</td> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_EM}</td> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_GD}</td> " >> ${FILE_TMP_HTML}
echo " <td>${ARG_CC}</td> " >> ${FILE_TMP_HTML}
echo " </tr> " >> ${FILE_TMP_HTML}
done
echo " </table> " >> ${FILE_TMP_HTML}
}

#=================================================================
# Create HTML Function
#=================================================================
createHTMLReport ()
{
ARG_CSS=${1}
ARG_SUB=${2}
ARG_REP=${3}
cat<<EOML>${FILE_HTML}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
EOML
function_gen_css ${FILE_HTML}
cat<<EOML>>${FILE_HTML}
</head>
<body>
<font style="font-family:Verdana;font-size:15px;color:#ff9900;font-style:bold;"> SQL </font><font> | </font>
<font style="font-family:Verdana;font-size:15px;color:#ff9900;"> Oracle </font><br>
<font face=verdana size=1 color=#153E7E> ${ARG_SUB} </font><br>
<hr><!--br-->
`cat ${ARG_REP}`
</body>
</html>
EOML
}

## --------------------------------------------------
## Execute Functions
## --------------------------------------------------
function_logger "Execute Functions" ${FILE_LOG}
crudCreateTable ${STR_DB_CONN}
crudInsertUpdateDelete ${STR_DB_CONN}
crudSelectTable ${STR_DB_CONN}
generateHTMLBody
createHTMLReport "${FILE_CSS}" "${SUBJECT_SCRIPT}" "${FILE_TMP_HTML}"

## --------------------------------------------------
## Injecting Attachments
## --------------------------------------------------
ARGS+=("${FILE_CSV}")

## --------------------------------------------------
## Send the email, plus attachment/s
## --------------------------------------------------
function_logger "Send the email, plus attachment" ${FILE_LOG}
function_sendmail "${FILE_HTML}" "${STR_MAIL_SENDER}" "${STR_MAIL_RECIPIENT}" "${STR_MAIL_SUBJECT}"

## --------------------------------------------------
## End Time Logging
## --------------------------------------------------
function_logger "Complete" ${FILE_LOG}