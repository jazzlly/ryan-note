#!/bin/bash

# set -eux
set -ex

echo $-
echo $PS1

if [ -z "$PS1" ];then
  echo in a non interactive shell
fi

exit


{
read line1
read line2
} < ./m.sh

echo $line1
echo $line2

{
echo "xixi"
echo "haha"
} >> /tmp/m.sh
