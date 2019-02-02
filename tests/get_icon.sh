#!/bin/bash

set -ue

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
