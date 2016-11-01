#!/bin/bash
SCHEMA=mediaserver_for_nf-20160203.sql
SRC=https://archive.org/download/mediaserver_for_nf-20160203/${SCHEMA}

DST=mysql_media-autoload

echo "fetching  ${SCHEMA} from IA, for the mediaserver , populated with data."

echo "copying from ${SRC} to ${DST}"
test -f $DST/$SCHEMA || cd $DST && wget $SRC

#Fetching artifact from Buffalo
#SRC=/media/buffalo/dina-data/naturalist/integrated/${SCHEMA}
#cp $SRC $DST

