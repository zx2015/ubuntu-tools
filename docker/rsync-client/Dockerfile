FROM debian:stretch
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

ENV ftp_proxy=http://10.158.100.1:8080/
ENV http_proxy=http://10.158.100.1:8080/
ENV https_proxy=http://10.158.100.1:8080/


RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy rsync cron supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN sed -i -e 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
ADD cron.conf /etc/supervisor/conf.d/cron.conf

ADD root /var/spool/cron/crontabs/root

ADD rsync.sh /rsync.sh
RUN chmod a+x /rsync.sh

VOLUME ["/backup-script"]

CMD ["/usr/bin/supervisord"]
