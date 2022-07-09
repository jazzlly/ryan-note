
#### concept

工作区 -> 暂存区 (stage) -> 本地仓库

### case sensitive win10
```
fsutil.exe file SetCaseSensitiveInfo "C:\Users\Juan\Desktop" enable
```

#### 推送到远程指定分支
```bash
git push --set-upstream origin mybranch
```

###  不忽略文件系统大小写
```
git config --global core.ignorecase false
```

#### git信息查询

cat .git/config

git ls-remote

git ls-remote origin | hljsync

#### git status

```

# short description
git status -s

```


### git win execution perm
```
git update-index --chmod +x ./auth_system_admins.sh
```