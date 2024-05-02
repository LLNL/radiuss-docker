FROM ubuntu:22.04@sha256:edb5e75b15193226b1dd74f46d231f7df4d548802d81261c69934358c5f5a00d

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts

RUN ./scripts/ubuntu/setup.sh && \
    ./scripts/install-cmake-binary.sh && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
