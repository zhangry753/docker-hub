yum install -y docker nginx php git vim lrzsz zip unzip; \

// nginx
mkdir -p /data0/logs /data0/html /data0/nginxlogs; \
rm /etc/nginx/conf.d/*; \
wget https://storage.bjgqhc.com/_docker/nginx.conf -O /etc/nginx/nginx.conf; \
systemctl enable nginx && systemctl start nginx; \

// vim preference

// podman-docker dnsname
yum install dnsmasq
拷贝dnsname到/usr/libexec/cni/