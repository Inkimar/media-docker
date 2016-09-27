#!/bin/bash
MEDIA_FILES=media-files.tgz
SRC=https://archive.org/download/media-files/${MEDIA_FILES}
DST=srv/data
echo "copying mediafiles ${MEDIA_FILES} from ${SRC} to ${DST}"
test -f $MEDIA_FILES || (wget $SRC  && tar xvfz $MEDIA_FILES -C $DST)

#SRC=/media/buffalo/dina-data/naturalist/integrated/${MEDIA_TAR}
#test -f $DST/$MEDIA_TAR || (cp $SRC $DST && cd $DST && tar xvfz ${MEDIA_TAR})

