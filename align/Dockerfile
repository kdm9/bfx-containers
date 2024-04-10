FROM ubuntu:22.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc zlib1g-dev  \
                       build-essential wget git pkg-config cmake && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/man/man1/

ARG SAMTOOLS_VERSION=1.19.2
RUN wget -q -O- https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 | tar xvj &&  \
	cd samtools-* && \
	./configure --enable-static && \
	make -j && \
	make install

ARG BWA_VERSION=master
RUN git clone https://github.com/lh3/bwa && \
	cd bwa && git checkout ${BWA_VERSION} &&  \
	make && \
    mv bwa /usr/local/bin && \
    mv bwa.1 /usr/local/share/man/man1/ 

ARG MM2_VERSION=2.28
RUN wget -q -O- https://github.com/lh3/minimap2/releases/download/v${MM2_VERSION}/minimap2-${MM2_VERSION}_x64-linux.tar.bz2 | tar xvj && \
    mv minimap2-*/k8 /usr/local/bin/ && \
    mv minimap2-*/paftools.js /usr/local/bin/ && \
    mv minimap2-*/minimap2 /usr/local/bin/ && \
    mv minimap2-*/*.1 /usr/local/share/man/man1/ 

FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install libcurl4 libbz2-1.0 zlib1g libssl3 libncurses5 libncursesw5 liblzma5 wget curl perl  && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash
