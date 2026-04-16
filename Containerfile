FROM alpine:latest

# Install Tectonic and Make
RUN apk update && apk add tectonic make biber font-noto

# Wrapper to inject search paths
RUN mv /usr/bin/tectonic /usr/bin/tectonic.bin && \
    echo '#!/bin/sh' > /usr/bin/tectonic && \
    echo 'exec /usr/bin/tectonic.bin -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex/bbx -Z search-path=/usr/share/texmf-dist/tex/latex/biblatex/cbx -Z search-path=/data/cv/lib -Z search-path=/data/resume/lib "$@"' >> /usr/bin/tectonic && \
    chmod +x /usr/bin/tectonic

WORKDIR /data
