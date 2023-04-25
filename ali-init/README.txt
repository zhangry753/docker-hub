yum install -y docker nginx php git vim lrzsz zip unzip; \

// nginx
mkdir -p /data0/logs /data0/html /data0/nginxlogs; \
rm /etc/nginx/conf.d/*; \
wget https://storage.bjgqhc.com/_docker/nginx.conf -O /etc/nginx/nginx.conf; \
systemctl enable nginx && systemctl start nginx; \

// 上传project.conf 参考

// 上传vim preference

// podman-docker dnsname
yum install dnsmasq
上传dnsname到/usr/libexec/cni/

// 挂载硬盘参考：https://help.aliyun.com/document_detail/34377.html?spm=a2c4g.25365.0.i1