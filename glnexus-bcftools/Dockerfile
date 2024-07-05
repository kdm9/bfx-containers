FROM ubuntu:22.04 AS bcfbuilder
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc libncurses5-dev libncursesw5-dev \
                       zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev \
                       build-essential wget && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /workdir/

ADD https://github.com/samtools/bcftools/releases/download/1.20/bcftools-1.20.tar.bz2 /workdir/
RUN cd /workdir/ && \
    tar xvjf bcftools-1.20.tar.bz2 &&  \
	cd bcftools-* && \
	./configure && \
	make && \
	make install

FROM ubuntu:22.04
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq install -y libjemalloc2 bcftools tabix pv libcurl4

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2
ADD https://github.com/dnanexus-rnd/GLnexus/releases/download/v1.4.1/glnexus_cli /usr/local/bin
ADD https://github.com/mlin/spVCF/releases/download/v1.3.2/spvcf /usr/local/bin/
RUN chmod +x /usr/local/bin/spvcf /usr/local/bin/glnexus_cli
COPY --from=bcfbuilder /usr/local/ /usr/local/
CMD glnexus_cli
