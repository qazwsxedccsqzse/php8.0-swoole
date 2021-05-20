FROM phusion/baseimage:focal-1.0.0alpha1-amd64
RUN apt-get update && apt-get install -y software-properties-common wget tar make libpcre3 libpcre3-dev openssl libssl-dev openssl libssl-dev supervisor
WORKDIR /root
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
apt-get update && \
apt-get install -y php8.0-cli \
php8.0-common \
php8.0 \
php8.0-mysql \
php8.0-fpm \
php8.0-curl \
php8.0-bz2 \
php8.0-cgi \
php8.0-mbstring \
php8.0-gd \
php-imagick \
php-memcache \
php-pear \
php8.0-xml \
php8.0-dev \
php8.0-bcmath \
php8.0-zip \
php8.0-dom && \
printf "\n" | pecl install swoole && \
echo "extension=swoole.so" >> /etc/php/8.0/cli/php.ini && \
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
php composer-setup.php && \
php -r "unlink('composer-setup.php');" && \
mv composer.phar /usr/local/bin/composer
