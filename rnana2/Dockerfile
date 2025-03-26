FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install bash pigz samtools adapterremoval seqtk bowtie2 rsem rna-star subread && \
    rm -rf /var/lib/apt/lists/*
ADD https://github.com/kdm9/seqhax/releases/download/0.8.10/seqhax /usr/local/bin/seqhax
RUN chmod +x  /usr/local/bin/seqhax
CMD /bin/bash
