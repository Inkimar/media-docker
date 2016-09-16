#!/bin/bash
image_tar=media-files.tgz
SRC=/media/buffalo/dina-data/naturalist/integrated/${image_tar}
DST=srv/data

echo "copying mediafiles ${image_tar} from ${SRC} to ${DST}"

cp $SRC $DST
echo "copy done"
echo "unpack ${image_tar}"

cd $DST
tar xvfz ${image_tar}
echo "erasing ${image_tar}"
rm ${image_tar}
