FROM ubuntu:22.04

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts

RUN ./scripts/ubuntu/setup.sh && \
    ./scripts/install-cmake-binary.sh && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
