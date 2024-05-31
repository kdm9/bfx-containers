FROM ubuntu:24.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses-dev  libjemalloc-dev libgsl-dev libhts-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev \
                       libatomic-ops-dev  libzstd-dev\
                       build-essential wget git meson ninja-build parallel pkg-config cmake python3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /usr/local/share/man/man1/ /work


ARG SEQWISH_VERSION=0.7.10
RUN cd /work/ && \
    wget -q -O- https://github.com/ekg/seqwish/releases/download/v${SEQWISH_VERSION}/seqwish-v${SEQWISH_VERSION}.tar.gz | \
    tar xvz && \
    cd seqwish* && \
    cmake -DBUILD_STATIC=1 -H. -Bbuild && cmake --build build -- -j 8 && \
    cp -v bin/* /usr/local/bin/

ARG WFMASH_VERSION=0.14.0
RUN cd /work/ && \
    wget -q -O- https://github.com/waveygang/wfmash/releases/download/v${WFMASH_VERSION}/wfmash-v${WFMASH_VERSION}.tar.gz | \
    tar xvz && \
    cd wfmash* && \
    cmake -DCMAKE_BUILD_TYPE=Generic -H. -Bbuild && cmake --build build -- -j 8 && \
    cp -v build/bin/wfmash /usr/local/bin/

ARG SMOOTHXG_VERSION=0.7.4
RUN cd /work/ && \
    wget -q -O- https://github.com/pangenome/smoothxg/releases/download/v${SMOOTHXG_VERSION}/smoothxg-v${SMOOTHXG_VERSION}.tar.gz | \
    tar xvz && \
    cd smoothxg* && \
    cmake -H. -Bbuild && cmake --build build -- -j 8 && \
    cp -v bin/smoothxg /usr/local/bin/

FROM ubuntu:24.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install \
        libcurl4 libbz2-1.0 zlib1g libssl3 libncurses6 libncursesw6 liblzma5 \
        libzstd1 libjemalloc2 \
        python3-pip pipx \
        zstd pigz tabix wget parallel python3 samtools \
    && \
    rm -rf /var/lib/apt/lists/*

CMD /bin/bash
