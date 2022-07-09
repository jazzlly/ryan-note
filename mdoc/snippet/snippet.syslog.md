
```
yum install rsyslog

man logger

```
# write syslog by command line

```
 logger --id --server 192.168.10.215 --tcp --port 514 -p user.inf
o -t pekall.snmp.hosts System rebooted for hard disk upgrade
```