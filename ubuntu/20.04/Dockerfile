FROM ubuntu:20.04@sha256:c97a46bb9b30a4a957464fd07c55f1612c800513bdbc7ff798ec08a6bd94b5ef

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts

RUN ./scripts/ubuntu/setup.sh && \
    ./scripts/install-cmake-binary.sh
