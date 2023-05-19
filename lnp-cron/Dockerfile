# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

ENV LOG_MAXDAY=30

RUN yum install -y crontabs

COPY --chmod=744 start.sh /etc/start.sh
CMD ["/etc/start.sh"]
