FROM centos:8

COPY Dockerfile /Dockerfile

# centos8停止维护了需要改repo才能用yum；同时改成阿里源
RUN sed -i -e "s|mirrorlist=|#mirrorlist=|g" \
           -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*; \
    curl https://mirrors.aliyun.com/repo/Centos-8.repo > /etc/yum.repos.d/CentOS-Base.repo;

## 安装rpm
#COPY rpm/ /tmp/rpm/
#RUN yum install -y epel-release && yum localinstall -y /tmp/rpm/*

# yum安装，php、php-fpm、nginx等
RUN yum install -y epel-release; \
    yum install -y php php-fpm nginx memcached crontabs rsyslog rsync \
    # 依赖
    ImageMagick libmcrypt libmemcached librdkafka libzip php-mysqlnd zlib;
# yum安装 其他包
RUN yum install -y vim net-tools lsof;


# 配置php
COPY php/php.ini /etc/php.ini
COPY php/modules/ /usr/lib64/php/modules/
RUN rm /etc/php.d/*

# 配置php-fpm、nginx
RUN useradd -s /sbin/nologin www; \
    chown -R www /var/lib/nginx; \
    mkdir -p /run/php-fpm; \
    rm /etc/nginx/conf.d/* /etc/nginx/default.d/* /etc/php-fpm.d/*;
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx.fastcgi_params /etc/nginx/fastcgi_params
COPY conf/php-fpm.conf /etc/php-fpm.conf

# 配置rsyslog
COPY conf/rsyslog.conf /tmp/rsyslog.conf
RUN mv /etc/rsyslog.conf /etc/rsyslog.conf.default; \
    mv /tmp/rsyslog.conf /etc/rsyslog.conf

# 偏好配置
COPY preference/.bashrc preference/vim /root/

ENV TZ=Asia/Shanghai

# 启动
EXPOSE 80
COPY --chmod=744 start.sh /etc/start.sh
CMD ["/etc/start.sh"]
