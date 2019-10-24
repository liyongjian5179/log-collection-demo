all: build push
.PHONY: build push test

TAG = 7.4.1
CONTAINER_NAME = test-filebeat

DOCKER_REGISTRY = registry.cn-beijing.aliyuncs.com/liyongjian5179

build:
	docker build -t $(DOCKER_REGISTRY)/filebeat:$(TAG) .

push: 
	docker push $(DOCKER_REGISTRY)/filebeat:$(TAG)

clean:
	docker rm -f $(CONTAINER_NAME)

test:
	docker run  -d --name $(CONTAINER_NAME) $(DOCKER_REGISTRY)/filebeat:$(TAG) 
	docker ps -a|grep $(CONTAINER_NAME)
	docker logs -f $(CONTAINER_NAME)