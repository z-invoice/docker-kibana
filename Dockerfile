# VERSION    1.0
#FROM gliderlabs/alpine
FROM debian:wheezy

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV kib=kibana-4.0.0

# apk-install musl c-ares libcrypto1.0 libgcc libssl1.0 libstdc++ libuv zlib &&\
#    mkdir /opt &&\
RUN apt-get -q update && apt-get -yq install wget
RUN wget -qcO - http://download.elasticsearch.org/kibana/kibana/${kib}-linux-x64.tar.gz | gunzip -c | tar -xf - -C /opt &&\ 
	ln -s /opt/${kib}-linux-x64 /opt/kibana

COPY config/* /opt/kibana/config/

EXPOSE 5601

ENTRYPOINT ["/opt/kibana/bin/kibana"]