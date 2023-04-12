#!/bin/bash

# 加载crontab文件
if [ -f "/html/crontab" ];then 
    crontab /html/crontab; 
fi

# 前台启动crond
exec crond -n