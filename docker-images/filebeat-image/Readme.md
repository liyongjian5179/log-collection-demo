## 构建 filebeat 镜像
```bash
docker build -t filebeat:7.4.0 -f Dockerfile-filebeat .
docker tag filebeat:7.4.0 registry.cn-beijing.aliyuncs.com/liyongjian5179/filebeat:7.4.0
docker push registry.cn-beijing.aliyuncs.com/liyongjian5179/filebeat:7.4.0
```
或者直接执行
```bash
make all
```
## 