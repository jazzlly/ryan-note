### here doc
```sh

man bash
and search here document

# here document
# Redirect input to an interactive shell script or program

# EOF可以是任何字符， 遇到顶头的EOF, 就认为输入结束了
$wc -l << EOF
    This is a simple lookup program 
    for good (and bad) restaurants
    in Cape Town.
EOF
3
$

cat >> /usr/lib/tmpfiles.d/tmp.conf << EOF
x /tmp/jetty-*
x /tmp/ehcache_*
x /tmp/start*
x /tmp/hsperfdata_*
EOF

cat <<!
output mutiline test
blabla ...
!

# here doc里面允许有变量
 curl -iv -X POST -b ./cookie.txt -H 'Content-Type:application/json' \
    http://${uas_url}/uni_auth/v1/enterprise_users \
    --data @<(cat<<EOF
    {
      "account": "${account}",
      "mobilePhone": "",
      "orgCode": "${orgcode}",
      "idNum": "111111111111111",
    }
EOF
    )
```

### here strings
```sh

man bash
search here strings

# 等效于
echo "String" | command

# redirect a variabe to stdin of a command
LINE="7.6.5.4"
IFS=. read -a ARRAY <<< "$LINE"
echo "$IFS"
echo "${ARRAY[@]}"

注意，上面IFS仅仅在read那一行生效

while read -r line; do
    echo "... $line ..."
done <<< "$array"

```

