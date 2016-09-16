#!/bin/bash
artifact=mediaserver-nf.ear
DST=srv/deployments
RELEASE=srv/releases

echo "fetching the artifact ${artifact} from Buffalo"
SRC=/media/buffalo/dina-data/naturalist/integrated/${artifact}
echo "copying from ${SRC} to ${RELEASE} and ${DST}"
cp $SRC $RELEASE
cp $SRC $DST
