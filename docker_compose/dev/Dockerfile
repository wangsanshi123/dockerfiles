FROM centos-ssh-custom-4
MAINTAINER yuantaixing<1183195926@qq.com>
#ENV PATH /opt/mongodb/bin:$PATH
RUN mkdir -p /opt/yjsmf
COPY . /opt/yjsmf
WORKDIR /opt/yjsmf
RUN set -x && chmod a+x init.sh
RUN sh init.sh
#ENTRYPOINT ["sh","init.sh"]
