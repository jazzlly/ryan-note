### help
```sh
man

help test
help read

LC_ALL=C type read

获取posix标注配置
% getconf -a
% getconf ARG_MAX

```

### variable 
[[lang.bash.variables]]

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

### ls
```sh
# 查看所有目录
ls -d */
ls -d /home/emmjava/$p/app_services/*/

-1 : -one 强制单栏输出
-R : 递归显示目录，文件
-S : 按照大到小顺序排列
-t : 按照最后修改时间排序

```



### printf
```bash
printf format-string [arguments ...]
% printf 'hello world %d %s hahaha\n' 123 foo

# 宽度控制
flags width.precision format-specifier
% printf '|%20s|\n' hello  # hello在右边
% printf '|%-20s|\n' hello # hello在左边
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

### awk

[[lang.bash.awk]]

###  sed
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

###  cut
```
cut -d : -f 1,5 /etc/password # 等于下面
awk -F : '{print $1, $2, $3, $4, $5}' /etc/password

```

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


### env
```sh
# 打印当前环境变量
env

# 使用var环境变量调用command, 忽略其他继承的环境变量
env -i var=value command arguments

# unset var
env -u var

```

### 算术运算
```sh
$((1+2))

i=5
echo $((i++)) $i  # 5 6
echo $((++i)) $i  # 7 7

echo $((i+=2)) $i # 9 9

```


### exit
```sh
# 正常退出 0
% ls 
% echo $? # 0

% ls haha
ls: haha: No such file or directory
% echo $? # 1

# 在脚本中退出, 使用最后一条命令的退出状态
exit $?

```

### if
```sh

# if里面的命令执行结果不会影响set -e, 不论foo.bar.txt不存在
# 或是xxx不在文件中，都不会退出脚本执行
# 如果文件不存在，会在2有输出
if grep -q xxx ./foo.bar.txt ;then
  echo xxx found!
else
  echo xxx not found!
fi

if ! grep -q xxx ./foo.bar.txt ;then
  :  # do nothing
else
  echo xxx found!
fi

逻辑操作 &&, ||

some_command && {
	command1
	command2
	command3
}

if some_command 
then 
	command1
	command2
	command3
fi
```

### test
```sh
if test "$s1" = "$s2"; then
fi

# 同义语法
if [ "$s1" = "$s2" ];then
fi

逻辑判断使用 -a -o 
if [ -f 'file1.txt' -a -f 'file2.txt'] # 计算两个条件
if [ -f 'file1.txt' ] && [ -f 'file2.txt'] # 如果第一个条件为false, 不会执行第二个条件语句

# 推荐写法
if [ -f 'f1' ] && ! [ -w 'f1' ] # 文件存在，且不可写

```

### case
```sh

case $1 in
foo)
  echo foo
  ;;
bar | baa)
  echo ba*
  ;;
*)
  echo xixi
  ;;
esac

```

### while
```sh

# 初始化变量
file= verbose= quiet=

while [ $# -gt 0 ]
do
  case $1 in
  -v) verbose=true
    ;;
  -q) quiet=true
    ;;
  -f) file=$2
    shift
    ;;
  --) shift # --结束选项
    break
    ;;
  -*) echo $0: $1 error >&2
    ;;
  *) break
    ;;
  esac

  shift
done

# 选项最开头的: 表示错误处理的方式
# 1 将选项变成问号，
# 2 将错误的选项放到$OPTARG中
while getopts :f:vq opt
do
  case $opt in
  v) verbose=true
    ;;
  q) quiet=true
    ;;
  f) file=$OPTARG
    ;;
  ?) echo $0: error param: $OPTARG
  exit 1
  ;;
  esac
done
shift $((OPTIND-1)) # 删除选项，留下参数

```

### function
```sh

# return和exit的行为一直
equal() {
  if [ "$1" = "$2" ];then
    return 0
  else
    return 1
  fi
}

if equal 1 2 ;then
  echo haha
else
  echo xixi
fi
```

### read, io redirection, pipe
```sh

# 从文件输入
while IFS=: read user pass uid gid fullname home shell
do
    echo user $user has home $home
done < /etc/passwd

# 从管道输入
grep -v '^#' /etc/passwd |
while IFS=: read user pass uid gid fullname home shell
do
    echo user $user has home $home
done

sudo du -s * 2>&1|grep -v 'Operation not permitted'|sort -nr|sed 5q|
	while read amount name;
	do 
		echo << EOF
		haha
		xixi
		$amount, $name
EOF
	done

# 将for的结果输出到less
for f in $(cd olddir; echo *.c)
do
	diff olddir/$f $f
done | less
```

### pipe
```sh
管道命令在自己的子shell进程中执行

将command1的标准输出作为command2的标准输入
% commad1 | command2

cmd1的标准输出，标准错误作为cmd2的标准输入
% cmd1 2>&1 | cmd2

2>&1 | 的简写
% cmd1 |& cmd2

查看pipe每条命令的执行结果
% echo ${PIPESTATUS[@]}

------------------------------------
broken pipe: 返回值141
$ seq 1 10000 | head -1
1

$ echo ${PIPESTATUS[@]}
141 0
-----------------------------------
grep -q 第一次匹配成功后，就会会立即退出。netstat还是会继续向pipe中输出信息，这样就会导致netstat收到broken pipe的signal, 最后netstat返回141

if netstat -anp|grep -q '9210.*LISTEN.*java';then
  echo ${PIPESTATUS[@]} # 141 0
  return 0
else
  return 1
fi

好的方式是

if netstat -anp|grep '9210.*LISTEN.*java' > /dev/null 2>&1;then
  echo ${PIPESTATUS[@]} # 141 0
  return 0
else
  return 1
fi

process substitution
% grep -q '9210.*LISTEN.*java' <(netstat -anp)
```

### process substitution
```sh

https://tldp.org/LDP/abs/html/process-sub.html
可以将进程的输入和输出变成一个文件名
<(command) # command的输出变成了一个文件 /dev/fd/63
>(command) # command的输入变成了一个文件

% echo >(true)
% touch /tmp/foo; echo /tmp/foo;  true < /tmp/foo; rm /tmp/foo

% echo <(true)
% touch /tmp/foo; true > /tmp/foo; echo /tmp/foo;rm /tmp/foo

[root@uas ~]# ls
test_all.sh  tmp_poca.sh  two_node_rel_p2.sh
echo后面如果是文件名，就会输出文件名
[root@uas ~]# echo ./tmp_poca.sh
./tmp_poca.sh
[root@uas ~]# echo <(date)
/dev/fd/63


[root@uas ~]# wc <(cat /usr/share/dict/linux.words)
 479828  479828 4953680 /dev/fd/63
[root@uas ~]# wc /usr/share/dict/linux.words
 479828  479828 4953680 /usr/share/dict/linux.words

使用两条命令作为输入
comm <(ls -l) <(ls -al)

diff <(ls $first_directory) <(ls $second_directory)

sort -k 9 <(ls -l /bin) <(ls -l /usr/bin) <(ls -l /usr/X11R6/bin)


# Calculate 2+ checksums while also writing the file
wget -O - http://example.com/dvd.iso | tee >(sha1sum > dvd.sha1) >(md5sum > dvd.md5) > dvd.iso

# Accept input from two 'sort' processes at the same time
comm -12 <(sort file1) <(sort file2)

read -a list < <( od -d -w24 /dev/urandom )

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
    )'



```
### here document
[[lang.bash.heredoc]]
```sh

# 将EOF引用后，就不会替换here document中的变量
i=5
cat<<'E'OF
This is the value of i: $i
EOF

```

### file descriptor
```sh

make 1>result 2>err

# &1表示1的地址, 指向result文件
# 1->result
# 2->1->result
make >result 2>&1

# &1标识1的地址，还是终端
# 2->1->terminaln
# 1->result
make 2>&1 >result

# 2->1->pipe
make 2>&1 | ...

```

### exec
```sh

exec 2>/tmp/$$.log



```

### terminal

```sh

# 重定向标准错误, 在osx有效，linux中无效
% exec 2>/tmp/$$.err
% ls file_not_exist  # 错误信息会输出到/tmp/$$.err中

% ps
PID TTY           TIME CMD
690 ttys001    0:00.14 -zsh

# 将标准错误重置
% exec 2>/dev/ttys001
% ls file_not_exist

```


### expansion,  tilde wildcard globbing 
```sh
% vim ~/.profile
% cd ~emmjava  # 进入emmjava的home目录

% read user
% cd ~${user}  # 进入user的家目录

% ~+  # PWD展开

? 单个字符
[a-z] 小写字母
[!a-z] 非小写字母

```

```command substitution
# 反引号， 重音符号
$(command)
```

### eval ; command exec sequence
```sh
执行顺序
- 通过token分隔语句，token包括; | 等等。
- 检查是否是复合语句，如果是，展开命令
- 别名替换
- 波浪号替换
- 变量替换
- 命令替换
- 算术表达式替换
- 从变量，命令，算术替换中获取结果，使用IFS进行分隔
- 通配符展开，?*[] 文件名生成
- 使用第一个单词作为第一个命令，查找path中第一个文件
- 完成IO重定向，执行命令

eval可将脚本再按照循序执行一遍

% lspage='ls | more'

# 变量展开后，没有执行最开始的token化(第一步)
# 所以看到的是一整条命令ls | more
% $lspage 
% eval $lspage

```


### subshell ; code block
```sh

# subshell在另外进程执行。不会影响当前目录和变量
tar -cf - . | (cd /tmp; tar -xpf -)
tar cvfz - ryan-note | (cd ~ryan; tar xvfz -)

# subshell接受IO重定向。subshell退出不影响当前shell
echo "ryan" | (read name; echo hello ${name};exit)

# 代码块还是在当前进程执行，会受到当前目录的影响和变量
# 必须在newline, 分号，关键字之后
cd /tmp && {
  echo $PWD
  echo haha
}

# 代码块接受IO重定向
echo "ryan" | {read name; echo hello ${name}!}


```

### command sequence
```sh
1. 特殊build-in命令
2. shell函数
3. 一般build-in命令
4. $PATH中包括的命令
```

### wait
```sh
% sleep 60&
[1] 7695
% wait 7695


```

### set
```sh

% set   # 显示所有变量的值

```

### basename
```sh
提取路径中的文件名

% basename /Users/jiangrui/git/ryan/ryan-note/README.md
README.md

% basename /Users/jiangrui/git/ryan/ryan-note/README.md .md
README

% dirname /Users/jiangrui/git/ryan/ryan-note/README.md
/Users/jiangrui/git/ryan/ryan-note

```

### file
```sh
# 查找top 10空间占用目录
% du -s -k /home/emmjava/* | sort -k1nr|head -n 10


```

### random
```sh
% /dev/random 提供高质量的随机数， 会block
% /dev/urandom 随机程度不高，不会block

```

### trap
[[lang.bash.trap]]

### process
```sh
------------------------
好用的系统命令
w, 
iostat, netstat, nfsstat, sar, uptime, vmstat, w, xcpustat, xload, xperfmon

ps aux
ps axjf

```

### top: feEm
常用命令行选项
f: field 管理, 上下键选择列，s设置排序，d设置是否显示
m: 切换头部内存显示模式，数字，百分比进度条
e: 切换详细数据中内存列的单位
E: 切换内存显示单位, MB, GB, ...
z: 切换彩色显示
b: 切换高亮显示

W: 将当前的命令键盘命令保存到配置文件中，下次启动自动开启

### find



### good practice
[[lang.bash.good.practice]]