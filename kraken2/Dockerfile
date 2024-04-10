FROM ubuntu:22.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/man/man1/

ARG KRAKEN2_VERSION=2.1.3
RUN wget -q -O- https://github.com/DerrickWood/kraken2/archive/refs/tags/v${KRAKEN2_VERSION}.tar.gz | tar xvz &&  \
	cd kraken2-* && \
	bash install_kraken2.sh /usr/local/bin

FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install libcurl4 libbz2-1.0 zlib1g wget parallel python3 zstd && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash
