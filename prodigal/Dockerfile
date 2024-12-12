FROM ubuntu:18.04 as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    zip \
    zlib1g-dev

ADD https://github.com/hyattpd/Prodigal/archive/refs/heads/GoogleImport.zip /prodigal.zip
RUN mkdir /wd && cd /wd && unzip /prodigal.zip && cd Prodigal* && sed -i -e 's/LFLAGS = /LFLAGS = -static /' Makefile &&  make && make install

FROM ubuntu:24.04
COPY --from=builder /usr/local/bin/ /usr/local/bin/
