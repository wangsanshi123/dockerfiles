常用的dockerfile，结合github，可以进行配置文件的修改.

eg:
docker build -t kali_top_10 .
docker build -t my_mongo1 .


docker run -d --name my_mongo1 -p 27018:27017  my_mongo1
docker run -d --name my_mongo1 -p 27018:27017  my_mongo1 --config  /etc/mongo/mongod.conf



docker run --name debian  -p 2204:22 -dit --privileged  debian /usr/sbin/init