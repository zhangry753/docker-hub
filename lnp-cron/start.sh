#!/bin/bash

echo "# 每天3点归档日志 日志保留30天" >> /etc/crontab; \
echo "0 3 * * * root rsync -av --exclude backup /logs/ /logs/backup/\$(date +\%Y-\%m-\%d) && find /logs -not -path /logs/backup/* -type f -exec sh -c \"echo > {}\" \;" >> /etc/crontab; \
echo "0 3 * * * root find /logs/backup -mindepth 1 -maxdepth 1 -mtime +$LOG_MAXDAY -type d -exec rm -rf {} \;" >> /etc/crontab

# 加载crontab文件
if [ -f "/cron/crontab" ];then 
    crontab /cron/crontab; 
fi

# 前台启动crond
exec /usr/sbin/crond -n