# VERSION    1.0
FROM progrium/busybox

MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV kib=kibana-4.0.0

RUN curl -kLsS https://download.elasticsearch.org/kibana/kibana/${kib}-linux-x64.tar.gz | gunzip -c | tar -xf - -C /opt &&\
    ln -s /opt/${ls}-linux-x64 /opt/kibana

COPY config/* /opt/kibana/config/

EXPOSE 5601

ENTRYPOINT ["/opt/kibana/bin/kibana"]