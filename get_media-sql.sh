#!/bin/bash
source .env2

#echo "copying to mysql-autoload and ${SQL_DUMP}"
test -f ${SQL_DUMP} ||  (wget ${BASE}/${VERSION}/${SQL_DUMP} -O ${SQL_DUMP} && cp ${SQL_DUMP} mysql-autoload)
