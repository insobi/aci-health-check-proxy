FROM moskrive/aci-health-check:vetr-collector_2.1.14

RUN echo "Installing common utils >>> " \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    && apt-get -y install gcc make git vim

RUN cd /opt \
    && git clone https://github.com/rofl0r/proxychains-ng \
    && cd /opt/proxychains-ng \
    && ./configure --prefix=/usr --sysconfdir=/etc \
    && make

COPY proxychains4.conf /etc/proxychains4.conf

CMD ["/bin/sh", "-c", "while sleep 1000; do :; done"]