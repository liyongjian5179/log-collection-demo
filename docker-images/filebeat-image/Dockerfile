#FROM elastic/filebeat:7.4.0
#LABEL maintainer="liyongjian5179@163.com"
#
#ENV LC_ALL en_US.UTF-8
#ENV TERM xterm
#ENV TZ=Asia/Shanghai
#
#COPY filebeat.yml /usr/share/filebeat/filebeat.yml
#USER root
#RUN chown root:filebeat /usr/share/filebeat/filebeat.yml &&\
#    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#USER filebeat


FROM centos:7.5.1804
LABEL maintainer="liyongjian5179@163.com"

ENV LC_ALL en_US.UTF-8
ENV TERM xterm
ENV TZ=Asia/Shanghai
ENV FILEBEAT_VERSION=7.4.1

ADD ./docker-entrypoint.sh /usr/local/bin/

RUN cd /usr/local  &&\
    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    tar xf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    rm -f filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz && \
    ln -s /usr/local/filebeat-${FILEBEAT_VERSION}-linux-x86_64 /usr/local/filebeat && \
    chmod +x /usr/local/filebeat/filebeat && \
    mkdir -p /etc/filebeat && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

COPY filebeat.yml /etc/filebeat/filebeat.yml

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/local/filebeat/filebeat","-e","-c","/etc/filebeat/filebeat.yml"]