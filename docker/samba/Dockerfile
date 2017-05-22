FROM debian:stretch
MAINTAINER Zhou Xin <xin.3.zhou@nokia.com>

ENV ftp_proxy=http://10.144.1.10:8080/
ENV http_proxy=http://10.144.1.10:8080/
ENV https_proxy=http://10.144.1.10:8080/


RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy samba && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir /share && chmod a+rw /share

COPY smb.conf /etc/samba/smb.conf

VOLUME ["/etc/samba"]
VOLUME ["/share"]

EXPOSE 137/udp 138/udp 139 445
CMD ["smbd", "-FS"]
