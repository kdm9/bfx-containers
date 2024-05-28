FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install fastp bash pigz mmseqs2 seqtk bowtie2 rsem && \
    rm -rf /var/lib/apt/lists/*
CMD /bin/bash
