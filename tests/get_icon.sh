#!/bin/bash

set -ue

# 随机数获取
NUM=`expr $RANDOM % 33 + 1`

# github提交的emji图标
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

# 输出emji图标总数
echo ${#ICONS[*]}
# 获取随机的图标标识
echo ${ICONS[$NUM]}
