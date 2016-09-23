#!/bin/bash
MEDIA_TAR=media-files.tgz
SRC=https://archive.org/download/media-files/${MEDIA_TAR}
DST=srv/data

echo "copying mediafiles ${MEDIA_TAR} from ${SRC} to ${DST}"

test -f $DST/$MEDIA_TAR || (cd $DST && wget $SRC  && tar xvfz ${MEDIA_TAR})


#SRC=/media/buffalo/dina-data/naturalist/integrated/${MEDIA_TAR}
#test -f $DST/$MEDIA_TAR || (cp $SRC $DST && cd $DST && tar xvfz ${MEDIA_TAR})

