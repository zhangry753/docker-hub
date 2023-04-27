yum install -y docker nginx php git vim lrzsz zip unzip; \
// 安装php依赖了httpd，禁止开机自启
systemctl disable httpd
// podman需要启动服务才支持restart
systemctl enable podman-restart

// nginx
mkdir -p /data0/logs /data0/html /data0/nginxlogs; \
rm /etc/nginx/conf.d/*; \
wget https://storage.bjgqhc.com/_docker/nginx.conf -O /etc/nginx/nginx.conf; \
systemctl enable nginx && systemctl start nginx; \

// 上传project.conf 参考

// 上传vim preference

// podman-docker dnsname
yum install dnsmasq
编译dnsname
解压dnsname-main.zip，make，make install PREFIX=/usr

// 挂载硬盘参考：https://help.aliyun.com/document_detail/34377.html?spm=a2c4g.25365.0.i1