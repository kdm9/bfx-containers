FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && \
    apt-get -y install wget python3-pip zstd xz-utils adapterremoval pigz default-jre zip && \
    rm -rf /var/lib/apt/lists/* 

RUN wget -O /usr/local/bin/seqhax https://github.com/kdm9/seqhax/releases/download/0.8.10/seqhax && chmod +x /usr/local/bin/seqhax
RUN wget -O /tmp/fqc.zip https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip && \
	mkdir /opt/fastqc/ && cd /opt/fastqc && \
	unzip /tmp/fqc.zip && rm /tmp/fqc.zip && \
	ln -s /opt/fastqc/FastQC/fastqc /usr/local/bin
RUN pip install --break-system-packages blindschleiche
