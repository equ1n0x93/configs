#! /bin/bash
GITCONF="/Users/adahan/.gitconfig"
START=`expr $(grep -n '\[alias\]' ${GITCONF}| cut -d: -f1) + 1`
END=`expr $(grep -n '\[http\]' ${GITCONF}| cut -d: -f1 ) - 1`

sed -n "${START},${END}p" $GITCONF

