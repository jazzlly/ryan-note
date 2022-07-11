### intro

 ### option vs argument
 
```shell
-o 是option。 foo, foo.c是参数
cc -o foo foo.c  

没有参数的option可以合并。下面两条命令等效
ls -lt foo.c
ls -l -l foo.c

长选项前面添加两个减号
patch --verbose --backup -p1 < /tmp/foo.patch


```

### command type
1. 内建命令。可能是一个可执行文件
```
type cd
cd is a shell builtin

type type

```
2. Shell函数

3. 外部命令。即为外部脚本, 会在新fork的进程中执行
```
父shell fork出子shell进程, 在子shell中执行新的程序
父shell等待子shell进程结束
```

### variable
```bash

值中包含空格，使用引号
fullname='ryan jiang'
info="$fullname haha!"
	
```

### printf
```bash
printf format-string [arguments ...]
printf 'hello world %d %s hahaha\n' 123 foo
```

### io
标准输入，标准输出，标准错误
默认设置成了终端

### locale
```bash
LANG 未设置任何LC_xxx变量使用的默认值
LC_ALL 覆盖其他所有的LC_xxx变量
LC_COLLATE 排序规则
LC_CTYPE 字符集 字母，数字，标点符号
LC_MESSAGE 响应和消息
LC_MONETRAY 货币格式
LC_NUMERTRIC 数字格式
LC_TIME 日期与时间格式

# 显示locale, locale C表示ASCII模式
locale
LANG=""
LC_COLLATE="C"
LC_CTYPE="UTF-8"
LC_MESSAGES="C"
LC_MONETARY="C"
LC_NUMERIC="C"
LC_TIME="C"
LC_ALL=

# 查询locale细节
LC_ALL=zh_CN.UTF-8 locale -ck LC_TIME

```


# sed
```
# 匹配规则
longest leftmost

# 创建./mdoc目录的备份目录
find ./mdoc -type d -print|sed 's;/mdoc;/mdoc.bak;'|sed 's/^/mkdir /'|bash -x

# 一行中多个命令
sed -i 's/foo/fuu/g; s/bar/baa/g' foo.txt

```

工作模式
每次读入一行，存在在模式空间中。然后对模式空间应用所有编辑命令。接着将模式空间内容打印到标准输出。再回到开头将下一行读入到模式空间

# cut
```
cut -d : -f 1,5 /etc/password # 等于下面
awk -F : '{print $1, $2, $3, $4, $5}' /etc/password

```

	