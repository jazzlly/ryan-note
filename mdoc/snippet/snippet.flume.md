# pekall info

git: 
git@192.168.10.211:mdm_server/pekall-cmc-data-system.git

# ref
flume source: 
/c/Users/think/git/pekall/server/apache-flume-1.9.0-src

# command
```sh
# build cust source
cd srv
cd pekall-cmc-data-system/pekall-custom-flume-sink
mvn clean install -Dmaven.test.skip=true && cp target/java-examples-0.0.1-SNAPSHOT-jar-with-dependencies.jar  ~/bin/apache-flume-1.9.0-bin/lib/
 
bin/flume-ng agent --name a1 -c conf -f conf/custom_sink.conf  -Dflume.root.logger=INFO,console

bin/flume-ng agent --name a1 -c conf -f conf/custom_sink-avro.conf -Dflume.root.logger=INFO,console
```

# custom sink
https://partners-intl.aliyun.com/help/zh/e-mapreduce/latest/configure-a-custom-sink