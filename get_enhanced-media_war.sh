#!/bin/bash
# using the artifact from this project : https://github.com/IcingInk/mediaserver-nf-specific (private)

FILE=mediaserver-nf.ear

SRC=https://archive.org/download/mediaserver-nf_201711/${FILE}
DST=wildfly-custom/customization

echo "copying from ${SRC} to ${DST}"
test -f $DST/$FILE || wget ${SRC} -P ${DST}

#Fetching artifact from Buffalo
#echo "fetches the artifact from Buffalo, relying on buffalo beeing mounted"
#SRC=/media/buffalo/dina-data/naturalist/integrated/${FILE}
#cp $SRC $DST
