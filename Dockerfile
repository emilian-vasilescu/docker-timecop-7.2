FROM debian:jessie

MAINTAINER Emilian Vasilescu "emilian.vasilescu@gmail.com"

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install wget apache2 mysql-client -y

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org jessie all" >> etc/apt/sources.list

RUN wget https://www.dotdeb.org/dotdeb.gpg
RUN apt-key add dotdeb.gpg -y

RUN apt-get update -y

RUN apt-get install php7.2 php7.2-dev php7.2-common php-pear php7.2-opcache php7.2-mysql php7.2-zip php7.2-curl -y

RUN apt-get install libapache2-mod-php7.2 -y

RUN pecl install timecop-beta

RUN echo "extension=timecop.so" >> /etc/php/7.2/cli/php.ini
