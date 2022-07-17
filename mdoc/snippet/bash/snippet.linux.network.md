# route (linux作为路由器的路由表)
```
[root@host2 ~]# route -n  
Kernel IP routing table  
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface  
0.0.0.0         192.168.1.25    0.0.0.0         UG    0      0        0 eth0
192.168.1.24    0.0.0.0         255.255.255.252 U     0      0        0 eth0  
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1  
192.168.25.0    0.0.0.0         255.255.255.0   U     0      0        0 eth2  
```

Linux host acting as a router that connects to three networks
- one of which leads to the Internet. 
- The local class C networks, 192.168.0.0/24 on interface eth1, 192.168.25.0/24 on eth2, 
- each have entries in the table, as well as the default route that leads to the rest of the world on eth0.

- Note that there is still only one default gateway, and that is on interface eth0. 
- However, in addition to the default route entry that points directly to the LAN side IP address of the router, there is also an entry for the 192.168.1.24/30 network as a whole. 
- That network only contains two usable IP addresses, one, 192.168.1.25/30, for the router LAN side and one, 192.168.1.26/30 for the host itself.

### too many open files

```bash

# 查看系统全局的最大文件数
cat /proc/sys/fs/file-max

# 当前用户的连接数配置
ulimit -a
ulimit -n

# 查看系统连接数
lsof|wc -l
lsof -p pid|wc -l


cat /proc/sys/net/ipv4/ip_local_port_range

# 增加系统全局连接数
cat /etc/security/limits.conf
* hard nofile 1048576
* soft nofile 1048576
* soft nproc 31193
* hard nproc 31193
emmjava hard nofile 1048576
emmjava soft nofile 1048576

sysctl -p

# 查看某个进程的最大连接数
cat /proc/3724/limits | grep "Max open files”

# 修改进程的连接数限制
echo -n "Max open files=60000:60000" > /proc/23052/limits

# centos7 
Another option is [`prlimit`](http://karelzak.blogspot.com/2012/01/prlimit1.html) command, introduced with `util-linux 2.21` allows you to read and change the limits of running processes.
```