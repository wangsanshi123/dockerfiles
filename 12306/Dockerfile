FROM python:3.7

ARG CDV=77.0.3865.40
##########################################################################
#修改源，加速
RUN cp  /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

#安装基本软件，便于切换国内源,二次加速
RUN apt-get update
RUN apt-get install -y ca-certificates apt-transport-https

#修改成国内的源，二次加速
#COPY sources.list etc/apt/sources.list
RUN echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' > /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list
RUN apt-get update


# 安装常用的软件
RUN apt-get install -y locales net-tools openssh-server

RUN apt-get -y update
RUN  apt-get install -y  openssh-server
##########################################################################




ADD . /usr/src/app
WORKDIR /usr/src/app

RUN wget -c https://dl.lancdn.com/landian/soft/chrome/m/77.0.3865.120_amd64.deb  && \
apt-get install -y adwaita-icon-theme at-spi2-core dbus dconf-gsettings-backend dconf-service fonts-liberation glib-networking glib-networking-common glib-networking-services gsettings-desktop-schemas libappindicator3-1 libasound2 libasound2-data libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0 libavahi-client3 libavahi-common-data libavahi-common3 libcolord2 libcups2 libdbus-1-3 libdbusmenu-glib4 libdbusmenu-gtk3-4 libdconf1 libdrm2 libfile-basedir-perl libfile-desktopentry-perl libfile-mimeinfo-perl libfontenc1 libgl1-mesa-glx libglapi-mesa  libgtk-3-0 libgtk-3-bin libgtk-3-common  libindicator3-7 libjson-glib-1.0-0 libjson-glib-1.0-common  libnspr4 libnss3  librest-0.7-0 libsoup-gnome2.4-1 libsoup2.4-1 libwayland-client0 libwayland-cursor0 libx11-protocol-perl libx11-xcb1 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-shape0 libxcb-sync1 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxi6 libxinerama1 libxkbcommon0 libxmu6 libxmuu1 libxpm4 libxrandr2 libxshmfence1 libxtst6 libxv1 libxxf86dga1 libxxf86vm1 multiarch-support x11-utils x11-xserver-utils xdg-utils xkb-data  lsb-release  && \
dpkg -i 77.0.3865.120_amd64.deb && \
wget -c http://npm.taobao.org/mirrors/chromedriver/LATEST_RELEASE


RUN wget -c  https://npm.taobao.org/mirrors/chromedriver/$CDV/chromedriver_linux64.zip && \
apt-get install -y unzip && \
unzip chromedriver_linux64.zip




ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai


## install python requirements
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pyspider --no-cache-dir -r requirements.txt
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## install ntpdate, not accept but saving code
#RUN echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib \
#	deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib \
#	deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib' > /etc/apt/sources.list \
#	&& apt-get update\
#	&& apt-get install ntpdate -y \


#EXPOSE 5010

#CMD [ "python", "run.py" ]
#ENTRYPOINT [ "python", "run.py" ]

##########################################################################
#配置ssh服务,应该修改密码，默认密码是111。（添加ssh服务，便于容器常驻，且能通过ssh远程管理）
RUN mkdir /var/run/sshd && echo 'root:111' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
##########################################################################
