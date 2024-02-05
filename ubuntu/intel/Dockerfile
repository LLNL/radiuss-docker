ARG ubuntu_version
FROM ghcr.io/llnl/radiuss:ubuntu-$ubuntu_version

# Install intel-oneapi with spack
ARG intel_version
ENV intel_version=$intel_version

ENV DEBIAN_FRONTEND noninteractive

RUN \
    sudo mkdir --parents --mode=0755 /etc/apt/keyrings \
    && wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends intel-hpckit-${intel_version} \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

USER radiuss

RUN echo 'source /opt/intel/oneapi/setvars.sh 2>&1 > /dev/null' >> ~/.bashrc

WORKDIR /home/radiuss