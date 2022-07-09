# bash snippet


### for loop
```bash
echo {1..10}
for i in {1..10};do echo i;done
```

### sudo成另外用户执行命令
```bash
# heredoc
whoami
sudo -i -u emmjava bash << EOF
# ./user_install_ext.sh nginx
echo "In"
whoami
EOF
echo "Out"
whoami
```

### sudo保存环境变量
```bash
export PEKALL_HOME=/apps/pekall
sudo -E bash -c "echo $PEKALL_HOME"
```

### 获取字符串长度 string len
```bash
echo ${#myvar}
```

### 按照索引截取字符串 string index
```bash
# 返回前10个字符
echo ${myvar:0:10}
```

### 删除所有白字符 delete white space
```bash
tr -d '[:space:]'

cat file.txt | tr ' \n\t' '#$|'

tr -t '\r\n' '$'
```

### 显示白字符 white space
```bash
# SP  ' '  0x20 = · U+00B7 Middle Dot
# TAB '\t' 0x09 = ￫ U+FFEB Halfwidth Rightwards Arrow
# CR  '\r' 0x0D = § U+00A7 Section Sign (⏎ U+23CE also works fine)
# LF  '\n' 0x0A = ¶ U+00B6 Pilcrow Sign (was "Paragraph Sign")
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"
```

### IFS
```bash
printf %s "$IFS"|od -c
printf "%q\n" "$IFS"
```

### 检查是否是root
```bash
if [ $EUID -ne 0 ];then
    echo "Please use root to execute the script!"
    exit 1
fi

id -u
whoami
```

### mysql ignore error
```bash
MYSQL_PWD=xxxxxxxx mysql -u root -e "statement"
```
