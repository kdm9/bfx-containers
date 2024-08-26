FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install python3-pip python3-dev cython3 build-essential wget git && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install dysgu 'numpy<2' git+https://github.com/ryanlayer/samplot.git --break-system-packages -U 
