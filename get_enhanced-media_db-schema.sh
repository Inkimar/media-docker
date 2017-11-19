#!/bin/bash
FILE=mediaserver_for_nf-20160203.sql
SRC=https://archive.org/download/mediaserver_for_nf-20160203/${FILE}
DST=mysql_media-autoload

test -f $DST/$FILE || wget ${SRC} -P ${DST}

#Fetching artifact from Buffalo
#SRC=/media/buffalo/dina-data/naturalist/integrated/${SCHEMA}
#cp $SRC $DST

