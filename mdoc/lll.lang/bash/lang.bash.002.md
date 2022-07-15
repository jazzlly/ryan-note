### sort
```sh
sort -u -n -r

# 对使用:分隔的第三列进行数字排序
cat /etc/passwd|sort -n -t : -k 3

# 排序字段可以通过[b,e]方式指定
cat /etc/passwd|sort -n -t : -k 3,3

sort -n -t : -k 3,3 /etc/passwd

# 对多个字段排序
sort -t : -k 3n -k 4n /etc/passwd

# 对第三列使用数字逆序排序
grep -v '^#' /etc/passwd|sort -n -t : -k 3nr,3

```

### uniq
```sh
-c # count
-d # 仅显示重复记录
-u # 显示未重复的记录
```

### fmt
```sh
### 设置行宽为100个字符
cat /usr/share/dict/words|fmt -w 100
```


### strings
```sh
# 查看二进制文件的文本信息

strings kaf-logs/kafka-logs/police_sync_org-0/00000000000000000000.log
```