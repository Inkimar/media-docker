#!/bin/bash
source ../.env


key="$1"
echo $key

case $key in 
     -d )
     echo "dumps only the structure , your input is '$key'" 
     docker exec -it mediadocker_db.media_1 sh -c  "mysqldump $key -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /tmp/nf_media_barebone.sql"
     docker cp mediadocker_db.media_1:/tmp/nf_media_barebone.sql .
     ;;
     --default)
     echo "dumps structure & data, your input is '$key'" 
     docker exec -it mediadocker_db.media_1 sh -c  "mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /tmp/nf_media_mysqldump.sql"
     docker cp mediadocker_db.media_1:/tmp/nf_media_mysqldump.sql .
     ;;
esac

