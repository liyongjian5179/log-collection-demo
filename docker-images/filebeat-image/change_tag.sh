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
    echo
    echo -e "\033[32;1mThis System is MacOS.\033[0m"
    echo 
    sed -i "_bak"  "s/\(ENV FILEBEAT_VERSION=\).*$/\1${TAG}/g"  $FILE
elif [ "$OS_TYPE" = Linux ];then
    echo
    echo -e "\033[32;1mThis System is Linux.\033[0m"
    echo
    sed -i 's#\(ENV FILEBEAT_VERSION=\)\S*$#\1'${TAG}'#' $FILE
else
    echo -e "\033[31;1mThis System is not support.\033[0m"
    exit 1
fi
