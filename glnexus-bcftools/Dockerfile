FROM ubuntu:18.04 AS bcfbuilder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl-openssl-dev \
                       build-essential wget && \
    rm -rf /var/lib/apt/lists/*
RUN wget -O- https://github.com/samtools/bcftools/releases/download/1.19/bcftools-1.19.tar.bz2 | tar xvj &&  \
	cd bcftools-* && \
	./configure && \
	make && \
	make install

FROM ghcr.io/dnanexus-rnd/glnexus:v1.4.1
COPY --from=bcfbuilder /usr/local/ /usr/local/
CMD glnexus_cli

