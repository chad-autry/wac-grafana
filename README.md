# wac-grafana
The Prometheus/node_exporter docker container for wac-bp

Run with 
```
docker run -d -p 3000:3000 -v "/var/grafana:var/grafana" chadautry/wac-grafana
```

### Status
[![Build Status](https://travis-ci.org/chad-autry/wac-grafana.svg?branch=master)](https://travis-ci.org/chad-autry/wac-grafana)
[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/chadautry/wac-grafana/)
