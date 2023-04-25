# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

# 默认项目配置, nginx root: /html/public
COPY conf/project_default/fpm.conf /etc/php-fpm.d/
COPY conf/project_default/nginx.conf /etc/nginx/conf.d/
RUN mkdir -p /logs/nginx /logs/php-fpm && chown -R www:www /logs/nginx /logs/php-fpm

# memcached
RUN yum install -y memcached; \
    sed -i "3i /usr/bin/memcached -d -u www -l 127.0.0.1" /etc/start.sh;

EXPOSE 80