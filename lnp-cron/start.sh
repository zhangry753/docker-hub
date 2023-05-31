#!/bin/bash

# 添加环境变量到crontab
sed -i -e "1i LOG_MAXDAY=$LOG_MAXDAY" /etc/crontab

# 加载crontab文件
if [ -f "/cron/crontab" ];then 
    crontab /cron/crontab; 
fi

# 启动rsyslogd memcached
/usr/sbin/rsyslogd
/usr/bin/memcached -d -u www -l 127.0.0.1
# 前台启动crond
exec /usr/sbin/crond -n