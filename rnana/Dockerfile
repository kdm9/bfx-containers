FROM ubuntu:18.04 AS builder
ARG SUBREAD_VERSION=2.0.6
ARG SEQHAX_VERSION=0.8.7
ARG ADAPTERREMOVAL_VERSION=2.3.3
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev cmake pkg-config \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev \
                       build-essential wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O- -q https://github.com/kdm9/seqhax/archive/refs/tags/${SEQHAX_VERSION}.tar.gz |  \
    tar xvz  && \
    cd seqhax-${SEQHAX_VERSION} && \
    mkdir build && cd build && \
    cmake -DSTATIC_BUILD=on -DHTSHAX=off .. && \
    make all install

RUN wget -O- -q https://sourceforge.net/projects/subread/files/subread-${SUBREAD_VERSION}/subread-${SUBREAD_VERSION}-source.tar.gz/download | tar xvz &&  \
	cd subread-${SUBREAD_VERSION}-source/src && \
	make -f Makefile.Linux && \
    mv ../bin/exactSNP ../bin/featureCounts ../bin/sub* /usr/local/bin

RUN wget -O- -q https://github.com/MikkelSchubert/adapterremoval/archive/v${ADAPTERREMOVAL_VERSION}.tar.gz | \
    tar xvz  && \
    cd adapterremoval-${ADAPTERREMOVAL_VERSION} && \
    make STATIC=yes && \
    make install


FROM ubuntu:22.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install bash pigz samtools && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash

