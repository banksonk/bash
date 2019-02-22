#!/bin/bash
# by banksonk
# cara menjalankan ./namafile.sh versiphp direktori
# contoh : ./php-ldap.sh 7.1.26 php71
rootdir="/opt/alt"
version=$1
dir=$2

cd $rootdir
mkdir -p $dir
cd $dir
wget -c http://php.net/distributions/php-$version\.tar.gz
tar zxvf php-$version\.tar.gz
cd php-$version

./configure --prefix=$rootdir/$dir/usr --with-config-file-path=$rootdir/$dir/usr/php --with-config-file-scan-dir=$rootdir/$dir/usr/php/php.d --with-zlib=/usr --enable-mbstring --enable-zip --enable-bcmath --enable-pcntl --enable-ftp --enable-exif --enable-calendar --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-tidy --with-curl --with-mcrypt --with-iconv --with-gmp --with-pspell --with-gd --with-jpeg-dir=/usr --with-freetype-dir=/usr --with-png-dir=/usr --enable-gd-native-ttf --enable-gd-jis-conv --with-zlib-dir=/usr --with-xpm-dir=/usr --with-openssl --with-pdo-mysql=mysqlnd --with-gettext=/usr --with-bz2=/usr --with-ldap --with-mysqli --enable-soap --enable-phar --with-xsl --with-xmlrpc --with-kerberos --enable-posix --enable-sockets --with-pcre-regex --with-libdir=lib64 --with-mysql-sock=/var/lib/mysql/mysql.sock --enable-shmop --enable-intl --with-icu-dir=/usr --with-imap --with-imap-ssl --with-pgsql=/usr/lib64/pgsql --with-pdo-pgsql
sleep 1
make && make install
rm ../php-$version.tar.gz
rm -rf ../php-$version