#!/bin/bash
FILE=mediaserver-nf.ear
SRC=/media/buffalo/dina-data/naturalist/integrated/${FILE}
DST=srv/deployments
RELEASE=srv/releases

echo "copying from ${SRC} to ${RELEASE} and ${DST}"
test -f $DST/$FILE || cp $SRC $RELEASE && cp $SRC $DST
