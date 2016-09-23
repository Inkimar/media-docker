#!/bin/bash
SCHEMA=mediaserver_for_nf-20160203.sql
DST=mysql_media-autoload
RELEASE=srv/releases

echo "fetching the sql-dump, ${SCHEMA}, for the mediaserver , populated with data."
SRC=https://archive.org/download/mediaserver_for_nf-20160203/${SCHEMA}
echo "copying from ${SRC} to ${DST}"
test -f $DST/$MEDIA_TAR || cd $DST && wget $SRC

#Fetching artifact from Buffalo
#SRC=/media/buffalo/dina-data/naturalist/integrated/${schema}
#echo "copying from ${SRC} to ${RELEASE} and ${DST}"
#cp $SRC $DST

