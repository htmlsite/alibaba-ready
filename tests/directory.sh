#!/bin/bash
set -ue

# tree树结构显示当前目录的结构
#tree > INFO.md

a='```'

c=`tree|grep ──`

#echo $a
#echo $c

echo "" > INFO.md
echo "文档结构" >> INFO.md
echo "---" >> INFO.md
echo $a >> INFO.md
tree|grep ── >> INFO.md
echo $a >> INFO.md


