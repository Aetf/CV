FROM ubuntu:24.04

RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.kernel.org/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && apt-get install -y \
    curl \
    tar \
    ca-certificates \
    fontconfig \
    libgraphite2-3 \
    && rm -rf /var/lib/apt/lists/*

# Install Tectonic 0.16.8
RUN curl -L -o tectonic.tar.gz https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic@0.16.8/tectonic-0.16.8-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xzf tectonic.tar.gz && \
    mv tectonic /usr/bin/tectonic && \
    rm tectonic.tar.gz

# Install Biber 2.20 to match the new bundle
RUN curl -L -o biber.tar.gz https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.20/binaries/Linux/biber-linux_x86_64.tar.gz/download && \
    tar -xzf biber.tar.gz && \
    mv biber /usr/bin/biber && \
    rm biber.tar.gz

WORKDIR /data
