FROM ubuntu:latest
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

ENV ftp_proxy=http://10.140.23.153:8080/
ENV http_proxy=http://10.140.23.153:8080/
ENV https_proxy=http://10.140.23.153:8080/


RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy openssh-server rsync firefox firefox-locale-zh-hans youtube-dl nano supervisor zh-autoconvert zhcon xfonts-wqy ttf-wqy-zenhei ttf-wqy-microhei && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN sed -i -e 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

ADD sshd.conf /etc/supervisor/conf.d/sshd.conf
ADD sshd_config /etc/ssh/sshd_config
ADD environment /etc/environment

RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD ["/usr/bin/supervisord"]
