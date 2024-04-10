FROM ubuntu:22.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake && \
    rm -rf /var/lib/apt/lists/*

ARG BCFTOOLS_VERSION=1.19
RUN wget -q -O- https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 | tar xvj &&  \
	cd bcftools-* && \
	./configure --enable-static && \
	make -j && \
	make install

ARG SAMTOOLS_VERSION=1.19.2
RUN wget -q -O- https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 | tar xvj &&  \
	cd samtools-* && \
	./configure --enable-static && \
	make -j && \
	make install

ARG FREEBAYES_VERSION=1.3.7
RUN git clone https://github.com/freebayes/freebayes && \
    cd freebayes && \
    git checkout v${FREEBAYES_VERSION} && git submodule update --init --recursive && \
    meson build -Dstatic=true -Dprefer_system_deps=false --buildtype release && \
    ninja -C build/ && \
    mv build/freebayes  build/bamleftalign /usr/local/bin



FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install libcurl4 libbz2-1.0 zlib1g libssl3 libncurses5 libncursesw5 liblzma5 wget parallel python3 && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash

