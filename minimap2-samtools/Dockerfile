FROM ubuntu:18.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev \
                       build-essential wget && \
    rm -rf /var/lib/apt/lists/*

# K8
RUN wget -O- https://github.com/attractivechaos/k8/releases/download/v1.0/k8-1.0.tar.bz2 | tar xj && \
    mv k8*/k8*Linux /usr/local/bin/k8

# Minimap2
RUN wget -qO- "https://github.com/lh3/minimap2/releases/download/v2.26/minimap2-2.26.tar.bz2" | tar xj && \
    cd minimap2-* && \
    make && \
    chmod a+x minimap2 && \
    mv minimap2 misc/paftools.js /usr/local/bin/ && \
    cd .. && \
    rm -rf minimap2-*

FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/
CMD minimap2

