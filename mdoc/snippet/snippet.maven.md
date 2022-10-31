### mvn下载源代码
```sh

mvn dependency:resolve -Dclassifier=sources

mvn dependency:sources

```

### mvn test
```sh

mvn clean test -Dtest=TestClass#testFunc
```

### dependency error
```sh
检查dependency错误

% mvn dependency:tree -X

```

### ssl ignore
```
mvn -Dmaven.wagon.http.ssl.insecure=true  -Dmaven.wagon.http.ssl.allowall=true install

```

