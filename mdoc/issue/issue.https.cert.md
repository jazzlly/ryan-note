
### 问题 unable to find valid certification path to requested target

```java
sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
    at sun.security.ssl.Alerts.getSSLException(Unknown Source)
```


https://stackoverflow.com/questions/6908948/java-sun-security-provider-certpath-suncertpathbuilderexception-unable-to-find

如果https服务器使用了自签名证书，客户端需要将该自签名证书添加到自己java的信任库中

```bash
# 获取服务器证书
openssl x509 -in <(openssl s_client -connect 192.168.9.99:4432 -prexit 2>/dev/null) -out ~/server.crt

# 将证书导入到java的信任链中
keytool -importcert -file ~/server.crt -alias myserver -keystore 
 /usr/java/jdk/jre/lib/security/cacerts -storepass changeit
 
```



