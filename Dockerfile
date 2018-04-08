
FROM        alpine:3.7
ENV GRAFANA_VERSION 5.0.4
RUN         apk add  --no-cache ca-certificates openssl tar && \
            wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-$GRAFANA_VERSION.linux-x64.tar.gz && \
            tar xzvf grafana-$GRAFANA_VERSION.linux-x64.tar.gz && \
            mv grafana-$GRAFANA_VERSION /opt/grafana && \
            apk del --purge tar openssl && \
            rm -Rf grafana-$GRAFANA_VERSION.linux-x64.tar.gz

WORKDIR     /opt/grafana

ENTRYPOINT  ["/opt/grafana/bin/grafana-server", "web"]
