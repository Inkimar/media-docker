#!/bin/bash
source ../.env
NOW=`date +"%Y-%m-%d"`
key="$1"
#echo $key
echo "Date is $NOW"

case $key in 
     -d )
     echo "dumps only the structure (argument is '$key')" 
     docker exec -it mediadocker_db.media_1 sh -c  "mysqldump $key -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /tmp/nf_media_barebone.sql"
     docker cp mediadocker_db.media_1:/tmp/nf_media_barebone.sql .
     ;;
     *)
     echo "dumps structure & data, (no argument) " 
     docker exec -it mediadocker_db.media_1 sh -c  "mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /tmp/nf_media_mysqldump.sql"
     docker cp mediadocker_db.media_1:/tmp/nf_media_mysqldump.sql .
     ;;
esac

