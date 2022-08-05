# scope
```sh

export
readonly
local
```

### readonly
```sh
readonly foo=bar

readonly xixi=haha
declare -p xixi
declare -r xixi="haha"

foo=xxx 
-bash: foo: readonly variable

unset foo
-bash: unset: foo: cannot unset: readonly variable
```

### dollar sign
```sh

# 按照键盘顺序记忆

$! 最后一个后台进程号, 可以wait

$$ 当前进程号

$? 命令结果

$0 程序名称，不包括任何参数

$PPID 父进程编号

$PS1 命令行主提示符
$PS2 命令行从提示符
$PS4 set -x时提示符

$- shell打开的所有选项

% echo $-
569XZilms
% set -x; echo $-
569XZilmsx

$(command)  执行命令
${val}   变量展开
${#var}  变量字符长度

```

### variable  null
```sh
jiangrui@jiangruideMacBook-Pro shell % echo -n '\t'|xxd
00000000: 09                                       .
jiangrui@jiangruideMacBook-Pro shell % echo -n '\n'|xxd
00000000: 0a                                       .
jiangrui@jiangruideMacBook-Pro shell % echo -n '\r'|xxd
00000000: 0d                                       .
jiangrui@jiangruideMacBook-Pro shell % echo -n ' '|xxd
00000000: 20

echo -n $IFS|xxd
00000000: 2009 0a00

```

###  variable: position paramter
```sh

"$*" 所有命令行参数看成单个字符串, 等同于 "$1 $2 ...", $IFS的一个字符用于分隔符
printf "The arguments are %s\n" "$*"

"$@" 所有命令行参数作为单独字符，等同于"$1" "$2" ...
将命令行参数传递给其他函数的最佳方式。能够保留参数内部的白字符
#######################################################
set -- 设置位置参数

% old=$IFS
% IFS=,
% set -- 1 '2 3' 4
% echo $# # 3
# $* $@没有添加双引号，没有区别
% echo $* # 1 2 3 4
% echo $@ # 1 2 3 4

# 循环1次
% for v in "$*";do echo $v;done
1,2 3,4

# 循环3次
% for v in "$@";do echo $v;done
1
2 3
4

# shitf去掉第一个位置参数
% shift
% echo $# # 2
% for v in "$@";do echo $v;done
2 3
4 

$# 脚本参数个数

# 打印所有参数
while [ $# != 0 ];
do
  echo $1
  shift
done

```

### variable expand
```sh
var=foo

# 如果var不存在显示bar
echo ${var:-bar} # foo
echo ${varr:-bar} # bar

# 如果位置参数1不存在, 则...
filename=${1:-/tmp/foo.txt}

# 如果var不存在，则设置var的值
echo ${var:=haha} # 还是foo
echo ${varr:=haha} # haha
unset varr

#如果varr不存在，输出message并退出, exit 1
${varr:?message}
${varr:?} # 默认输出 zsh: varr: parameter not set

# var存在且非null, 返回word。否则返回null
${var:+word}  # if var return word else return null




${count:+1}

# :是可选的，测试存在，并非null
# 去掉:后，仅仅测试是否存在

```

### variable replace
```sh
# 从前面去掉pattern, 最短匹配
${variable#pattern}
# 从前面去掉pattern, 最长匹配
${variable##pattern}

# 从后面去掉pattern, 最短匹配
${variable%pattern}
# 从后面去掉pattern, 最长匹配
${variable%%pattern}

# example
f=/Users/jiangrui/git/ryan/ryan-note/shell/foo.bar.txt
${f#/*/}
${f##/*/}
${f%.*}
${f%%.**}
```


### internal variables

```sh
export CDPATH=$CDPATH:/c/Users/think/git/pekall
cd server

# 下面两条命令等效
cd -
cd $OLDPWD

```