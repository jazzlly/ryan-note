
```sh
-- example
a='$b'  # 使用单引号防止$b被变量替换
b='$c'  
c=d

echo $a       -- $b
eval echo $a  -- $c
eval eval echo $a  -- d
```

```sh
set -xv
eval "`seq 1|sed -e 's/.*/var&=abcd&/'`"
eval "`seq 1|sed -e 's/.*/var&=foo&/'`"
seq 1|sed -e 's/.*/var&=foo&/'
++ seq 1
++ sed -e 's/.*/var&=foo&/'
+ eval var1=foo1
var1=foo1
++ var1=foo1

bash-3.2$ eval "`seq 1|sed -e 's/.*/export var&&=foo&&/'`"
```

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
eval可以用于代码生成


% lspage='ls | more'

# 变量展开后，没有执行最开始的token化(第一步)
# 所以看到的是一整条命令ls | more
% $lspage 
% eval $lspage



```

### debug eval
```sh
set -xv
cmd="ps aux"
proc="ps aux"
eval "$cmd"|grep $proc
```