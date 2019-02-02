#!/bin/bash
set -ue

./directory.sh


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
echo ${#ICONS[*]}
echo ${ICONS[$NUM]}

MM="${ICONS[$NUM]} Commit file"
git add .
git commit -m "$MM"
git push origin master:dev
