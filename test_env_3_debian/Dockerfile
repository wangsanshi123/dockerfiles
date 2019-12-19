FROM  debian:stretch
MAINTAINER yuantaixing<1183195926@qq.com>

#修改成国内的源，加速
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list etc/apt/sources.list

# 安装常用的软件
RUN apt-get update \
    && apt-get install -y locales net-tools openssh-server htop git vim wget gcc make  curl  bzip2 sudo \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV LANG en_US.utf8

#配置ssh服务
RUN mkdir /var/run/sshd && echo 'root:111' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]