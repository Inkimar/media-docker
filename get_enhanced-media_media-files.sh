#!/bin/bash
MEDIA_FILES=media-files.tgz
SRC=https://archive.org/download/media-files/${MEDIA_FILES}
DST=srv/media
echo "copying mediafiles ${MEDIA_FILES} from ${SRC} to ${DST} -zip-up! "
test -f $MEDIA_FILES || (wget $SRC  && tar xvfz $MEDIA_FILES -C $DST --strip 1)

#tar xvfz $MEDIA_FILES -C $DST --strip 1
