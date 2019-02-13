#!/bin/bash
set -ue

./directory.sh

info=$1
NUM=`expr $RANDOM % 33 + 1`

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
date=`date +%Y-%m-%d' '%H:%M:%S`
MM="${ICONS[$NUM]} date:$date Commit file $info"
#echo $MM
git add .
git commit -m "$MM"
git push origin master:dev
