FROM debian:stretch
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir /share && chmod a+rw /share

COPY smb.conf /etc/samba/smb.conf
COPY samba.sh /samba.sh
RUN chmod a+x /samba.sh

VOLUME ["/etc/samba"]
VOLUME ["/share"]

EXPOSE 137/udp 138/udp 139 445

CMD ["/samba.sh"]
