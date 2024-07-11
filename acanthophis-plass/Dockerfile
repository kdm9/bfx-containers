FROM  ghcr.io/soedinglab/plass:latest
RUN apt-get update -y && apt-get install -y python3-pip && pip install --break-system-packages blindschleiche && rm -rf /var/lib/apt/lists/* && blsl
