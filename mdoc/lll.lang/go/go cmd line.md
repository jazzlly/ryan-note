# go 命令行

- 运行测试
```bash
go test -v pekall.com/tinyrpc/demo -run TestJson
```

- 编译文件
`go build hello.go`

- 编译，链接，运行源文件
`go run helloword.go`

- 查看环境
`go env`


- 使用七牛云代理
`go env -w GOPROXY=https://goproxy.cn`
go env -w GOPROXY=https://goproxy.io,direct

- go get proxy
```bash

export http_proxy=socks5://127.0.0.1:10808
export https_proxy=socks5://127.0.0.1:10808

go get -v -u github.com/gin-gonic/gin github.com/jinzhu/gorm
go get -v -u github.com/go-sql-driver/mysql

go get -v -u gorm.io/gorm  
go get -v -u gorm.io/driver/sqlite

fixme:
使用proxy会导致本地启动的开发服务无法访问，需要
unset http_proxy
unset https_proxy

git config --global http.sslVerify "false"
```


## 模块
- 没有模块时，go的依赖文件和源文件都下载到GOPATH或GOROOT中
	- 对于学习的单元测试，可以使用这种方式
- 对于Go项目，需要使用模块

在 Go 1.13 下， GO111MODULE 的默认行为 (auto) 语义变了。
-   当存在 go.mod 文件时或处于 GOPATH 外， 其行为均会等同于 GO111MODULE=on。相当于 Go 1.13 下你可以将所有的代码仓库均不存储在 GOPATH 下。
-   当项目目录处于 GOPATH 内，且没有 go.mod 文件存在时其行为会等同于 GO111MODULE=off。

1. 可以将测试项目放在gopath内
2. 将生产环境项目放在gopath外

```bash
# in .bashrc
export GOPATH=/c/Users/think/go
```

`go env -w GO111MODULE=auto`

#### 使用本地模块

```bash
go mod edit -replace ryan.com/greetings=../greetings
go mod tidy
```

# vscode
- 快捷键
```
ctrl-shift-.: focus breadcrumbs
ctrl-t : 全局符号跳转
alt/ctrl/shift-f12: peek document

ctrl-shift-\: 括号跳转

ctrl-shift-m: 显示错误
f8/shift-f8: go to next/prev error

```
- 单元测试无法输出fmt print
在全局配置文件settings.json中添加:
```
"go.testTimeout": "90s"
"go.testFlags": ["-v", "non-cacheable"]
```

```
https://pkg.go.dev/cmd/go#hdr-Testing_flags

go test -v
-v
    Verbose output: log all tests as they are run. Also print all
    text from Log and Logf calls even if the test succeeds.
```

- 运行单元测试快捷键
`go.test.cursor`


### 单元测试

```
常用断言
Fail: 测试失败，测试继续
FailNow: 测试失败，测试中断
SkipNow: 跳过测试，测试中断
Log:
Error: Log+Fail
Fatal: Log+FailNow
```


### lint工具
```
# 检查程序是否处理了err
go install github.com/kisielk/errcheck@latest
errcheck .

# ignore some package
errcheck -ignore ./Test

```
```

