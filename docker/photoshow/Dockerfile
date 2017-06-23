FROM debian:stretch
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    --no-install-recommends \
    nginx \
    php-fpm \
    php-gd \
    libgd-dev \
    libgdchart-gd2-xpm \
    ffmpeg \
    supervisor

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://github.com/thibaud-rohmer/PhotoShow/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv PhotoShow-master /var/www/PhotoShow && \
    mkdir -p /opt/PhotoShow/Photos && \
    mkdir -p /opt/PhotoShow/generated && \
    cd /var/www/PhotoShow && \
    sed -i -e 's/$config->photos_dir.\+/$config->photos_dir = "\/opt\/PhotoShow\/Photos";/' config.php && \
    sed -i -e 's/$config->ps_generated.\+/$config->ps_generated = "\/opt\/PhotoShow\/generated";/' config.php && \
    chown -R www-data:www-data /opt/PhotoShow/Photos /opt/PhotoShow/generated

ADD fpm-photoshow.conf /etc/php5/fpm/pool.d/photoshow.conf
RUN sed -i -e 's/^.\+daemonize.\+$/daemonize = no/' /etc/php5/fpm/php-fpm.conf

ADD photoshow.nginx /etc/nginx/sites-available/photoshow
RUN rm -f /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/photoshow /etc/nginx/sites-enabled/photoshow
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/opt/PhotoShow", "/var/log"]
EXPOSE 80
CMD ["/usr/bin/supervisord"]
