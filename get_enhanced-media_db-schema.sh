#!/bin/bash
schema=mediaserver_for_nf-20160203.sql
DST=mysql_media-autoload
RELEASE=srv/releases

echo "fetching the sql-dump, ${schema}, for the mediaserver , populated with data."
SRC=/media/buffalo/dina-data/naturalist/integrated/${schema}
echo "copying from ${SRC} to ${RELEASE} and ${DST}"
cp $SRC $RELEASE
cp $SRC $DST

