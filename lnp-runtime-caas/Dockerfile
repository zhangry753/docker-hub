FROM ccr.ccs.tencentyun.com/common-zhang/lnp-runtime

COPY Dockerfile /Dockerfile

# 修改buffer限制
RUN sed -i -e "s/client_max_body_size.*/client_max_body_size 128M;/" /etc/nginx/nginx.conf; \
    sed -i -e "s/upload_max_filesize.*/upload_max_filesize = 128M/" -e "s/post_max_size.*/post_max_size = 128M/" /etc/php.ini;
