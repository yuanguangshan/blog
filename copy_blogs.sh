#!/bin/bash

source_dir="/Users/hhh/Library/Mobile Documents/iCloud~app~cyan~taio/Documents/Editor"  # 将 "/path/to/a" 替换为实际的a文件夹路径
destination_dir="/Users/hhh/myblog/gitblog/_posts"  # 将 "/path/to/b" 替换为实际的b文件夹路径

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

