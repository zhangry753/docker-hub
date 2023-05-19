# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

# 默认项目配置, nginx root: /html/public
COPY conf/project_default/fpm.conf /etc/php-fpm.d/
COPY conf/project_default/nginx.conf /etc/nginx/conf.d/

# memcached 在start.sh倒数第二行插入
RUN yum install -y memcached; \
    sed -i "\$i /usr/bin/memcached -d -u www -l 127.0.0.1" /etc/start.sh;

EXPOSE 80