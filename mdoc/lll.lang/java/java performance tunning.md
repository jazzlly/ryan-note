
### cpu high

```
通过top获取进程ID
top

获取线程cpu占用率
top -n 1 -b -H -p <pid>

然后将输出pid转化为16进制模式 pid-hex

jstack <pid> > jstack.info.txt

在jstack中搜索pid-hex



```