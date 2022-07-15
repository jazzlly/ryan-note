
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