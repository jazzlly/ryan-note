### return default if not set or null
```sh

# if var not set or null return default
# 下面两个表达式基本同义，: 表示仅仅声明了var, 但是var为空
# 一般使用后者？
${var-default}    # unset var后,为default
${var:-default}   # unset var或var=后，为default

echo ${username-`whoami`}

# 设置默认参数
filename=${1:-foo.txt}
```

### 
```sh
# if val set and not null, return alt_var
${var+alt_var}, ${var:+alt_var}

```

### set to default if not set or null
```sh

echo ${var:=abc}  # abc
echo ${var:=xyz}  # abc

```

### exit with error if not set
```sh
${var?err_msg}, ${var:?err_msg}

# 检查系统变量是否设置，允许为null
: ${HOSTNAME?} ${USER?} ${HOME?} ${MAIL?}

: ${haha:?}
```

### string length or var
```sh
${#var}  
${#array[*]} or ${#array[@]} # number of elements in array
${#*} or ${#@} # number of positional parameter
$# 位置参数个数
```


### delete from front
```sh
${var#pattern}   # remove the shortest part of pattern
${var##pattern}  # remove the longest part of pattern
```

### delete from end
```sh
${var%pattern}
${var%%pattern}
```

### position and length
```sh
${var:pos}   # substring starting from pos, zero based
${var:pos:len}
```

### replace
```sh
${var/pattern/replacement}   # replace first match
${var//pattern/replacement}  # replace all match

```