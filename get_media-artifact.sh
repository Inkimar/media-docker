#!/bin/bash
source .env2

#echo "copying to ${RELEASE}/${ARTIFACT}"
test -f ${RELEASE}/${ARTIFACT} ||  (wget ${BASE}/${VERSION}/mediaserver-ear.ear -O ${RELEASE}/${ARTIFACT} && cp ${RELEASE}/${ARTIFACT} wildfly-custom/customization)
