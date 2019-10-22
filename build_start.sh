#!/bin/bash

mvn -U clean package -Dsonar.skip=true -Dmaven.test.skip=true

docker rm -f lyj

docker build -t log-collection-demo .
docker run -d  --name=lyj -p8080:8080 log-collection-demo