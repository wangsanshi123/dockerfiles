FROM mongo:latest
MAINTAINER yuantaixing <1183195926@qq.com>
RUN apt-get update -y && apt-get clean all \
&& apt-get install -y git \
&& mkdir -p /etc/mongo \
&& mkdir -p /var/lib/mongodb \
&& touch /var/log/mongodb/mongod.log \
&& git clone https://github.com/yuantaixing/dockerfiles.git \
&& cp dockerfiles/mongo/mongod.conf  /etc/mongo/mongod.conf \
&& rm dockerfiles/ -fr
EXPOSE 27017