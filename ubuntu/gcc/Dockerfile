ARG ubuntu_version
FROM ghcr.io/llnl/radiuss:ubuntu-$ubuntu_version

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ARG gcc_version
ENV gcc_version=$gcc_version

RUN \
    sudo apt-get -qq update \
    && sudo apt-get -qq install -y --no-install-recommends \
         g++-${gcc_version} \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${gcc_version} 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${gcc_version} 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-${gcc_version} 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-${gcc_version} 100 \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean

USER radiuss
WORKDIR /home/radiuss
