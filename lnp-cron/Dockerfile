# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

# 脚本输出日志保留多少天
ENV LOG_MAXDAY=30

RUN echo "# 每天23:58归档日志 日志保留30天" >> /etc/crontab; \
    echo "58 23 * * * root mkdir -p /logs/backup && rsync -av --exclude backup /logs/ /logs/backup/\$(date +\%Y-\%m-\%d) && find /logs -not -path */logs/backup/* -type f -exec sh -c 'echo > {}' \; && find /logs/backup -mindepth 1 -maxdepth 1 -mtime +\$LOG_MAXDAY -type d -exec rm -rf {} \;" >> /etc/crontab;

COPY --chmod=744 start.sh /etc/start_cron.sh
CMD ["/etc/start_cron.sh"]
