#!/bin/bash
MEDIA_TAR=media-files.tgz
SRC=/media/buffalo/dina-data/naturalist/integrated/${MEDIA_TAR}
DST=srv/data

echo "copying mediafiles ${MEDIA_TAR} from ${SRC} to ${DST}"
test -f $DST/$MEDIA_TAR || (cp $SRC $DST && cd $DST && tar xvfz ${MEDIA_TAR})
#tar xvfz ${MEDIA_TAR}
#echo "deletes the tar :  ${image_tar}"
#rm ${image_tar} 
