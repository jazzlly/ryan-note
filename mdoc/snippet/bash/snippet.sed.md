
### 去掉空行 remove empty line

```sh

sed '/^\s*$/d'

```
### 多行处理

```sh

# 找到某行后面的一段文字进行替换
sed -i "/uniSystitle/{n;s|links|haha|g}" afile.txt

# 找到某行后两行的文字进行替换
sed -i "/uniSystitle/{n;{n;s|links|haha|g}}" afile.txt    

```