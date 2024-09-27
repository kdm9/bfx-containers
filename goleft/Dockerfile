FROM ubuntu:24.04
ARG GOLEFT_VERSION=0.2.6

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install bash && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/brentp/goleft/releases/download/v${GOLEFT_VERSION}/goleft_linux64 /usr/local/bin/goleft
RUN chmod +x /usr/local/bin/goleft
RUN goleft || true


