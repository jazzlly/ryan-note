
### here document & json
```sh
curl -i -v -s -X POST -b ./cookie.txt -H 'Content-Type:application/json' \
http://uas.pekall.com:9200/uni_auth/v1/enterprise_users \
    --data @<(cat<<EOF
    {
      "name": "test",
      "orgCode": "${orgcode}",
      ...
      "division": 110100
    }
EOF   # 顶头写，不能有空格
    )
```

### pipe
```sh
cat abc.json | curl -i -XPOST -H "Content-Type: application/json" -d @- \
  localhost:8761/eureka/apps/rest-api-test
```
