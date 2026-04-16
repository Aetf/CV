FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    ca-certificates \
    fontconfig \
    fonts-noto \
    make \
    libgraphite2-3 \
    && rm -rf /var/lib/apt/lists/*

# Install Tectonic 0.15.0
RUN curl -L -o tectonic.tar.gz https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic@0.16.8/tectonic-0.16.8-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xzf tectonic.tar.gz && \
    mv tectonic /usr/bin/tectonic && \
    rm tectonic.tar.gz

# Install Biber 2.17 to match Tectonic's biblatex 3.17
RUN curl -L -o biber.tar.gz https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.17/binaries/Linux/biber-linux_x86_64.tar.gz && \
    tar -xzf biber.tar.gz && \
    mv biber /usr/bin/biber && \
    rm biber.tar.gz

WORKDIR /data
