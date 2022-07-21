### trap
```sh

---------------------------
打印所有信号

trap -l

----------------------------
退出时删除文件
----------------------------
tempfile=/tmp/tmpdata
trap "rm -f $tempfile;echo haha" EXIT
sleep 1
echo I am done!

----------------------------
可以调用函数
cleanup() {
echo clean up ...
}
trap cleanup EXIT

---------------------------
不能trap 9

---------------------------

```

### loop
```sh
ctrlc_count=0
function no_ctrlc()
{
    let ctrlc_count++
    echo
    if [[ $ctrlc_count == 1 ]]; then
        echo "Stop that."
    elif [[ $ctrlc_count == 2 ]]; then
        echo "Once more and I quit."
    else
        echo "That's it.  I quit."
        exit
    fi
}

trap no_ctrlc INT

while true
do
  echo looping ....
  sleep 3
done
```

### disable interrupt
```sh

-----------------------------
关中断， Run something important, no Ctrl-C allowed.

trap "" SIGINT
important_command

-----------------------------
开中断，Less important stuff from here on out, Ctrl-C allowed.

trap - SIGINT
not_so_important_command
```


###
父shell trap的信号对于子shell无效
```sh
# 父shell

nopens=0
function show_opens()
{
    echo "Seen $nopens sudo session opens"
}

-----------------------------------------------------------------
The original bash process has now executed one sub-process
for "journalctl" and another sub-process for "while read line ..."
-----------------------------------------------------------------
# 子shell1    |  子shell2
journalctl -f | while read line
do
    if [[ -z "$trap_set" ]]; then
        trap_set=1
        echo "Trap set in $BASHPID"
        trap show_opens USR1
    fi
    if [[ $line =~ session.*opened ]]; then
        let nopens++
    fi
done

kill -SIGUSR1 1002
```

### pipe broken
```sh
[root@uas ~]# cat ./loop.sh
#!/usr/bin/env bash

# trap "touch pipe.broken;exit" PIPE

while true
do
  echo looping ....
  sleep 1
done

[root@uas ~]# cat loop-reader.sh
#!/usr/bin/env bash

for i in $(seq 1 5)
do
  read line
  echo got line: $line
done

echo reader exit!

[root@uas ~]# ./loop.sh | ./loop-reader.sh
got line: looping ....
got line: looping ....
got line: looping ....
got line: looping ....
got line: looping ....
reader exit!

[root@uas ~]# echo ${PIPESTATUS[@]}
141 0

```

### pipe broken2
```bash
# 1-100000是多次写入标准输出的
$ seq 1 100000 | head -1
1
$ echo ${PIPESTATUS[@]}
141 0

# 1-10是一次写入标准输出的
$ seq 1 10 | head -1
1
$ echo ${PIPESTATUS[@]}
0 0
```


### 参考
https://www.linuxjournal.com/content/bash-trap-command
