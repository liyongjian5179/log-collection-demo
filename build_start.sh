#!/bin/bash

IMAGE_NAME=log-collection-demo

mvn -U clean package -Dsonar.skip=true -Dmaven.test.skip=true

docker rm -f lyj

docker build -t ${IMAGE_NAME} .

docker run -d  --name=lyj -p8080:8080 ${IMAGE_NAME}

docker tag ${IMAGE_NAME}  registry.cn-beijing.aliyuncs.com/liyongjian5179/${IMAGE_NAME}

docker push registry.cn-beijing.aliyuncs.com/liyongjian5179/${IMAGE_NAME}
