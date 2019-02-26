#!/bin/bash

set -ue

# 输入的参数总数
number=$#

echo $number

# 总数大于0
if [ $number -gt 0 ];then
  echo $1
fi

