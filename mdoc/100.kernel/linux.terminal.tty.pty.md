### definition

- 终端，tele typewriter(tty), 一般表示一个键盘和显示器的组合
- linux里面同义词为console, virutal console
- linux下可通过ctrl-alt-f1|f2|... 切换不同的控制台下
- /dev/tty tty0, tty1, ...表示这些设备
- 程序可以读写tty设备，并可以通过ioctl修改设备参数
- linux每个进程有个控制终端(control terminal)的属性, 值为设备文件


### read/write tty device

```sh
--------------------------------
osx控制台1

jiangrui@bogon ~ % ps
  PID TTY           TIME CMD
10892 ttys000    0:00.01 -zsh
jiangrui@bogon ~ % echo 'haha'
haha
jiangrui@bogon ~ % echo 'haha' > /dev/ttys000
haha

--------------------------------
osx控制台2

jiangrui@bogon ~ % ps
  PID TTY           TIME CMD
10892 ttys000    0:00.02 -zsh
10903 ttys001    0:00.01 -zsh
jiangrui@bogon ~ % echo xixi > /dev/ttys001
xixi
jiangrui@bogon ~ % echo xixi > /dev/ttys000
jiangrui@bogon ~ % read /dev/ttys000
haha
```

### reference
理解 Linux 终端、终端模拟器和伪终端


https://github.com/mz1999/blog
https://xie.infoq.cn/article/a6153354865c225bdce5bd55e