#!/bin/bash


cd /Users/hhh/blog/blog/

# 检查是否有未提交的修改
if [[ -n $(git status -s) ]]; then
  # 添加所有修改的文件
  git add .

  # 提交修改并添加提交信息
  git commit -m "Auto commit"

  # 推送到远程仓库
  git push remote git@github.com:yuanguangshan/blog.git
fi
