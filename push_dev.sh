#!/bin/bash
set -ue

git add .
git commit -m ":new: Add document file"
git push origin master:dev
