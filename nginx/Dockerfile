#lnmp centos7.4
#lnmp centos 7
FROM centos7:base
MAINTAINER guozhiwen 2018-01-19
ENV APP_DIR /web
add nginx-1.12.2 /nginx-1.12.2
RUN mkdir -p /usr/local/webserver/
RUN cd /nginx-1.12.2 && ./configure --prefix=/usr/local/webserver/nginx --user=daemon --group=daemon --with-http_ssl_module  --with-http_stub_status_module --with-http_gzip_static_module  --with-pcre && make && make install
RUN mkdir /usr/local/webserver/nginx/conf/vhosts
ADD nginx.conf /usr/local/webserver/nginx/conf/nginx.conf
ADD default.conf /usr/local/webserver/nginx/conf/vhosts/default.conf
EXPOSE 80
CMD ["/usr/local/webserver/nginx/sbin/nginx"]
