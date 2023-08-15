#!/bin/bash

cd /Users/hhh/blog/blog/

git config --global user.email yuanguangshan@gmail.com
git config --global user.name "yuanguangshan"
# 添加所有修改的文件到暂存区
git add .

# 提交修改，包括一个提交消息
git commit -m "自动提交"

# 推送到远程仓库
git push

