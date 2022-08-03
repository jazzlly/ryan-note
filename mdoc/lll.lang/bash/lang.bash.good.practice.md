### strict bash
```sh
http://redsymbol.net/articles/unofficial-bash-strict-mode/

set -euxo pipefail

set -e
# 'foo' is a non-existing command, 遇到错误不退出范例
foo || true
# 'foo' is a non-existing command
foo  # 直接退出了

对于管道中命令错误，bash默认行为是看最右边命令的完成状态
添加-o pipefail后，只要有一条命令错误，这个pipe就会返回错误命令的状态
set -eo pipefail
# 'foo' is a non-existing command
foo | echo "a" # 退出

set -euo pipefail
echo $a # a是没有定义的变量, 退出
# line n: a: unbound variable
```
```

### trap
```sh

#!/usr/bin/env bash

trap "echo normal" EXIT
trap "echo haha; exit 123" HUP INT PIPE QUIT TERM

for i in `seq 1 10`
do
  echo $i
  sleep 1
done

```

### remove huge number of files
```sh
http://linuxnote.net/jianingy/en/linux/a-fast-way-to-remove-huge-number-of-files.html

% rsync -a –delete empty/ target_dir
```

![[rm_huge_num_files.png]]