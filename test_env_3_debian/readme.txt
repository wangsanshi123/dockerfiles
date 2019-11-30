测试环境---测试



docker run --name centos-ssh  -p 2200:22 -dit --privileged  centos-ssh-custom-2 /usr/sbin/init
docker run --name debian_3  -dit --privileged  yuantaixing/debian:1.1 /bin/bash