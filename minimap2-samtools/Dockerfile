FROM ubuntu:18.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev \
                       build-essential wget && \
    rm -rf /var/lib/apt/lists/*

# K8
RUN wget -O- https://github.com/attractivechaos/k8/releases/download/v1.0/k8-1.0.tar.bz2 | tar xj --no-same-owner  && \
    mv k8*/k8*Linux /usr/local/bin/k8

# Minimap2
RUN wget -qO- "https://github.com/lh3/minimap2/releases/download/v2.26/minimap2-2.26.tar.bz2" | tar xj --no-same-owner  && \
    cd minimap2-* && make && chmod a+x minimap2 && \
    mv minimap2 misc/paftools.js /usr/local/bin/ && \
    cd .. && rm -rf minimap2-*

# samtools
RUN wget -qO- "https://github.com/samtools/samtools/releases/download/1.19.2/samtools-1.19.2.tar.bz2" | tar xj --no-same-owner  && \
    cd samtools-* && ./configure --enable-static && make && make install && cd .. && rm -rf samtools-*

FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/

RUN apt-get update && \
    apt-get -y install libncursesw5 libncurses5 zlib1g libbz2-1.0 liblzma5 libcurl4 && \
    rm -rf /var/lib/apt/lists/*
RUN samtools || minimap2 || paftools.js || true
CMD minimap2
