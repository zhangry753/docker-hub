FROM lnp

COPY . /data1/www/htdocs/demo/

# 拷贝配置并删除临时文件
RUN cd /data1/www/htdocs/demo/; \
    cp ./_docker/conf/fpm.conf /etc/php-fpm.d/www.conf; \
    cp ./_docker/conf/nginx.conf /etc/nginx/conf.d/www.conf; \
    rm -rf Dockerfile ./_docker

