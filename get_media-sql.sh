#!/bin/bash
source .env2

echo "copying to ${RELEASE}/${SQL_DUMP}"
test -f ${RELEASE}/${SQL_DUMP} ||  (wget ${BASE}/${VERSION}/${SQL_DUMP} -O ${RELEASE}/${SQL_DUMP} && cp ${RELEASE}/${SQL_DUMP} mysql-autoload)
