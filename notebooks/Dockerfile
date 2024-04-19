FROM debian:bookworm
ARG PORT=31888

RUN apt-get update && \
    apt-get -y install gcc r-base-core zlib1g-dev libbz2-dev liblzma-dev libcurl4-openssl-dev libssl-dev \
                       build-essential wget git meson ninja-build parallel pkg-config cmake \
                       python3-all-dev python3-pip pipx npm nodejs \
                       && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --break-system-packages jupyterlab jupyterlab nbconvert jupytext bash_kernel papermill jedi-language-server && \
    python3 -m bash_kernel.install && \
    npm install --save-dev bash-language-server \
    Rscript -e 'install.packages(c("IRkernel", "languageserver")); IRkernel::installspec()' 


CMD "jupyter lab --ip 0.0.0.0 --port ${PORT} --no-browser"
