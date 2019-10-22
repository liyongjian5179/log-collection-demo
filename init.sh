#!/bin/bash
# sh 中没有 source 命令
# source /etc/profile

# JVM启动参数
JAVA_OPTIONS="-server -Xms256m -Xmx256m -Duser.timezone=Asia/Shanghai -Djava.security.egd=file:/dev/./urandom"

cd /usr/local
mkdir -p /logs/log-collection-demo/$HOSTNAME/logs
ln -s /logs/log-collection-demo/$HOSTNAME/logs /usr/local/logs

echo 'JAVA_OPTIONS:'$JAVA_OPTIONS

# 执行jar文件
java $JAVA_OPTIONS -jar /usr/local/log-collection-demo.jar
