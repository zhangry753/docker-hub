#!/bin/bash

# 加载crontab文件
if [ -f "/cron/crontab" ];then 
    crontab /cron/crontab; 
fi

# 启动rsyslogd memcached
/usr/sbin/rsyslogd
/usr/bin/memcached -d -u www -l 127.0.0.1
# 前台启动crond
exec /usr/sbin/crond -n