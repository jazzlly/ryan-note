
```sh
# 对于替换命令，s后的第一个字符为分隔符
# 好的实践: 替换命令最好使用逗号作为分隔符
"s,xix,https://localhost:2103.*$,g"

# 匹配规则
longest leftmost

# 创建./mdoc目录的备份目录
find ./mdoc -type d -print|sed 's;/mdoc;/mdoc.bak;'|sed 's/^/mkdir /'|bash -x

# 一行中多个命令
sed -i 's/foo/fuu/g; s/bar/baa/g' foo.txt

# 工作模式
# 每次读入一行，存在在模式空间中。然后对模式空间应用所有编辑命令。接着将模式空间内容打印
# 到标准输出。再回到开头将下一行读入到模式空间

```

```sh
# 找到某行后面的一段文字进行替换
sed -i "/uniSystitle/{n;s|links|haha|g}" afile.txt

# 找到某行后两行的文字进行替换
sed -i "/uniSystitle/{n;{n;s|links|haha|g}}" afile.txt
```