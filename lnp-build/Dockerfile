# FROM lnp
FROM registry.cn-beijing.aliyuncs.com/bjgqhc/lnp

COPY Dockerfile /Dockerfile

# epel源和PowerTools源
RUN yum install -y epel-release dnf-plugins-core \
    && dnf config-manager --set-enabled powertools

# 安装工具
RUN yum install -y gcc gcc-c++ make cmake automake autoconf libtool \
    # 常用动态库
    bzip2-devel curl-devel openssl-devel freetype-devel glib2-devel glibc-devel libevent-devel libxml2-devel ncurses-devel zlib-devel pcre-devel \
    # php pecl
    php-devel php-pear \
    # 常用工具
    wget lrzsz zip unzip rpm-devel rpmdevtools

CMD ["bash"]
