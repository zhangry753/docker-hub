# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

# 脚本输出日志保留多少天
ENV LOG_MAXDAY=30

COPY --chmod=744 start.sh /etc/start_cron.sh
CMD ["/etc/start_cron.sh"]
