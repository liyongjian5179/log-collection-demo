#!/bin/bash
# liyongjian5179@163.com

if [ $# -ne 1 ];then
        echo "please user in: `basename $0`  TAG_VERSION"
        exit 1
fi

TAG=$1
FILE="./Dockerfile"

OS_TYPE=$(uname)
if [ "$OS_TYPE" = Darwin ];then
    echo "apple"
    sed -i "_bak"  "s/\(ENV FILEBEAT_VERSION=\).*$/\1${TAG}/g"  $FILE
elif [ "$OS_TYPE" = Linux ];then
    echo "linux"
    sed -i 's#\(ENV FILEBEAT_VERSION=\)\S*$#\1'${TAG}'#' $FILE
else
	echo "This System is not support."
	exit 1
fi
