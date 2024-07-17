ARG ubuntu_version
FROM ghcr.io/llnl/radiuss:ubuntu-$ubuntu_version

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch,David Beckingsale <beckingsale1@llnl.gov>"
LABEL org.opencontainers.image.source=https://github.com/LLNL/radiuss-docker

ARG llvm_version
ENV llvm_version=${llvm_version}

RUN \
    sudo apt-get -qq update \
    && sudo apt-get -qq install -y --no-install-recommends \
        clang-${llvm_version} clang-format-${llvm_version} llvm-${llvm_version} libomp-${llvm_version}-dev \
    && sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${llvm_version} 100 \
    && sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${llvm_version} 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${llvm_version} 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${llvm_version} 100 \
    && sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-${llvm_version} 100 \
    && sudo update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-${llvm_version} 100 \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean
    
USER radiuss
WORKDIR /home/radiuss
