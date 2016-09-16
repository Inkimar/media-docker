#!/bin/bash
schema=mediaserver_for_nf-20160203.sql

echo "fetching the sql-dump, ${schema}, for the mediaserver , populated with data."
SRC=/media/buffalo/dina-data/naturalist/integrated/${schema}
echo "copying from ${SRC}"
cp $SRC mysql_media-autoload

