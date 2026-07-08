FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
ADD https://github.com/kdm9/NLRtracker/archive/refs/heads/master.zip /nlrtracker.zip
RUN apt-get update && \
    apt-get -y install r-base-dev r-recommended r-cran-tidyverse r-bioc-biostrings hmmer unzip && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/ && \
    cd /opt/ && \
    unzip /nlrtracker.zip && \
    mv NLRtracker-master nlrtracker && \
    chmod +x /opt/nlrtracker/NLRtracker.sh && \
    ln -s /opt/nlrtracker/NLRtracker.sh /usr/bin && \
    rm -f /nlrtracker.zip


