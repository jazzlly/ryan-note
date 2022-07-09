	# 2022.1.10 周计划

存在问题

- [ ] 服务器团队制度建设
    - [ ] 沟通机制
	
- [ ] 提交一下push服务的改动
- [ ] 运营，运维管理员双因素认证改动

[[2022.01.11 unicom 225 upgrading | 联通升级]]

## 1.10
- [x] 内蒙古push问题
- [x] 徐志泽看看countQuery问题
- [x] 立东service code和app对应问题
- [x] 找一下概要设计文档

## 1.11
- [x] 联通漏洞问题修复
- [x] redis数据迁移调研

- [ ] 内蒙古push问题
	- [x] 设计思路： 通过redis队列
		- [x] 每个pushclient一个队列， 队列名称为 client.server.queue: ${client服务ip或域名}
		- [x] 队列中保存设备的id
		- [x] pushclient启动时，删除该队列
		- [x] push server发送消息时，向该队列保存信息
		- [x] pushclient监听该队列，消息信息

- [ ] 张乐说的问题
- [x] vmware one access演示指南文档

- [ ] mdm的沙箱，我看web代码，以前好像是要授权一个funcCode为5的功能才能显示
- [ ] 9.11/root/123 uas无法部署

## 1.12
- [x] 必须解决的bug
- [x] 内蒙古push问题线上测试
- [ ] 联通分支合并

## 1.13
- [x] 标准版bug fix
- [x] 内蒙古线上bug fix
- [ ] 联通生产环境问题支持







