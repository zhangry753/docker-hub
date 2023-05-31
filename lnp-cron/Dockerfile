# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

COPY Dockerfile /Dockerfile

ARG BACKUP_DIR=/logs/backup

# 脚本输出日志保留多少天
ENV LOG_MAXDAY=30

RUN echo "# 每天23:58归档日志" >> /etc/crontab; \
    echo "58 23 * * * root mkdir -p $BACKUP_DIR && rsync -av --exclude backup /logs/ $BACKUP_DIR/\$(date +\%Y-\%m-\%d) && find /logs -not -path *$BACKUP_DIR/* -type f -exec sh -c 'echo > {}' \;" >> /etc/crontab; \
    echo "# 日志保留30天" >> /etc/crontab; \
    echo "58 23 * * * root find $BACKUP_DIR -daystart -mtime +\$LOG_MAXDAY -type f -delete && find /logs/backup -empty -type d | xargs -i rmdir -p --ignore-fail-on-non-empty {}" >> /etc/crontab;

COPY --chmod=744 start.sh /etc/start_cron.sh
CMD ["/etc/start_cron.sh"]
