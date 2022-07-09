
### help
```
docker system prune
docker help
docker help ps

docker version
docker info

docker ps -a

docker diff container_name_or_id

# 查看日志
docker logs container_name_or_id

docker inspect container_name_or_id

docker volume inspect volume_name

docker image history getting-started

docker image history --no-trunc getting-started

```

# 加速 accelerate
```sh
# pip加速
pip install pytest -i https://pypi.tuna.tsinghua.edu.cn/simple/

# alpine linux国内源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories 

sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

# yarn加速
RUN yarn config set registry https://registry.npm.taobao.org/

```

# maven
```
# 使用java 11编译工程
MSYS_NO_PATHCONV=1 docker run -it --rm -v "$HOME/.m2":/root/.m2 -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.8.5-jdk-11 mvn clean install
```

### network/debug
```
# 检查容器的网络
docker run -it --net container: nicolaka/netshoot

# 检查主机的网络
docker run -it --net host nicolaka/netshoot

```

### exec / mysql
```
docker exec nginxtest echo 'haha'

docker exec -it mysql_directus mysql -uroot -ppekall1234
```

### clean/clear/prune
```
docker container prune

docker volume prune
```

### offline, import/export
```
docker save mynewimage > /tmp/mynewimage.tar
docker load < /tmp/mynewimage.tar

cat img.tar | docker import - new_image_name # 导入文件
```

### images
```
docker images
docker images ubuntu 
docker history e20a53f56ce8
```

### search
```bash
docker search percona        #search docker hub\
docker search ubuntu
```

### pull
```
docker pull ubuntu:22.04     #好的习惯， pull的时候加上版本信息
docker pull nginx:latest
```

### run
```
# 好习惯 添加name
docker run --name my-mysql5.7 -e MYSQL_ROOT_PASSWORD=pekall12#$ -d  -p 3306:3306 mysql:5.7

docker run --name ubuntu_demo -i -t ubuntu:22.04

docker run --name ubuntu_daemon_demo -d ubuntu /bin/sh -c "while true; do echo hello world; sleep 1; done"

docker run -d -i -p 1234:1234 --name nc-daemon ubuntu:14.04 nc -l 1234

run --expose port_list # 打开端口列表

run -p 4432

```

### run/exec
```
# 后台运行并等待
docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
 
# 模拟虚拟机
docker run -d phusion/baseimage

# 
docker exec -i -t container_id /bash

docker run -dp 3000:3000 \
   -w /app -v "$(pwd):/app" \
   --network todo-app \
   -e MYSQL_HOST=192.168.11.96 \
   -e MYSQL_USER=root \
   -e MYSQL_PASSWORD=pekall1234 \
   -e MYSQL_DB=todos \
   node:12-alpine \
   sh -c "yarn install && yarn run dev"
```

### run/restart policy
```
# 总是重启。就算手动stop了，当docker守护进程重启后，该容器还是会重启
docker run -d --restart=always ubuntu:22.04 echo done

# 出错时才重启，下面命令不会重启
docker run -d --restart=on-failure:10 ubuntu:22.04 echo done

# unless-stopped，如果容器停止了，docker守护进程重启，则不会启动该容器
```

### debug socat
```
yum install -y socat

# UNIX-CONNECT 连接到docker daemon的端口
# UNIX-LISTEN 新增一个代理端口
socat -v UNIX-LISTEN:/tmp/dockerapi.sock,fork UNIX-CONNECT:/var/run/docker.sock

docker -H unix:///tmp/dockerapi.sock images

```

### start/stop
```
docker start ubuntu_demo

docker stop ubuntu_demo

docker attach ubuntu_demo

docker rm ubuntu_demo

docker rm `sudo docker ps -a -q`

```

### network
```
# 创建网络
docker network create my_network

# 新容器连接网络
docker run -it --network my_network --name ubuntu2204bash ubuntu:22.04 bash

# 老容器连接网络
docker network connect my_network blog1

```

### commit/tag
```
# 修改docker内部文件后, 可以提交app
docker commit todoapp1

# 为镜像打标签
docker tag image_id image_name
```

### volume/mount
- named volume和bind mount的区别
	- named vlume用于持久化容器内的数据。将容器内部的数据绑定到外部目录
	- bind mount用于开发。将外部的源代码绑定到容器内部
```


docker volume create directus_data
docker volume inspect directus_data

MSYS_NO_PATHCONV=1 docker run -dp 3000:3000 \
     -w /app -v "$(pwd):/app" \
     node:12-alpine \
     sh -c "yarn config set registry https://registry.npm.taobao.org/ && yarn install && yarn run dev"
     

MSYS_NO_PATHCONV=1 docker run \
  --name directus_sqlite2 \
  --mount source=directus_data,target=/directus/database \
  -p 8055:8055 \
  -e KEY=255d861b-5ea1-5996-9aa3-922530ec40b1 \
  -e SECRET=6116487b-cda1-52c2-b5b5-c8022c45e263 \
  directus/directus

MSYS_NO_PATHCONV=1  docker exec -it  directus_sqlite /bin/sh

# 将宿主机debian_volume目录映射到docker中data1目录
MSYS_NO_PATHCONV=1 docker run -v /e/docker/test_volume/debian_volume:/var/data1 -it debian bash

# 容器内容将填充nginx-vol卷
docker run -d \
  --name=nginxtest \
  -v nginx-vol:/usr/share/nginx/html \
  nginx:latest

# 自动删除未使用的卷，释放空间
docker volume prune
```

### swarm/cluster
```
# win11上开启了swarm
 docker swarm init
Swarm initialized: current node (bgxdz6uu4ndm8gxyiop0a8mrh) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-21yv6fo5i51lmloqst1zy7ngv2i9b7ynlx9yb4nngkrfqag9ud-13vt0okvep24mc75c7edqpdw4 192.168.65.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```
# container cmd

docker container run --publish 80:80 --detach nginx

docker container run -p 8080:80 -d --name my_nginx nginx

# 交互式启动

docker container run -it -p 8080:80 --name my_nginx nginx

  

# 启动

docker container start percona5.6

docker container stop my_nginx

  

docker container ls # docker ps is old way, -a

  

# container monitor

docker container logs my_nginx

docker container inspect my_nginx

docker container top my_nginx

docker container stats my_nginx

  

docker container rm my_nginx

  

# enter docker:

docker container exec -it percona5.6 bash

docker container exec -it ae85 bash

dock logs ubuntu_daemon_demo

dock logs -ft ubuntu_daemon_demo

docker top ubuntu_daemon_demo

docker stats ubuntu_daemon_demo ubuntu_demo

  

docker exec -d daemon_dave touch /etc/new_config_file

docker exec -t -i daemon_dave /bin/bash

  

--restart=always

--restart=on-failure:5

docker inspect ubuntu_demo

  

docker login      # 登录到docker hub, jazzlly

docker logout

  

sudo docker commit 4aab3ce3cb76 jazzlly/centos6_demo 　

  

# Docker file

docker build -t 'jazzlly/ubuntu:16.04' .

sudo docker build -t="jamtur01/static_ web:v1" \　

  [git@github.com](mailto:git@github.com):jamtur01/docker-static_ web

# --no-cache 忽略缓存

  

# todo:

docker cp

  

  

docker run -d -p 80 --name website  -v $ PWD/website:/var/www/html/ website  jazzlly/nginx_web

  

# docker 网络

docker network create app

docker network ls

docker network inspect

docker run -d --net=app jazzlly/redis

10466* 

docker exec -it 27fe1a5d50f1 /bin/bash

  

docker run -d --name redis1 --hostname=redis1 jazzlly/redis

  

docker kill -s signal container

  

 docker build -t friendlyhello .  

# Create image using this directory's Dockerfile

  

docker run -p 4000:80 friendlyhello 

 # Run "friendlyname" mapping port 4000 to 80

  

docker run -d -p 4000:80 friendlyhello        

 # Same thing, but in detached mode

  

docker container ls                               

 # List all running containers

  

docker container ls -a             

# List all containers, even those not running

  

docker container stop <hash>           

# Gracefully stop the specified container

  

docker container kill <hash>         

# Force shutdown of the specified container

  

docker container rm <hash>        

# Remove specified container from this machine

  

docker container rm $(docker container ls -a -q)         

# Remove all containers

  

docker image ls -a                             

# List all images on this machine

  

docker image rm <image id>            

# Remove specified image from this machine

  

docker image rm $(docker image ls -a -q)  

 # Remove all images from this machine

  

docker login            

 # Log in this CLI session using your Docker credentials

  

docker tag <image> username/repository:tag  

# Tag <image> for upload to registry

  

docker push username/repository:tag           

 # Upload tagged image to registry

  

docker run username/repository:tag                 

  # Run image from a registry

# 常用命令

docker container run -it --rm --net composesample1_default  alpine bash

nslookup [mysql.pekall.com](http://mysql.pekall.com/)

  

# run command in docker shell

# 命令不能用双引号括起来

docker exec -it jetty-test cat /var/lib/jetty/logs/$(date +%Y_%m_%d).stderrout.log

  

# !!! 这样就会报错

docker exec -it jetty-test "cat /var/lib/jetty/logs/$(date +%Y_%m_%d).stderrout.log"

  

# 避免每次都输入sudo docker

sudo usermod -aG docker jenkins

sudo usermod -aG docker jiangrui

### 

### network
docker network ls

docker network inspect bridge
docker network create --driver=bridge my_network

#### 查看container端口

docker container port <container_name_or_id>

  

#### 使用本机网络

--net=host

#### 不用使用-p 3306:3306
docker container run -d --name percona5.6-host --net=host -e MYSQL_ROOT_PASSWORD=pekall1234 pekall/percona:5.6-utf8

#### 可将一个container连接到多个网络

docker network connect
docker network disconnect

#### docker dns. Daemon会默认开启一个DNS服务.

#### 默认的bridge网络没有这个dns

#### 只有自己创建的网络才有

# 两个集群, round rabin

docker container run -d --rm --net my_net --net-alias search nginx
docker container run -d --rm --net my_net --net-alias search nginx

  

docker container run -it --net my_net alpine nslookup search

Name:      search

Address 1: 172.19.0.2 search.dude

Address 2: 172.19.0.3 search.dude