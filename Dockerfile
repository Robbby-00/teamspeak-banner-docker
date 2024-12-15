FROM php:7.4.3-apache

# Install git and php-gd
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    git \
    && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    --with-webp=/usr/include/ \
    --with-xpm=/usr/include/ \
    && docker-php-ext-install gd

WORKDIR /var/www/html

# Download ts3-php-framework
RUN git clone https://github.com/planetteamspeak/ts3phpframework.git ts3-php-framework

# Download ts3-banner
RUN git clone https://github.com/dennisabrams/teamspeak3-banner.git ts3-banner

# Replace path ts3-php-framework
RUN sed -i "/^\$ts3_libary/c\$ts3_libary = '/var/www/html/ts3-php-framework/libraries/TeamSpeak3/TeamSpeak3.php';" ts3-banner/config.php

# Replace envs
RUN sed -i "/^\$serverquery_username/c\$serverquery_username = getenv('SERVERQUERY_USERNAME');" ts3-banner/config.php
RUN sed -i "/^\$serverquery_password/c\$serverquery_password = getenv('SERVERQUERY_PASSWORD');" ts3-banner/config.php
RUN sed -i "/^\$server_ip/c\$server_ip = getenv('SERVER_IP');" ts3-banner/config.php
RUN sed -i "/^\$serverquery_port/c\$serverquery_port = getenv('SERVERQUERY_PORT');" ts3-banner/config.php
RUN sed -i "/^\$server_port/c\$server_port = getenv('TS3_PORT');" ts3-banner/config.php

# Copy .htaccess file
COPY ./.htaccess /var/www/html/ts3-banner/.htaccess