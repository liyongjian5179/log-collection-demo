# 日志收集 demo 基础镜像

## Requirements

1. Java - 1.8.x

2. Maven - 3.x.x

## Steps to setup

**1. Clone the application**

```bash
https://github.com/liyongjian5179/log-collection-demo.git
```

**2. Build and run the app using maven**

```bash
cd log-collection-demo
mvn package
java -jar target/log-collection-demo-0.0.1-SNAPSHOT.jar
```

You can also run the app without packaging it using -

```bash
mvn spring-boot:run
```

## 编译命令

```bash
mvn -U clean package -Dsonar.skip=true -Dmaven.test.skip=true
```

## 启动命令

```bash
java -jar target/log-collection-demo-0.0.1-SNAPSHOT.jar
```

## 接口访问

```bash
curl http://localhost:8080/
```

返回："Success! Master"

```bash
curl http://localhost:8080/hello
```

返回："Hello, Master"

## Prometheus 监控项
```bash
curl http://localhost:8080/actuator/prometheus
```
返回：
```bash
# HELP jvm_gc_live_data_size_bytes Size of old generation memory pool after a full GC
# TYPE jvm_gc_live_data_size_bytes gauge
jvm_gc_live_data_size_bytes{application="log-collection-demo",} 0.0
# HELP jvm_gc_memory_allocated_bytes_total Incremented for an increase in the size of the young generation memory pool after one GC to before the next
# TYPE jvm_gc_memory_allocated_bytes_total counter
jvm_gc_memory_allocated_bytes_total{application="log-collection-demo",} 5.4525952E7
# HELP system_cpu_count The number of processors available to the Java virtual machine
# TYPE system_cpu_count gauge
system_cpu_count{application="log-collection-demo",} 4.0
# HELP tomcat_sessions_alive_max_seconds  
# TYPE tomcat_sessions_alive_max_seconds gauge
tomcat_sessions_alive_max_seconds{application="log-collection-demo",} 0.0
# HELP jvm_classes_unloaded_classes_total The total number of classes unloaded since the Java virtual machine has started execution
# TYPE jvm_classes_unloaded_classes_total counter
jvm_classes_unloaded_classes_total{application="log-collection-demo",} 1.0
# HELP jvm_classes_loaded_classes The number of classes that are currently loaded in the Java virtual machine
# TYPE jvm_classes_loaded_classes gauge
jvm_classes_loaded_classes{application="log-collection-demo",} 7899.0
# HELP jvm_threads_peak_threads The peak live thread count since the Java virtual machine started or peak was reset
# TYPE jvm_threads_peak_threads gauge
jvm_threads_peak_threads{application="log-collection-demo",} 22.0
# HELP system_load_average_1m The sum of the number of runnable entities queued to available processors and the number of runnable entities running on the available processors averaged over a period of time
# TYPE system_load_average_1m gauge
system_load_average_1m{application="log-collection-demo",} 0.11
...
```

## 健康检查
```bash
curl http://localhost:8080/actuator/health
```
返回：{"status":"UP"}

## 构建镜像
```bash
docker build -t log-collection-demo .
```

## 启动容器
```bash
docker run -d  --name=log-collection-demo -p8080:8080 log-collection-demo
```

## 远程镜像
```bash
registry.cn-beijing.aliyuncs.com/liyongjian5179/log-collection-demo:latest
```

## 本地测试
直接执行 `./build_start.sh` 脚本即可

## 日志输出路径  
`/usr/local/logs`  

## 业务日志收集方案
### 1. filebeat + sidecar 的方式
```bash
cd log-sidecar
kubectl apply -f deployment.yaml
```

### 2. filebeat + daemonset 的方式(默认不收集 k8s 系统日志)
```bash
cd log-daemonset
kubectl apply -f daemonset.yaml
kubectl apply -f java-demo.yaml
```
应用通过 annotations 的方式开启日志收集，
    `filebeat.harvest: "true" `为开启，
    `filebeat.index: "xxxxxxxx" `写成对应的服务名即可  

```bash  
annotations:
  filebeat.harvest: "true"
  filebeat.index: "xxxxxxxx"
```





