#!/bin/bash

FILE=mediaserver-nf.ear
SRC=/media/buffalo/dina-data/naturalist/integrated/${FILE}
DST=wildfly-custom/customization


echo "fetches the artifact from Buffalo, relying on buffalo beeing mounted"
echo "copying from ${SRC} to ${DST}"
test -f $DST/$FILE || cp $SRC $DST
