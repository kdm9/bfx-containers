FROM ubuntu:24.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses-dev  \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/man/man1/

ARG SAMTOOLS_VERSION=1.19.2
RUN wget -q -O- https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 | tar xvj &&  \
	cd samtools-* && \
	./configure --enable-static && \
	make -j && \
	make install

ARG MM2_VERSION=2.28
RUN wget -q -O- https://github.com/lh3/minimap2/releases/download/v${MM2_VERSION}/minimap2-${MM2_VERSION}_x64-linux.tar.bz2 | tar xvj && \
    mv minimap2-*/k8 /usr/local/bin/ && \
    mv minimap2-*/paftools.js /usr/local/bin/ && \
    mv minimap2-*/minimap2 /usr/local/bin/ && \
    mv minimap2-*/*.1 /usr/local/share/man/man1/ 

ARG MINIPROT_VERSION=0.13
RUN wget -q -O- https://github.com/lh3/miniprot/releases/download/v${MINIPROT_VERSION}/miniprot-${MINIPROT_VERSION}_x64-linux.tar.bz2 \
    | tar xvj && \
    mv miniprot-*/miniprot /usr/local/bin/ && \
    mv miniprot-*/*.1 /usr/local/share/man/man1/ 

FROM ubuntu:24.04
COPY --from=builder /usr/local/ /usr/local/
RUN apt-get update && \
    apt-get -y install \
        libcurl4 libbz2-1.0 zlib1g libssl3 libncurses6 libncursesw6 liblzma5 wget parallel python3 \
        zstd pigz python3-pip pipx git tabix\
    && \
    rm -rf /var/lib/apt/lists/*

RUN PIPX_BIN_DIR=/usr/local/bin \
    PIPX_HOME=/opt/pipx \
    PIPX_MAN_DIR=/usr/local/share/man \
    pipx install git+https://github.com/agshumate/Liftoff

CMD /bin/bash
