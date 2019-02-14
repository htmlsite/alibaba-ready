#!/bin/bash
set -ue

# 目录结构脚本获取
./directory.sh

number=$#

# 获取随机数
NUM=`expr $RANDOM % 33 + 1`

# github emji图标标识
ICONS=(
:ok:
:up:
:cool:
:new:
:top:
:red_circle:
:white_circle:
:black_circle:
:link:
:100:
:o:
:x:
:copyright:
:tm:
:on:
:o2:
:a:
:ab:
:recycle:
:b:
:vs:
:sos:
:id:
:m:
:mens:
:free:
:repeat:
:hash:
:cn:
:smile:
:rage:
:shit:
:v:
:heart:
)

#echo ${#ICONS[*]}
#echo ${ICONS[$NUM]}

# 时间获取
date=`date +%Y-%m-%d' '%H:%M:%S`

if [ $number -eq 0 ];then
 MM="${ICONS[$NUM]} date:$date Commit file "
fi
if [ $number -eq 1 ];then
 MM="${ICONS[$NUM]} date:$date Commit file $1"
fi

#echo $MM

# git本地分支master提交到dev分支
git add .
git commit -m "$MM"
git push origin master:dev
