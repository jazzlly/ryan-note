### todo: shell脚本学习指南 awk章节

### gramma

```sh
awk 'program' [file ...]
	program:
		pattern {action}
		pattern {action}
			pattern: /ERE 
			action: awk 语句, print
			pattern和action可以省略一个
```

awk读入一行，并将其分割为多个字段。并将字段数保存到变量NF中

### variables
- FS: 分隔符
- NF: 列数, number of field
- NR: 行号, number of row
- $0: 整条记录, $1, $2, 第n列

### exmaple
```sh

# 过滤掉注释行
awk '!/^#/ {print $1, $5}' /etc/passwd

# 打印第一列和最后一列, 列数， 行数
awk -F: '{print $1, $NF, NF, NR, FS}' foo.txt

awk -F: '{print $1, $N}'   

awk '{print $1, NR}'

awk 'NF > 2' foo.txt
```

### delimiter
```sh
# 默认使用空格作为分隔符。通过-v和变量OFS设置输出分隔符
awk -F: -v 'OFS=|' '{print $1, $NF, OFS}' foo.txt
```

### printf
```sh
grep -v '^#' /etc/passwd| awk -F: '{printf "User %s is really %s\n", $1, $5}'
```

### begin and end
```sh
BEGIN { start code }
pattern1 { action1 }
pattern2 { action2 }
END { clean code}

awk 'BEGIN {FS=":"; OFS=";"} {print $1, $5}' /etc/passwd

```


### progress
```sh
find . -type f | \
awk 'BEGIN {T=0} (T!=systime()) { printf "%s %s\n",NR,$0 ; T=systime()} END { print NR}'
```