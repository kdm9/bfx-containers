FROM ubuntu:24.04 AS builder
RUN apt-get update && \
    apt-get -y install \
        zlib1g-dev wget parallel python3 \
        zstd pigz python3-venv python3-setuptools python3-dev python3-pip tabix bedtools \
    && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /tmp/miniprot && \
	wget -q -O - https://github.com/lh3/miniprot/releases/download/v0.13/miniprot-0.13.tar.bz2 | \
	tar xvj &&\
	cd miniprot*/ && \
	sed -i -e 's,LIBS=	,LIBS=	-static -static-libgcc,'  Makefile && \
	make -j8 miniprot && \
	mkdir -p /usr/local/bin /usr/local/share/man/man1 && \
	mv miniprot /usr/local/bin && \
	mv miniprot.1 /usr/local/share/man/man1 && \
	cd .. && rm -rf /tmp/miniprot

RUN python3 -m venv /opt/lifton  && \
    /opt/lifton/bin/pip install lifton https://github.com/agshumate/Liftoff/archive/refs/heads/master.zip && \
    ln -s /opt/lifton/bin/lift{on,off} /usr/local/bin/

CMD /bin/bash

