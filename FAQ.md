Q:  filebeat 读取 docker 容器信息
A:  需要挂载     host: "unix:///var/run/docker.sock"
    https://www.elastic.co/guide/en/beats/filebeat/7.4/add-docker-metadata.html
```bash
2019-10-24T14:57:43.508+0800    ERROR   instance/beat.go:878    Exiting: error initializing processors: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
Exiting: error initializing processors: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```


Q:  filebeat 读取 k8s 相关信息
A:  需要能读取  config 信息
    https://www.elastic.co/guide/en/beats/filebeat/7.4/add-kubernetes-metadata.html
```bash
2019-10-24T15:22:16.822+0800    ERROR   kubernetes/util.go:85   kubernetes: Querying for pod failed with error: pods "log-collection-demo-filebeat-test-74d6cf5599-4tqcg" is forbidden: User "system:serviceaccount:default:default" cannot get resource "pods" in API group "" in the namespace "default"
```

Q:  如果不用以上两种方式，如何加上 `POD` 相关信息？
A:  可以通过读取环境变量的方式，将 `POD` 信息读进来
    在 deployment 中，filebeat 容器处加入以下配置，
```bash
    env:
    - name: POD_IP
        valueFrom:
        fieldRef:
            apiVersion: v1
            fieldPath: status.podIP
    - name: POD_NAME
        valueFrom:
        fieldRef:
            apiVersion: v1
            fieldPath: metadata.name
```
    在 `filebeat.yml` 中加入自定义字段（field）
```bash
    fields:
    POD_NAME: '${POD_NAME}'
    POD_IP: '${POD_IP}'
```
    导出的json 日志为：
```json
{
  "@timestamp": "2019-10-24T08:02:41.605Z",
  "@metadata": {
    "beat": "filebeat",
    "type": "_doc",
    "version": "7.4.1"
  },
  "host": {
    "name": "log-collection-demo-filebeat-test-844498c64c-jsl4s"
  },
  "agent": {
    "version": "7.4.1",
    "type": "filebeat",
    "ephemeral_id": "956bc7cb-f9d5-4966-b791-092df8e9747e",
    "hostname": "log-collection-demo-filebeat-test-844498c64c-jsl4s",
    "id": "eb4aada3-6f72-4d20-a9a7-53ddb872dd8f"
  },
  "log": {
    "offset": 4324,
    "file": {
      "path": "/log/all.log"
    }
  },
  "message": "2019-10-24 16:02:38.111  INFO log-collection-demo-filebeat-test-844498c64c-jsl4s --- [nio-8080-exec-1] o.s.w.s.DispatcherServlet                : Completed initialization in 8 ms",
  "POD_NAME": "log-collection-demo-filebeat-test-844498c64c-jsl4s",
  "POD_IP": "172.17.0.6",
  "input": {
    "type": "log"
  },
  "ecs": {
    "version": "1.1.0"
  }
```