FROM debian:stretch
MAINTAINER Zhou Xin <xin.3.zhou@nokia.com>

ENV ftp_proxy=http://10.144.1.10:8080/
ENV http_proxy=http://10.144.1.10:8080/
ENV https_proxy=http://10.144.1.10:8080/
	
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq  && \
    apt-get install -qqy wget gnupg && \
    apt-get -s dist-upgrade -y

COPY resilio-sync.list /etc/apt/sources.list.d/resilio-sync.list

RUN wget -qO - https://linux-packages.resilio.com/resilio-sync/key.asc | apt-key add - && \
    apt-get update -qq && \
    apt-get install -qqy resilio-sync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

COPY config.json /etc/resilio-sync/config.json
COPY resilio.sh /resilio.sh

RUN chmod a+x /resilio.sh
RUN mkdir -p /var/run/resilio-sync

VOLUME /var/lib/resilio-sync
EXPOSE 8888

CMD ["/resilio.sh"]