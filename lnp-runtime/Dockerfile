# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

# 默认项目配置, nginx root: /html/public
COPY conf/project_default/fpm.conf /etc/php-fpm.d/
COPY conf/project_default/nginx.conf /etc/nginx/conf.d/

EXPOSE 80