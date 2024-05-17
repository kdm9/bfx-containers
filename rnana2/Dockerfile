FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install bash pigz samtools adapterremoval seqtk bowtie2 rsem && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash
