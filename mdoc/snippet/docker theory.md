
# snippet
```
# 查看进程树
pstree -C age -aAphn

```

# todo
- man namespaces
- namespace
https://blog.quarkslab.com/digging-into-linux-namespaces-part-1.html
https://blog.quarkslab.com/digging-into-linux-namespaces-part-2.html

 https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking#bonded_interface

https://www.cnblogs.com/bakari/p/10536369.html
https://www.cnblogs.com/bakari/p/10564347.html
https://www.cnblogs.com/bakari/p/10613710.html

https://ops.tips/blog/using-network-namespaces-and-bridge-to-isolate-servers/

- 网络虚拟化

https://www.cnblogs.com/bakari/p/8037105.html
https://blog.quarkslab.com/digging-into-linux-namespaces-part-1.html

https://www.cnblogs.com/bakari/p/8037105.html


# 基本概念

## 容器镜像
包括了/bin, /usr, /home等等文件系统的tarball文件


## chroot
修改当前进程（及其子进程）的根目录
```sh
sudo chroot ./rootfs /bin/bash
sudo chroot rootfs python -m SimpleHTTPServer

ps aux # 能够看到chroot外部的信息
```

chroot共享系统的环境变量，进程信息，网络信息等等

# namespace
>  命名空间定义了一个进程可以使用的一组资源。它为进程提供了自己的系统视图，从而将进程相互隔离。不同的namespace之间不会影响
>  一个进程和一个namespace一一对应
>  

## 查看namespace
```
echo $$
cd /proc/$$/ns

lrwxrwxrwx 1 root root 0 May 18 07:23 cgroup -> 'cgroup:[4026531835]'
lrwxrwxrwx 1 root root 0 May 18 07:23 ipc -> 'ipc:[4026532898]'
lrwxrwxrwx 1 root root 0 May 18 07:23 mnt -> 'mnt:[4026532896]'
lrwxrwxrwx 1 root root 0 May 18 07:23 net -> 'net:[4026531992]'
lrwxrwxrwx 1 root root 0 May 18 07:23 pid -> 'pid:[4026532899]'
lrwxrwxrwx 1 root root 0 May 18 07:23 pid_for_children -> 'pid:[4026532899]'
lrwxrwxrwx 1 root root 0 May 18 07:23 user -> 'user:[4026531837]'
lrwxrwxrwx 1 root root 0 May 18 07:23 uts -> 'uts:[4026532897]'
```

## 创建namespace
进程默认集成父进程的namespace。可以使用clone或unshare两种方式创建namespace。clone会在一个新的命名空间中生成一个新的进程。unshare将当前进程移动到新的命名空间(取消共享当前进程)

## 命名空间类型
USER namespace：系统用户ID的隔离；
UTS命名空间：主机名的隔离；
PID namespace：系统进程树的隔离；
MNT 命名空间：隔离主机文件系统挂载点；
NET 命名空间：隔离主机网络栈；
IPC 命名空间：用于进程间通信实用程序（共享段、信号量）的隔离；
CGROUP 命名空间：隔离主机的虚拟 cgroup 文件系统。

### PID namespace
> 内核维护着一个单一的进程树，反映在procfs文件系统中

```
# 使用独立的pid namespace创建进程
unshare --pid --fork /bin/bash  # 这时还能看到父namespace

# 重新挂在procfs
unshare --pid --fork --mount /bin/bash
mount -t proc proc /proc

# unshare中指定重新挂载procfs
unshare --fork --pid --mount-proc /bin/bash
```

## net namespace
```
ip netns add netns1

ls /var/run/netns
netns1

nsenter --net=/var/run/netns/netns1 /bin/bash

ip link add veth0 type veth peer name ceth0


```
```
# 创建namespace
unshare -p -f --mount-proc=$PWD/rootfs/proc \
    chroot rootfs /bin/bash

# 进入namespace
nsenter --pid=/proc/4652/ns/pid unshare -f --mount-proc=$PWD/rootfs/proc  chroot rootfs /bin/bash
```

## CGroups
- 资源的限制
	- cpu, memory, io, process numbers

# reference
https://www.cnblogs.com/bakari/p/8560437.html

https://medium.com/swlh/build-containers-from-scratch-in-go-part-1-namespaces-c07d2291038b

https://ericchiang.github.io/post/containers-from-scratch/

https://kevinboone.me/containerfromscratch.html?i=1

https://github.com/lizrice/containers-from-scratch


