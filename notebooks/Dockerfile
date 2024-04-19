FROM debian:bookworm
ARG PORT=31888

RUN apt-get update && \
    apt-get -y install gcc r-base-core zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       libtiff-dev libcairo2-dev libxml2-dev libxslt1-dev libfreetype-dev libharfbuzz-dev \
                       libgdal-dev libfribidi-dev libudunits2-dev libunwind-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake \
                       python3-all-dev python3-pip pipx npm nodejs zsh \
                       && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --break-system-packages jupyterlab jupyterlab nbconvert jupytext bash_kernel papermill jedi-language-server && \
    python3 -m bash_kernel.install && \
    npm install -g bash-language-server && \
    Rscript -e 'install.packages(c("IRkernel", "languageserver", "tidyverse")); IRkernel::installspec()' 


CMD "jupyter lab --ip 0.0.0.0 --port ${PORT} --no-browser"
