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
    cd build && \
    make -j4 && \
    make install

#ARG WFMASH_VERSION=0.21.0
#RUN cd /work/ && \
#    wget -q -O- https://github.com/waveygang/wfmash/releases/download/v${WFMASH_VERSION}/wfmash-v${WFMASH_VERSION}.tar.gz | \
#    tar xvz && \
#    cd wfmash* && \
#    cmake -DBUILD_STATIC=1 -DCMAKE_BUILD_TYPE=Generic -H. -Bbuild  && \
#    cd build && \
#    make -j4 && \
#    make install

RUN cd /work/ && \
    git clone https://github.com/kdm9/wfmash.git && \
    cd wfmash && \
    git checkout kdm9-paf-fix && \
    cmake -H. -Bbuild -DBUILD_RETARGETABLE=ON -DBUILD_STATIC=ON && cmake --build build -- -j 8 && cmake --install build 

ARG SMOOTHXG_VERSION=0.7.4
RUN cd /work/ && \
    wget -q -O- https://github.com/pangenome/smoothxg/releases/download/v${SMOOTHXG_VERSION}/smoothxg-v${SMOOTHXG_VERSION}.tar.gz | \
    tar xvz && \
    cd smoothxg* && \
    cmake -DBUILD_STATIC=1 -H. -Bbuild && cmake --build build -- -j 8 && \
    cd build && \
    make -j4 && \
    make install

ARG ODGI_VERSION=0.8.6
RUN cd /work/ && \
    wget -q -O- https://github.com/pangenome/odgi/releases/download/v${ODGI_VERSION}/odgi-v${ODGI_VERSION}.tar.gz | \
    tar xvz && \
    cd odgi* && \
    cmake -DBUILD_STATIC=1  -H. -Bbuild && cmake --build build -- -j 8 && \
    cd build && \
    make -j4 && \
    make install

ARG GFAFFIX_VERSION=0.1.5b
RUN cd /work/ && \
    wget -q -O- https://github.com/marschall-lab/GFAffix/releases/download/${GFAFFIX_VERSION}/GFAffix-${GFAFFIX_VERSION}_linux_x86_64.tar.gz | \
    tar xzv && \
    cp GFAffix-*linux_x86_64/gfaffix /usr/local/bin


ENV LD_LIBRARY_PATH /usr/lib/:/usr/local/lib:/usr/lib/x86_64-linux-gnu/
RUN rm -rf /work
RUN seqwish -h ; wfmash -h ; smoothxg -h; odgi version -h; gfaffix -h

CMD /bin/bash
