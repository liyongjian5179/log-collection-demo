FROM openjdk:8
LABEL maintainer="liyongjian5179@163.com"
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY init.sh /init.sh
COPY target/log-collection-demo-0.0.1-SNAPSHOT.jar /usr/local/log-collection-demo.jar
EXPOSE 8080
#ENTRYPOINT ["/bin/sh", "/init.sh"]
CMD ["/bin/sh", "/init.sh"]
