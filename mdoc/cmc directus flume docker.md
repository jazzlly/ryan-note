# 原始命令

```

docker run --name mysql_directus --network cmc_directus \
  -p 3306:3306 -v mysql-directus:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=pekall1234 -d mysql:5.7


docker run -d   --network cmc_directus   --name cmc_directus   -p 8055:8055   -v directus_uploads:/directus/uploads   -v directus_extentions:/directus/extensions   -e KEY=255d861b-5ea1-5996-9aa3-922530ec40b1   -e SECRET=6116487b-cda1-52c2-b5b5-c8022c45e263   -e ADMIN_EMAIL=pekall@pekall.com   -e ADMIN_PASSWORD=cmc.directus.12#$   -e DB_CLIENT=mysql   -e DB_HOST=mysql_directus   -e DB_PORT=3306   -e DB_DATABASE=cmc   -e DB_USER=root   -e DB_PASSWORD=pekall1234   directus/directus:9.10.0

```

```
docker run --name mysql5.7 --network cmc_directus \
  -p 3306:3306 -v mysql-directus:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=pekall1234 -d mysql:5.7
```

docker pull mysql:5.7
docker pull directus/directus:9.10.0

docker save -o mysql-5.7.tar mysql:5.7
docker save -o directus-9.10.0.tar directus/directus:9.10.0

docker load -i ./mysql-5.7.tar
docker load -i ./directus-9.10.0.tar



```console
# 连接远程mysql
docker run -it --rm mysql:5.7 mysql -h192.168.11.119 -upekall -pApple12#$

# 进入mysql容器
docker exec -it some-mysql bash
```