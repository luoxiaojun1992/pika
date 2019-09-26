FROM centos:latest
MAINTAINER left2right <yqzhang@easemob.com>

RUN rpm -ivh https://mirrors.ustc.edu.cn/epel/epel-release-latest-7.noarch.rpm && \
    yum -y update && \
    yum -y install snappy-devel && \
    yum -y install protobuf-devel && \
    yum -y install gflags-devel && \
    yum -y install glog-devel && \
    yum -y install gcc-c++ && \
    yum -y install make && \
    yum -y install which && \
    yum -y install git

ENV PIKA  /pika
COPY . ${PIKA}
WORKDIR ${PIKA}
RUN make
ENV PATH ${PIKA}/output/bin:${PATH}

WORKDIR ${PIKA}/output

EXPOSE 9221

CMD ["/pika/output/bin/pika", "-c", "/pika/conf/pika.conf"]
