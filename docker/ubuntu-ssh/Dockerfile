FROM ubuntu:latest
MAINTAINER Zhou Xin <xin.zhou.hziee@hotmail.com>

ENV ftp_proxy=http://10.158.100.1:8080/
ENV http_proxy=http://10.158.100.1:8080/
ENV https_proxy=http://10.158.100.1:8080/


RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get -s dist-upgrade -y && \
    apt-get install -qqy openssh-server rsync supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN sed -i -e 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

ADD sshd.conf /etc/supervisor/conf.d/sshd.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
