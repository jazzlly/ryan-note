### vpn
1.202.74.178


### cu225 guganyun
 emmjava / Wocloud.cn@234

### cu225 9.11 test
平台门户：                 https://bj.police.everknow.cn:4442  
移动设备管理平台：    https://bj.police.everknow.cn:4455  
统一认证授权平台：    https://bj.police.everknow.cn:4443  
应用管理平台：           https://bj.police.everknow.cn:4449  
运营管理平台:             https://bj.police.everknow.cn:4450  
运维管理平台：           https://bj.police.everknow.cn:4451  
基础应用平台：           https://bj.police.everknow.cn:4447  
门户账号：                  upadmin/pekall12#$

test web:
http://192.168.9.11:8123/?#/member/tenant

### cu225 production info

1.登录192.168.9.6的远程桌面（windows）  Administrator  /  2002Nddycx@
2.连接VPN  VPN名称：阿斯顿发射点
3.登录堡垒机，[https://172.16.4.242:64433/](https://172.16.4.242:64433/)      用户名密码：KeXin-luhl   /   Wocloud.cn@123  ，登录后选择运维--》主机运维 ，就可以看到虚拟机列表
4.登录虚拟机，选择172.16.5.43   主机账号模式选择  [SYSDEF][EMPTY] ,再点击右侧登录，登录账号密码：  emmjava  /  P@ssw0rd2021
5.通过172.16.5.43  emmjava账号可以免密登录172.16.5.35/36/39/40/41/42。

登录到数据节点联通运维 osman/Admin@4478

### 阿里云
jianyong.tian@pekall.com / pekall6284


### 铁路公安信息 railway
- http://192.168.11.34/index.php?m=doc&f=view&docID=1376

### 云南集中管控 yunnan cmc
ssh -p 8022 root@20.30.2.11

10.166.2.27   ssh：8022     root/hzih2018root 
https://10.166.2.27:4434   uasadmin / pekall12#$
https://10.166.2.27:44135  test / 123qwe!@#

### 甘肃 gansu
甘肃二区热点
ssh  root@20.115.11.152  -p 20029
1.连接上热点，可以直接ssh登陆二区服务器；

二区
zabbix_proxy 20.30.4.251
2. ssh  20.30.2.11  8022  可以登陆上三类服务器95.1.12.240，可以跳转其他三区服务器；
3. 服务器密码：root  /  pekall12#$
三区服务器
uas              95.1.12.240
mdm            95.1.12.241
unilog           95.1.12.242
集中管控      95.1.12.243
安全管控      95.1.12.244  

# 甘肃三区
ssh -p 8022 root@20.30.2.11
登录uas之后
95.1.12.241       mdm，
95.1.12.243      集中管控
甘肃web: 
[https://20.30.2.11:4432](https://20.30.2.11:4432/)
[https://20.30.2.11:44135](https://20.30.2.11:44135/)

###  neimeng 内蒙三区mdm

ssh root@20.30.2.11 -p 8022
ssh 26.3.15.99 -p 20029

### gab 公安部部平台mdm
ssh root@20.30.2.11 -p 8022
# 进入JJJ
ssh 10.2.120.157 -p 8022

# 进公安部uas

ssh 10.2.120.214 -p 10003

# 进公安部mdm

ssh 192.168.100.98