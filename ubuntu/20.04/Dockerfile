FROM ubuntu:20.04@sha256:0b897358ff6624825fb50d20ffb605ab0eaea77ced0adb8c6a4b756513dec6fc

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts

RUN ./scripts/ubuntu/setup.sh && \
    ./scripts/install-cmake-binary.sh
