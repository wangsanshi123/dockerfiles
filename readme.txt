目前最大ip:172.18.1.6

常用的dockerfile，结合github，可以进行配置文件的修改.

eg:
docker build -t kali_top_10 .
docker build -t my_mongo1 .


docker run -d --name my_mongo1 -p 27018:27017  my_mongo1
docker run -d --name my_mongo1 -p 27018:27017  my_mongo1 --config  /etc/mongo/mongod.conf



docker run --name debian  -p 2204:22 -dit --privileged  debian /usr/sbin/init


docker run --name 12306_1 -dit  12306_temp:1.0



docker run -it abhartiya/tools_gitallsecrets -token=1b4b7b9e09f522e6e0774e06587ca230e5fed5bc
docker run -it abhartiya/tools_gitallsecrets -token=1b4b7b9e09f522e6e0774e06587ca230e5fed5bc -repoURL=https://github.com/wangsanshi123/mysite1
docker run -it abhartiya/tools_gitallsecrets -token=1b4b7b9e09f522e6e0774e06587ca230e5fed5bc -repoURL=https://github.com/wangsanshi123/tutorial
docker run -it abhartiya/tools_gitallsecrets -token=1b4b7b9e09f522e6e0774e06587ca230e5fed5bc -user=wangsanshi123

docker cp 4fba4d821dcf:/root/results.txt .
docker cp aff07f8242d4:/root/results.txt .