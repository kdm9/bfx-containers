FROM ubuntu:24.04
ARG PORT=31888

RUN apt-get update && \
    apt-get -y install gcc r-base-core zlib1g-dev libbz2-dev libzmq3-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       libtiff-dev libcairo2-dev libxml2-dev libxslt1-dev libfreetype-dev libharfbuzz-dev \
                       libgdal-dev libfribidi-dev libudunits2-dev libunwind-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake \
                       python3-all-dev python3-pip pipx npm nodejs zsh locales zstd \
                       htop tmux curl vim \ 
                       && \
    echo 'en_GB.UTF-8 UTF-8' >/etc/locale.gen && locale-gen && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --break-system-packages \
        jupyterlab jupyterlab-vim nbconvert jupytext bash_kernel \
        papermill jedi-language-server && \
    python3 -m bash_kernel.install && \
    npm install -g bash-language-server && \
    Rscript -e 'install.packages(c("IRkernel", "languageserver")); IRkernel::installspec()' 

RUN wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh &&  \
    bash Miniforge3-Linux-x86_64.sh -b -p /opt/conda/ &&  \
    echo 'source "/opt/conda/etc/profile.d/conda.sh"' >>/etc/profile.d/conda.sh && \
    echo 'source "/opt/conda/etc/profile.d/mamba.sh"' >>/etc/profile.d/conda.sh && \
    echo 'source "/opt/conda/etc/profile.d/conda.sh"' >>/etc/zshenv && \
    echo 'source "/opt/conda/etc/profile.d/mamba.sh"' >>/etc/zshenv


CMD "jupyter lab --ip 0.0.0.0 --port ${PORT} --no-browser"
