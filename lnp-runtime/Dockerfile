FROM centos:8

# centos8停止维护了需要改repo才能用yum；同时改成阿里源
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" \
           -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*; \
    curl https://mirrors.aliyun.com/repo/Centos-8.repo > /etc/yum.repos.d/CentOS-Base.repo;

# yum安装，php、php-fpm、nginx等
RUN yum install -y vim php php-fpm nginx;

# 安装rpm
COPY rpm/ /tmp/rpm/
RUN yum install -y epel-release && yum localinstall -y /tmp/rpm/*

# 配置php
COPY php/php.ini /etc/php.ini
COPY php/modules/ /usr/lib64/php/modules/
RUN rm /etc/php.d/*

# 配置php-fpm、nginx
RUN useradd -s /sbin/nologin www; \
    mkdir -p /run/php-fpm /logs/nginx /logs/php-fpm; \
    rm /etc/nginx/conf.d/* /etc/nginx/default.d/* /etc/php-fpm.d/*;
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx.fastcgi_params /etc/nginx/fastcgi_params
COPY conf/php-fpm.conf /etc/php-fpm.conf

# 默认项目配置, nginx root: /html/public
COPY conf/project_default/fpm.conf /etc/php-fpm.d/
COPY conf/project_default/nginx.conf /etc/nginx/conf.d/

# memcached
RUN yum install -y memcached; \
    memcached -u www -d;

# 偏好配置
COPY preference/.bashrc preference/vim /root/

# 启动
EXPOSE 80
COPY start.sh /etc/start.sh
CMD ["/etc/start.sh"]
