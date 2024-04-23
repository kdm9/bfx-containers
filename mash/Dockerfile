FROM ubuntu:22.04 AS builder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install zlib1g-dev libgsl-dev capnproto libcapnp-dev libboost-all-dev \
                       build-essential wget patch && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /root/src
WORKDIR /root/src
ADD ./link-capnp.patch /root/src
RUN wget -q -O- https://github.com/marbl/Mash/archive/refs/tags/v2.3.tar.gz | tar xvz &&  \
	cd Mash-* && \
    patch Makefile.in /root/src/link-capnp.patch && \
    wget -q -O- 'https://salsa.debian.org/med-team/mash/-/raw/master/debian/patches/gcc-11.patch?inline=false'  \
        | patch -p1 && \
    autoconf && \
	./configure --with-gsl=/usr --with-capnp=/usr \
        LDFLAGS="-static -static-libgcc -static-libstdc++" && \
	make && \
	make install

FROM ubuntu:22.04
COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/man/ /usr/local/share/man
WORKDIR /
