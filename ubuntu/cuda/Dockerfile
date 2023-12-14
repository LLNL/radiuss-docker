ARG gcc_version
FROM ghcr.io/llnl/radiuss:gcc-$gcc_version

# Install llvm with spack
ARG cuda_version
ENV cuda_version=$cuda_version

RUN \
    sudo apt-get -qq update \
    && sudo apt-get -qq install -y --no-install-recommends \
        clang-${llvm_version} clang-format-${llvm_version} llvm-${llvm_version} \
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