### gramma

```
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
```
# 打印第一列和最后一列, 列数， 行数
awk -F: '{print $1, $NF, NF, NR, FS}' foo.txt

awk -F: '{print $1, $N}'   

awk '{print $1, NR}'

awk 'NF > 2' foo.txt
```

### delimiter
```
# 默认使用空格作为分隔符。通过-v和变量OFS设置输出分隔符
awk -F: -v 'OFS=|' '{print $1, $NF, OFS}' foo.txt
```

### printf
```
grep -v '^#' /etc/passwd| awk -F: '{printf "User %s is really %s\n", $1, $5}'
```