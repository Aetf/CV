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

# Install Tectonic 0.16.8
RUN curl -L -o tectonic.tar.gz https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic@0.16.8/tectonic-0.16.8-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xzf tectonic.tar.gz && \
    mv tectonic /usr/bin/tectonic && \
    rm tectonic.tar.gz

# Install Biber 2.20 from local file
COPY biber-2.20.tar.gz /tmp/
RUN tar -xzf /tmp/biber-2.20.tar.gz -C /tmp && \
    mv /tmp/biber /usr/bin/biber && \
    rm /tmp/biber-2.20.tar.gz

WORKDIR /data
