#!/bin/bash
set -ue

./directory.sh

git add .
git commit -m ":new: Add document file"
git push origin master:dev
