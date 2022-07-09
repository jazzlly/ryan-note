
### export server cert, import to java trust lib


#openssl, #keytool
```bash
# 获取服务器证书
openssl x509 -in <(openssl s_client -connect 192.168.9.99:4432 -prexit 2>/dev/null) -out ~/server.crt

# 将证书导入到java的信任链中
keytool -importcert -file ~/server.crt -alias myserver -keystore 
 /usr/java/jdk/jre/lib/security/cacerts -storepass changeit

```



