#!/usr/bin/env bash 

#APP清理脚本


# 切换进入当前目录
toProjectDir()
{
	path=$0
	first=${path:0:1}
	if [[ $first == "/" ]]; then
	    path=${path%/*}
	    cd "$path"
	fi
}
toProjectDir
clear



git add .
git commit -m "更新Package.swift"
git push

