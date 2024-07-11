FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install wget python3-pip zstd xz-utils && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --break-system-packages "blindschleiche>=0.3.1"

RUN mkdir /tmp/build && cd /tmp/build \
    && wget -O- -q https://github.com/bbuchfink/diamond/releases/download/v2.1.9/diamond-linux64.tar.gz | tar xzv \
    && mv diamond /usr/local/bin \
    && cd / && rm -rf /tmp/build


