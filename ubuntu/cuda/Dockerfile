ARG ubuntu_version
FROM ghcr.io/llnl/radiuss:gcc-12-ubuntu-${ubuntu_version}

ARG cuda_version
ENV cuda_version=$cuda_version

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin \
    && mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub  \
    && add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends cuda-${cuda_version} \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
    
USER radiuss

RUN echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc \
    && echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

WORKDIR /home/radiuss
