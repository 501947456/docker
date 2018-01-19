FROM docker.io/centos:latest
MAINTAINER guozhiwen 2018-01-19
ADD php-7.2.1 /php-7.2.1
RUN yum install epel-release -y
RUN yum -y install  gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel libevent-devel libevent mhash mhash-devel libmcrypt-devel libmcrypt gd gd-devel pcre pcre-devel perl perl-devel ntp sysstat links make patch bc screen cmake tree gmp gmp-devel readline readline-devel libxslt libxslt-devel GeoIP-devel  lua-devel
RUN cd /php-7.2.1 && ./configure --prefix=/usr/local/webserver/php  --with-config-file-path=/usr/local/php/etc --with-iconv-dir=/usr/local --enable-fpm  --with-fpm-user=daemon --with-fpm-group=daemon  --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-soap --with-xmlrpc --with-openssl --with-mcrypt --with-pcre-regex --with-sqlite3 --with-zlib --enable-bcmath --with-iconv --with-bz2 --enable-calendar --with-curl --with-cdb  --enable-dom --enable-exif --enable-fileinfo --enable-filter --with-pcre-dir --enable-ftp --with-gd --with-openssl-dir --with-jpeg-dir  --with-png-dir --with-freetype-dir --enable-gd-native-ttf --enable-gd-jis-conv --with-gettext --with-gmp --with-mhash --enable-json --enable-mbstring --enable-mbregex --enable-mbregex-backtrack --with-libmbfl --with-onig --enable-pdo --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-zlib-dir --with-pdo-sqlite --with-readline --enable-session --enable-shmop --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear  --enable-opcache --enable-soap && make && make install
RUN cp /php-7.2.1/php.ini-production  /usr/local/webserver/php/etc/php.ini
RUN cp /usr/local/webserver/php/etc/php-fpm.d/www.conf.default /usr/local/webserver/php/etc/php-fpm.d/www.conf && sed -i 's\listen = 127.0.0.1:9000\listen = 0.0.0.0:9000\g' /usr/local/webserver/php/etc/php-fpm.d/www.conf
RUN mv /usr/local/webserver/php/etc/php-fpm.conf.default /usr/local/webserver/php/etc/php-fpm.conf
RUN sed -i -e 's\;pid = run/php-fpm.pid\pid = run/php-fpm.pid\g' -e 's\nobody\daemon\g'  /usr/local/webserver/php/etc/php-fpm.conf
RUN sed -i 's\;daemonize = yes\daemonize = no\g' /usr/local/webserver/php/etc/php-fpm.conf
RUN rm -rf /php-7.2.1
EXPOSE 9000
CMD ["/usr/local/webserver/php/sbin/php-fpm"]
