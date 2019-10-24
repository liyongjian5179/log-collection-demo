## 构建 filebeat 镜像
```bash
docker build -t filebeat:7.4.1 -f Dockerfile .
docker tag filebeat:7.4.1 registry.cn-beijing.aliyuncs.com/liyongjian5179/filebeat:7.4.1
docker push registry.cn-beijing.aliyuncs.com/liyongjian5179/filebeat:7.4.1
```
或者直接执行
```bash
make all
```
## 
