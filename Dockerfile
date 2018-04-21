
FROM        alpine:3.7
ENV GLIBC_VERSION=2.26-r0
ENV GRAFANA_VERSION 5.0.4
RUN         apk add  --no-cache ca-certificates openssl tar && \
            wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
            wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
            apk add glibc-${GLIBC_VERSION}.apk && \
            wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-$GRAFANA_VERSION.linux-x64.tar.gz && \
            tar xzvf grafana-$GRAFANA_VERSION.linux-x64.tar.gz && \
            mkdir /opt && \
            mv grafana-$GRAFANA_VERSION /opt/grafana && \
            apk del --purge tar openssl && \
            rm -Rf grafana-$GRAFANA_VERSION.linux-x64.tar.gz

EXPOSE 3000

WORKDIR     /opt/grafana

ENTRYPOINT  ["/opt/grafana/bin/grafana-server"]
