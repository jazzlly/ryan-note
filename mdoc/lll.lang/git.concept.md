# Git概念

## 分支跟踪概念

远程分支和本地分支的对应关系保存在 下面文件中

-  .git/config

```
# 远程仓库信息
[remote "origin"]
        url = git@192.168.10.211:mdm_dev_ops/new_police_deploy.git
        fetch = +refs/heads/*:refs/remotes/origin/*

# 本地master分支，在clone时就建立好了远程跟踪关系
[branch "master"]
        remote = origin
        merge = refs/heads/master
		
# 本地分支 dev1.5
[branch "dev1.5"]
        remote = origin             # 对应远程仓库
		merge = refs/heads/dev1.5   # 对应远程跟踪分支
```
