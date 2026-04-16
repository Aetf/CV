FROM alpine:latest

# Install Tectonic and Make
RUN apk update && apk add tectonic make biber font-noto

WORKDIR /data
