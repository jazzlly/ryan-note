#!/usr/bin/env bash

output_args() {
  for arg
  do
    echo "[$arg]"
  done
}

IFS=:
var=':a::b:::c::::'
output_args $var

exit

xyz() {
  echo func name: $FUNCNAME
}

xyz

exit 0

set -e
set -o pipefail
ls -l ./xfoo.sh|cat|wc -l


echo done
exit
envvar=$1

dirpath=`eval echo '${'$1'}'`

echo $dirpath


exit
# set -ex
i=5
cat<<'E'OF
This is the value of i: $i
EOF

exit

sudo du -s * 2>&1|grep -v 'Operation not permitted'|sort -nr|sed 5q|
while read amount name
	do 
		cat << EOF
		haha
		xixi
		$amount, $name
EOF
	done

exit

while IFS=: read user pass uid gid fullname home shell
do
    echo user $user has home $home
done < /etc/passwd

exit

equal() {
  echo haha
  if [ "$1" = "$2" ];then
    return 0
  else
    return 1
  fi
}

ret=$(equal 1 1)

if equal 1 2 ;then
  echo haha
else
  echo xixi
fi

exit

file= verbose= quiet= long=

while getopts :f:vq opt
do
  case $opt in
  v) verbose=true
    ;;
  q) quiet=true
    ;;
  f) file=$OPTARG
    ;;
  ?) echo $0: error param: $OPTARG
  esac
done
shift $((OPTIND-1)) # 删除选项，留下参数

echo $@
exit
while [ $# -gt 0 ]
do
  case $1 in
  -v) verbose=true
    ;;
  -q) quiet=true
    ;;
  -f) file=$2
    shift
    ;;
  --) shift # --结束选项
    break
    ;;
  -*) echo $0: $1 error >&2
    ;;
  *) break
    ;;
  esac
    
  shift
done

exit


case $1 in
foo)
  echo foo
  ;;
bar | baa)
  echo ba*
  ;;
*)
  echo xixi
  ;;
esac

exit


if test "$s1" = "s2";then
 echo s1 = s2
fi

if grep -q xxx ./1foo.bar.txt ;then
  echo xxx found!
else
  echo xxx not found!
fi

echo prog name is: $0
echo $-
old=$IFS

IFS=,

echo "$*"
echo "$@"

:<<CMT
while [ $# != 0 ];
do
  echo $1
  shift
done
CMT

IFS=$old
