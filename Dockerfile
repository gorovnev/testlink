FROM ubuntu:22.04
LABEL description="Custom docker container for running TestLink"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php

RUN apt update

RUN apt install -y php7.3 php7.3-cli php7.3-mysql php7.3-gd php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-common php7.3-curl php7.3-mbstring php7.3-xml php7.3-bcmath php7.3-bz2 php7.3-intl php7.3-json php7.3-readline php7.3-zip php7.3-pgsql php7.3-ldap

RUN apt install -y apache2 apache2-utils libapache2-mod-php7.3

RUN apt clean

RUN a2enmod php7.3

COPY testlink-1.9.20.tar.gz /tmp

RUN mkdir /testlink

RUN tar xzf /tmp/testlink-1.9.20.tar.gz --strip-components=2 -C /testlink

RUN rm /tmp/testlink-1.9.20.tar.gz

RUN chown -R www-data:www-data /testlink

RUN echo 'ServerName 127.0.0.1' >> /etc/apache2/apache2.conf

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUND"]
