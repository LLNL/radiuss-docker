FROM ubuntu:22.04@sha256:8eab65df33a6de2844c9aefd19efe8ddb87b7df5e9185a4ab73af936225685bb

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts

RUN ./scripts/ubuntu/setup.sh && \
    ./scripts/install-cmake-binary.sh && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
