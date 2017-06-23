FROM debian:stretch
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

ENV ftp_proxy=http://10.144.1.10:8080/
ENV http_proxy=http://10.144.1.10:8080/
ENV https_proxy=http://10.144.1.10:8080/


RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir /share && chmod a+rw /share

COPY rsyncd.conf /config/rsyncd.conf
COPY rsyncd.secrets /config/rsyncd.secrets
COPY rsync.sh /rsync.sh
RUN chmod a+x /rsync.sh

VOLUME ["/config"]
VOLUME ["/backup"]

EXPOSE 873

CMD ["/rsync.sh"]
