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
## 修改镜像版本  
先在 `Makefile` 中修改版本，然后执行`make build`即可
  
## make 命令使用说明
`make build`:	构建镜像
`make all`:	构建镜像，上传仓库
`make clean`:	清理 docker 容器镜像，及测试容器

