# VERSION    1.0
FROM progrium/busybox
MAINTAINER Vadim Bauer <hello@z-rechnung.de>

ENV kib=kibana-4.0.0

ADD libstdc++.so.6.tar.gz /
RUN wget -qcO - http://download.elasticsearch.org/kibana/kibana/${kib}-linux-x64.tar.gz | gunzip -c | tar -xf - -C /opt &&\ 
	ln -s /opt/${kib}-linux-x64 /opt/kibana

COPY config/* /opt/kibana/config/

EXPOSE 5601

ENTRYPOINT ["/opt/kibana/bin/kibana"]