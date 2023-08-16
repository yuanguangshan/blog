#!/bin/bash


#判断环境

if [ -d "/Users/yuangs/gitblog/blog" ]; then
  # 如果路径 a 存在，则执行代码段 b
echo "执行代码中……"
  # 在这里添加代码段 b 的具体内容
source_dir="/Users/hhh/Library/Mobile Documents/iCloud~app~cyan~taio/Documents/Editor"
destination_dir="/Users/hhh/myblog/gitblog/_posts"

#destination_dir="/Users/hhh/myblog/gitblog/_posts"  # 将 "/path/to/b" 替换为实际的b文件夹路径
else
  # 如果路径 a 不存在，则执行代码段 c
echo "执行代码中……"
  # 在这里添加代码段 c 的具体内容
source_dir="/Users/yuangs/Library/Mobile Documents/iCloud~app~cyan~taio/Documents/Editor"  # 将 "/path/to/a" 替换为实际的a文件夹路径
destination_dir="/Users/yuangs/gitblog/blog/_posts"  # 将 "/path/to/b" 替换为实际的b文件夹路径
fi

#自动拷贝blog文章，并检查有变化，自动git提交

# 检查a文件夹中的每个文件
for file in "$source_dir"/*; do
    # 提取文件名
    filename=$(basename "$file")
    
    # 检查文件是否存在于b文件夹中
    if [ ! -f "$destination_dir/$filename" ]; then
        # 将文件拷贝到b文件夹
        cp "$file" "$destination_dir"
        echo "Copied $filename to $destination_dir"
    fi
done

# 检查是否有文件变更
git_status=$(git status --porcelain)
if [[ -n $git_status ]]; then
    # 有文件变更，执行Git指令
    git add .
    git commit -m "add a blog @ $(date)"
    git_push_status=$(git push)

    # 检查Git push状态
    if [[ $? -eq 0 ]]; then
        echo "Git push 成功"
    else
        echo "Git push 失败"
    fi
else
    echo "没有文件变更"
fi