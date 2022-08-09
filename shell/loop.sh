#!/usr/bin/env bash

set -e

trap -p "echo xixi;echo haha" SIGINT SIGPIPE
while true
do
  echo looping ....
  sleep 3
done
