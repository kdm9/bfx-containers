FROM debian
ENV VERSION=2.0.5
ADD https://github.com/alekseyzimin/EviAnn_release/releases/download/v${VERSION}/EviAnn-${VERSION}.tar.gz /opt/
RUN export DEB_FRONTEND=noninteractive && \
    apt-get update && apt-get update -y && \
    apt-get install -y samtools stringtie build-essential zlib1g-dev wget minimap2 hisat2 ncbi-blast+ && \
    cd /opt && \
    tar xvf EviAnn-${VERSION}.tar.gz && \
    cd EviAnn-${VERSION}/ && \
    bash install.sh && \
    cp -r /opt/EviAnn-${VERSION}/bin/* /usr/local/bin/ && \
    rm -rf /opt/EviAnn-${VERSION}.tar.gz /var/lib/apt/lists/ /var/cache/apt/archives/ ; \
    /usr/local/bin/eviann.sh --help || true
WORKDIR /wd
