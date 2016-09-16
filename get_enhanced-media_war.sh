#!/bin/bash
artifact=mediaserver-nf.ear

echo "fetching the artifact ${artifact} from Buffalo"
SRC=/media/buffalo/dina-data/naturalist/integrated/${artifact}
cp $SRC srv/deployments
