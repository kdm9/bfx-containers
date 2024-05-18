FROM ubuntu:24.04
RUN apt-get update && \
    apt-get -y install wget python3-pip zstd xz-utils adapterremoval pigz && \
    rm -rf /var/lib/apt/lists/* 

RUN wget -O /usr/local/bin/seqhax https://github.com/kdm9/seqhax/releases/download/0.8.10/seqhax && chmod +x /usr/local/bin/seqhax

RUN pip install --break-system-packages blindschleiche
